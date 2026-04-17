# pdflatex é o compilador padrão, mas pode ser alterado para lualatex ou xelatex
$pdf_mode = 1;

# ----------------------------------------------------------------- #
# Configurações para compilar usando o LuaLaTeX
# ----------------------------------------------------------------- #
#
# Para usar o LuaLaTeX, descomente as duas linhas abaixo
#
#$pdf_mode = 4;
#$pdflatex = 'lualatex %O %S';
# ----------------------------------------------------------------- #

# ----------------------------------------------------------------- #
# Define o diretório de saída dos arquivos gerados pela compilação
# ----------------------------------------------------------------- #
$out_dir = 'outlatexdir';