#!/bin/bash

a=3
b=2
c=1

# usando o operador E
if [ $a -gt $b ] && [ $a -gt $c ];
	then
		echo "A e' o maior"
	else
		echo "A nao e' o maior"
fi

# outra forma para usar o operador E
if [ $a -gt $b -a $a -gt $c ];
	then
		echo "A e' o maior"
	else
		echo "A nao e' o maior"
fi
