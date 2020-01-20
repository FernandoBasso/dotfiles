#!/bin/bash

function usage {
    printf "%s %s\n" "${0##*/}" WORD
}


if [[ -z "$1" ]] ; then
    usage
    exit 1
fi

query="$1"

opera --new-tab "https://dictionary.cambridge.org/us/dictionary/english/${query}"
opera --new-tab "https://en.oxforddictionaries.com/definition/seam/${query}"
opera --new-tab "http://www.dictionary.com/browse/${query}?s=t"
opera --new-tab "https://www.macmillandictionary.com/us/dictionary/american/${query}"
opera --new-tab "https://dictionary.cambridge.org/us/dictionary/english-portuguese/${query}"
opera --new-tab "http://michaelis.uol.com.br/moderno-ingles/busca/ingles-portugues-moderno/${query}"
opera --new-tab "http://dictionary.reverso.net/english-portuguese/${query}"

