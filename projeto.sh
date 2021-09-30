#!/bin/bash

source functions.sh
site=$1
read -p "Digite um site: " site
wget $site -O temp/index &> /dev/null
if [ $? != 0 ];then
  echo "Erro! Site inexistente!"
  exit 0
fi

while true; do
  echo -e "\nPÁGINA -> $site\n"
	echo -e "=========MENU=========="
	echo -e "* 1) Exibir PÁGINA    *"
	echo -e "* 2) Listar LINKS     *"
	echo -e "* 3) Acessar LINK     *"
	echo -e "* 4) Listar IMAGENS   *"
	echo -e "* 5) Baixar IMAGENS   *"
	echo -e "* e) Sair do programa *\n"
	
	read -p 'Digite uma OPÇÃO: ' opc
  case $opc in
    "1") v1 $site;;
    "2") v2 $site;;
    "3") v3 ;;
    "4") v4 ;;
    "5") v5 ;;
    "e") v6 ;;
      *) echo -e "Ops! Digite um valor válido! " ;;
  esac
done
