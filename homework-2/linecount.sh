#!/bin/bash
function linecount()
{
	path=$1 
        shopt -s globstar nullglob dotglob
        if [[ "$1" != "" ]];then
		directory=`ls -R $path | grep ":$"| sed "s/://g" `
		num1=0
		for subdir in $directory; do
			files=`echo $subdir/*`
			if (( ${#files} ));then
				num2=`cat $files|wc -l`
			else
				num2=0
			fi
			num1=$(($num1+$num2))
		done
		printf "the directory contains %s lines" "$num1"

        else
            echo 0
        fi
}
linecount $1

