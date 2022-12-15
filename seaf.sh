#!/usr/bin/env bash

function search_find(){
    echo "Inicializando a pesquisa para usuário: "$(whoami)
    echo "Local de pesquisa atual: "$PWD

    date_format=$(date '+%d/%m/%Y')

    printf "data de hoje é: "$date_format"\n"
    
    _searchp=$(find . -type d,f -perm /u+rw,g+rw,o+x -mtime +30 -user $(whoami) -size 4G)

    if [ $_searchp ]; then
        printf "Encontramos arquivos com mais de 4 gigabytes em seu pc a mais de 30 dias ocupando espaço em disco."
    else
        printf "Não conseguimos encontrar nada com mais de 30 dias no seu pc ocupando espaço."
    fi
}
search_find
