#!/bin/bash
# 2026-03-19 Emerson Mello

# Script para compilar todos os arquivos .tex deste repositório usando latexmk
# Os arquivos PDFs resultantes serão salvos no diretório 'output'

# Caminho absoluto do diretório raiz do projeto
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_DIR="$ROOT_DIR/output"

# Cria o diretório output se não existir
mkdir -p "$OUTPUT_DIR"

compilar() {
    local DIR="$1"
    cd "$DIR" || return
    # Verifica se existem arquivos .tex e .latexmkrc no diretório
    if ls *.tex 1> /dev/null 2>&1 && [ -f .latexmkrc ]; then
        for texfile in *.tex; do
            if [ -f "$texfile" ]; then
                
                # Compilando 
                latexmk -pdf -interaction=nonstopmode "$texfile"
                pdfname="${texfile%.tex}.pdf"
                
                if [ -f "$pdfname" ]; then
                    
                    # Remove './' do início do caminho do diretório
                    local clean_dir="${DIR#./}"
                    
                    # Nomeia o PDF com o caminho do diretório e o nome do arquivo .tex
                    dest_pdf="$OUTPUT_DIR/${clean_dir//\//_}_$pdfname"
                    mv -f "$pdfname" "$dest_pdf"
                fi
                latexmk -c "$texfile"
            fi
        done
    fi
    cd "$ROOT_DIR" || exit 1
}

# Percorre todos os subdiretórios recursivamente
find . -type d | while read -r dir; do
    # Ignora o diretório output
    if [[ "$dir" != "." && "$dir" != "./output" ]]; then
        compilar "$dir"
    fi
done

clear
echo "Compilação finalizada."
