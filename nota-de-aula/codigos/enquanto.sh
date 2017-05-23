#!/bin/bash

num=10

while [ $num -gt 0 ]; do
	echo "contando $num"
	num=$((num-1))
done


#----------------------------#
#usando o operador de negação '!'

num=10

while ! [ $num -eq 0 ]; do
	echo "contando $num"
	num=$((num-1))
done
