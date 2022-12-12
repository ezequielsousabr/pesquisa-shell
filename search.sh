#!/usr/bin/env bash

function search_find(){
    echo "Inicializando a pesquisa para usuário: "$(whoami)
    
    _search=$(find . -type d,f -name *.iso -mtime 30 -user $(whoami) -size 4G)
    
    if [ _search -eq 1 ]; then
        echo "Encontramos arquivos com mais de 4 gigabytes em seu pc."
    else
        echo "Não conseguimos encontrar nada com mais de 30 dias no seu pc ocupando espaço."
    fi
}
search_find
