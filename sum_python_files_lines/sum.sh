#!/bin/bash
re_extension="py"
function lm_traverse_dir(){
	#for file in $(ls $1)		#与下面一行等价
    for file in `ls $1`       	#注意两个反引号，获取命令执行的结果
    do
        if [ -d $1"/"$file ]  	#"-d" 判断是否为目录，注意此处之间一定要加上空格，否则会报错
        then
            lm_traverse_dir $1"/"$file	#遍历子目录
        else  
            # 可以在这里处理文件，比如改名、删除等
            effect_name=$1"/"$file		#注意"="前后不要留空格
            extension="${file##*.}"
            if [ $extension = $re_extension ] 
            then
                echo $effect_name
                fileLines=`sed -n '$=' $effect_name`
                let sum=$sum+$fileLines
            fi
        fi
    done
}   
sum=0
# 执行命令
lm_traverse_dir $1
echo $sum