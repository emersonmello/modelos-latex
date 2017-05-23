#!/bin/bash

echo -n "Entre com um numero de 1 a 5: "
read numero

case $numero in
	1)
		echo "Voce escolheu 1"
		;;
	2)
		echo "Voce escolheu 2"
		;;
	3)
		echo "Voce escolheu 3"
		;;
	4 | 5)
		echo "Voce escolheu 4 ou 5"
		;;
	*)
		echo "Voce escolheu um numero diferente de 1, 2, 3, 4 ou 5"
		;;
esac
