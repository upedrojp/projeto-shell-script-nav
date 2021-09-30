function v1() {
  clear
  echo -e "Página -> $1\n"
	cat temp/index | sed -r 's/$/as/g' | tr '\n' '2' |sed 's/<[^>]*>//g' | sed 's/as2/\n/g'
  read -p "Digite algo para continuar no programa..."
}

function v2() {
  #CAPTANDOS LINKS
  cat temp/index | grep -o -E '(<a.*?href=["])([^"]*)(.*)' | sed -r 's/(<a.*?href=["])([^"]*)(.*)/\2/g' > temp/links
  
  #ORDENANDO LINKS PARA QUE FIQUEM COM SITE
  contador=0
  rm temp/linksformatados &> /dev/null
  while read -r linha; do
    contador=$(( $contador + 1 ))
    linhas=$(cat temp/links | sed $contador'!d')
    if [ $(echo $linhas | grep -Eo '^.') == "/" ]; then
      echo "$site$linha" >> temp/linksformatados
    else
      echo "$linha" >> temp/linksformatados
    fi
  done < temp/links
  
  #EXIBINDO LINKS
  echo -e "=============links============="
  cat -n temp/linksformatados
  echo -e "==============================="
  read -p "Digite algo para continuar no programa..."
}

function v3() {
  clear
  echo -e "\nLinks disponíveis para serem acessado!\n"
  cat -n temp/linksformatados
  read -p "Digite um número no link: " num
  cont=0
  while read -r linha; do
  cont=$(( $cont + 1 ))
  lin=$(cat temp/linksformatados | sed $cont'!d')
    if [ $num -eq $cont ]; then
        site=$lin
        wget $lin -O temp/index &> /dev/null
    fi
  done < temp/linksformatados	
}

function v4() {
    cat temp/index | grep -o -E '(<img.*?src=["])([^"]*)(["].*?\/?>)' | sed -r 's/(<img.*?src=["])//g' | sed -r 's/(["].*?\/?>)//g' &> temp/linksimg

  contador=0
  rm temp/linksimg1 &> /dev/null
  while read -r linha; do
    contador=$(( $contador + 1 ))
    linhas=$(cat temp/linksimg | sed $contador'!d')
    if [ $(echo $linhas | grep -Eo '^.') == "/" ]; then
      echo "$site$linha" >> temp/linksimg1
    else
      echo "$linha" >> temp/linksimg1
    fi
  done < temp/linksimg

  cat -n temp/linksimg1 &> /dev/null
  if [ $? != 0 ]; then
    echo -e "\nEsse site não tem imagens!\n"
  else
    cat -n temp/linksimg1
  fi
}

function v5() {
  clear
  cat -n temp/linksimg1 &> /dev/null
  if [ $? != 0 ]; then
    echo "Não é possivel fazer Download de imagens!"
  else
    echo -e "\nImagens para serem baixadas!\n"
    cat -n temp/linksimg1
    read -p "Digite o número da imagem pra ser baixada: " num
  fi
  
  cont=0
  while read -r linha; do
  cont=$(( $cont + 1 ))
  lin=$(cat temp/linksimg1 | sed $cont'!d')
    if [ $num -eq $cont ]; then
    wget $lin &> /dev/null
    sleep 2
    echo -e "\nDownload Concluído!\n"
    fi
  done < temp/linksimg1
}
function v6 () {
  rm temp/index &> /dev/null
  rm temp/links &> /dev/null
  rm temp/linksimg &> /dev/null
  rm temp/linksimg1 &> /dev/null
  rm temp/linksformatados &> /dev/null
  exit 0
}


