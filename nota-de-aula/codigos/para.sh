#!/bin/bash

for contador in `seq 1 10`; do
	echo $contador
done

# percorrendo uma lista de palavras separadas por espaco
lista="FIC Linux Redes IFSC"

for palavra in $lista; do
	echo "Palavra $palavra"
done

# Listando todos os arquivos de um diretório
# lista=`ls -1`
for arquivo in `ls -1`; do
	echo "Nome do arquivo: $arquivo" 
done
