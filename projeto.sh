#!/bin/bash

function v1() {
	echo -e "\nExibir PAG\n"

}

function v2() {
	echo -e "\nListar LINKS\n"

}

function v3() {
	echo -e "\nAcessar LINKS\n"
	
}

function v4() {
	echo -e "\nListar imagens\n"

}

function v5() {
	echo -e "\nBaixar imagens\n"

}
while true; do
	
	echo -e "OPÇÕES"
	echo -e "1) Exibir PÁGINA"
	echo -e "2) Listar LINKS"
	echo -e "3) Acessar LINK"
	echo -e "4) Listar IMAGENS"
	echo -e "5) Baixar IMAGENS"
	echo -e "E) SAIR"
	
	read -p 'Digite uma OPÇÃO: ' opc

	case $opc in
		"1") v1 ;;
		"2") v2 ;;
		"3") v3 ;;
		"4") v4 ;;
		"5") v5 ;;
		"E") break ;;
		*) echo -e "Ops! Digite um valor válido! " ;;
	esac
done
