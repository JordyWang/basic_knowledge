#!/bin/bash

function check(){
    tempwords=$(mktemp)
    tempdicts=$(mktemp)
    tempwords1=$(mktemp)
    tempdicts1=$(mktemp)
    words=$(cat $1 | tr A-Z a-z)
    for word in ${words[@]}
    do
        echo $word >> $tempwords1
    done
    dicts=$(cat $2)
    for dict in ${dicts[@]}
    do
        echo $dict >> $tempdicts1
    done
    sort -u $tempwords1 > $tempwords
    sort -u $tempdicts1 > $tempdicts
    comm -23 $tempwords $tempdicts
    rm -f $tempwords1 $tempdicts1 $tempwords $tempdicts
}
check $1 $2
