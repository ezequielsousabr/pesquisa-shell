#!/usr/bin/env bash

function search_find(){
    echo "Inicializando a pesquisa para usuário: "$(whoami)
    echo "Local de pesquisa atual: "$PWD
    
    _search=$(find . -type d,f -perm /u+rw,g+rw,o+x -mtime +30 -user $(whoami) -size 4G)
    
    if [ _search = 0 ]; then
        echo "Encontramos arquivos com mais de 4 gigabytes em seu pc."
    else
        echo "Não conseguimos encontrar nada com mais de 30 dias no seu pc ocupando espaço."
    fi
}
search_find
