#!/usr/bin/env bash
# --------------------------------------------------------------------
# Autor: Ezequiel Sousa
# Profissão: Operador de Computador
# ./pesquisa.sh
# Desde: sex dez 16 13:13:00 BRT 2022
# Versão: 1.0
# Licença: MIT
# Script usando comando find
# Verifica o diretório do usuário buscando por arquivos e dirétórios
# Com + de 30 dias que possuem tamanho de 4096 Megabytes.
# --------------------------------------------------------------------
LC_TIME=pt_BR.UTF-8

pesquisa(){
    # Informações de $USER e $PATH
    echo "Inicializando a pesquisa para usuário: "$(whoami)
    echo "Local de pesquisa atual: "$PWD

    # Formata a data atual para pt-br
    date_format=$(date '+%d/%m/%Y')

    printf "data de hoje é: "$date_format"\n"
    
    checar=$(find ~/ \
        -type d,f \
        -mtime +30 \
        -user $(whoami) \
        -size +4096M \
        -fprint /tmp/pesquisa.log) \
        2> /dev/null

    listen_log=$(/usr/bin/cat /tmp/pesquisa.log)
    verifica=$(du -m /tmp/pesquisa.log)

    # Verifica o arquivo de log e imprime a saída se verdadeiro
    # Caso contrario, deleta o arquivo com 0 bytes.
    if [[ /tmp/pesquisa.log ]];
    then
        printf "Encontramos algo para voce! Listando...\n Arquivo de log: /tmp/pesquisa.log\n $listen_log"
    else
        delete_log=$(/usr/bin/rm /tmp/pesquisa.log)
        printf "Parece que está tudo certo!\n"
        printf "Deletando arquivo de log vazio... /tmp/pesquisa.log\n"
    fi
}
pesquisa
