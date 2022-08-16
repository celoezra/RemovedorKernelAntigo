#!/bin/bash

#remove kernel antigo
#celoezra

echo "Kernel Atual Do Sistema"
uname -r
echo
echo "Kernels Encontrados no Sistema"
dpkg-query -l | awk '/linux-image-*/ {print $2}'
echo
echo sleep 5
echo "Deseja excluir os kernels antigos? s/n"
read -n1 escolha

case $escolha in
	S|s) echo
		echo Removendo Kernel Antigo
		dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge
		sudo update-grub;;
	N|n) echo
		echo Operação Cancelada
			sleep 5;;
	*) echo
		echo Opção Inválida. Digite apenas s ou n;;
esac
 
