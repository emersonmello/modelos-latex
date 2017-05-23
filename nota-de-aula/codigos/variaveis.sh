#!/bin/bash

# Isto é um comentário. Todo texto após o caracter # não será interpretado pela shell

echo "Trabalhando com variaveis"

a=1
b=2
c=`expr $a + $b` # a expressao está entre crases
d=$((c+a))

echo "O valor de a e' $a, o valor de b e' $b, o valor de c e' $c e o valor de d e' $d"

curso="FIC Linux"

echo "O conteudo de curso e' $curso"

# outro exemplo
versao=$(uname -r)

echo "A versao do kernel e' $versao"
