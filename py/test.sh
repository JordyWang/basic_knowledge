#!/bin/bash

p_pid=$(ps -ef | grep timesleep.py |grep -v grep|awk '{print $2}')


if [ $1 = "pnum" ]
then
	echo echo $p_pid | wc -l
fi



if [ $1 = "start" ]
then
	if [ ! -z "$p_pid" ]
	then
		echo "进程已运行"
	else
		nohup python timesleep.py >timesleep_log.out &
		echo "进程已开启"
	fi

fi


if [ $1 = "reset" ]
then
	if [  -z "$p_pid" ]
	then
		echo "进程未运行"
	else
		kill -15 p_pid
		nohup python timesleep.py >timesleep_log.out &
		echo "进程已重启"
	fi
fi


if [ $1 = "shutdown" ]
then
	if [  -z "$p_pid" ]
	then
		echo "进程未运行"
	else
		kill -15 p_pid
		echo "进程已关闭"
	fi
fi


