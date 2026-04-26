![GitHub License](https://img.shields.io/github/license/emersonmello/modelos-latex?logo=creativecommons&logoColor=white&color=blue)
![GitHub repo size](https://img.shields.io/github/repo-size/emersonmello/modelos-latex?logo=github&logoColor=white)

# Modelos em LaTeX para docentes e discentes

Modelos em LaTeX que uso em minhas aulas ou em outras atividades no Instituto Federal de Santa Catarina (IFSC). Os modelos podem ser facilmente adaptados para outros contextos, como por exemplo, para o uso em outras instituições de ensino.

## Modelos para área acadêmica

### Apresentação (*slides* com Beamer)

- [Tema *IFSClean*](apresentacao/ifsclean)
- [Tema *IFSCyan*](apresentacao/ifscyan)
- [Tema *Título Leve*](apresentacao/titulo-leve)

### Lista de exercício ou prova

- [Modelo que faz uso da classe `exam`](lista-ou-prova), possível incluir questões de múltipla escolha e dissertativas, podendo imprimir as respostas ou não.

### Notas de aula

- [Modelo de notas de aula](nota-de-aula), ideal para apresentar assuntos abordados em sala de aula, com a possibilidade de incluir exercícios e referências bibliográficas.

### Relatórios

- [Modelo que faz uso da classe `article`](relatorio), ideal para relatórios de disciplinas e laboratórios.


## Modelos para a área administrativa

### ATA de reunião

- [Modelo de ATA de reunião informal](ata-reunioes) baseado no artigo *Minutes in Less That Hours: Using LaTeX Resources* de Jimm Hefferon.

### Instrução normativa

- [Modelo para gerar documentos](instrucao-normativa) que requer a organização do texto em artigos, parágrafos, incisos e alíneas, como  instruções normativa, regulamentos e resoluções.


## Fontes necessárias para compilar os arquivos .tex

### Com LuaLaTeX

Para usar o compilar LuaLaTeX é necessário ter as seguintes fontes instaladas no sistema:

- [Inconsolata](https://fonts.google.com/specimen/Inconsolata)
    - Fonte monoespaçada usada para código-fonte e outros elementos que requerem espaçamento fixo.

Execute o comando `luaotfload-tool --update` no terminal para atualizar a base de fontes do LuaLaTeX e assim ele poderá encontrar a fonte Inconsolata para compilar os arquivos .tex corretamente. Esse comando costuma demorar um pouco devido ao número de fontes instaladas no sistema. 


## Configuração do latexmk para usar os modelos deste repositório

Espera-se que seja usado o aplicativo [latexmk](https://mgeier.github.io/latexmk.html) para compilar os arquivos .tex. Para tal crie um arquivo de configuração `.latexmkrc` no diretório home do usuário com o seguinte conteúdo:

```perl
# ----------------------------------------------------------------- #
# Define o caminho para os arquivos de classe personalizados
# ----------------------------------------------------------------- #
# Substitua pelo caminho onde clonou o repositório de modelos-latex
# Exemplo:
my $latex_classes_dir = '/home/usuario/modelos-latex';
# ----------------------------------------------------------------- #

ensure_path( 'TEXINPUTS', "$latex_classes_dir/classes//" );
ensure_path( 'TEXINPUTS', "$latex_classes_dir/apresentacao/ifsclean//" );
ensure_path( 'TEXINPUTS', "$latex_classes_dir/apresentacao/ifscyan//" );

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
```

## Licença
Os modelos neste repositório estão sob a licença [Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/deed.pt-br), isso significa que o autor abriu mão dos direitos de autor, e a obra pode ser usada, modificada e distribuída livremente, sem a necessidade de autorização.