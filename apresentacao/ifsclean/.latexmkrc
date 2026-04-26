# ----------------------------------------------------------------- #
# Configurações para compilar usando o pdflatex ou LuaLaTeX
# ----------------------------------------------------------------- #
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# ----------------------------------------------------------------- #
# Escolha o modo de compilação desejado (pdflatex ou LuaLaTeX)
# ----------------------------------------------------------------- #
# pdflatex é o modo padrão
$pdf_mode = 1;
#
# Para usar o LuaLaTeX, descomente a linha abaixo
# $pdf_mode = 4;
# ----------------------------------------------------------------- #

# ----------------------------------------------------------------- #
# Define o diretório de saída dos arquivos gerados pela compilação
# ----------------------------------------------------------------- #
$out_dir = 'outlatexdir';

