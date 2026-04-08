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

- [Inter](https://rsms.me/inter/)
- [Inconsolata](https://fonts.google.com/specimen/Inconsolata)

Execute o comando `luaotfload-tool --update` no terminal para atualizar a base de fontes do LuaLaTeX e assim ele poderá encontrar as fontes Inter e Inconsolata para compilar os arquivos .tex corretamente. Esse comando costuma demorar um pouco devido ao número de fontes instaladas no sistema. 

### Com pdfLaTeX

Com o pdfLaTeX é necessário instalar as seguintes fontes usando o gerenciador de pacotes do TeX Live (`tlmgr`). No Linux ou macOS, execute o seguinte comando no terminal:
```bash
sudo tlmgr install inter inconsolata unicode-math
```

## Configuração do latexmk para usar os modelos deste repositório

Espera-se que seja usado o aplicativo [latexmk](https://mgeier.github.io/latexmk.html) para compilar os arquivos .tex. Para tal crie um arquivo de configuração `.latexmkrc` no diretório home do usuário com o seguinte conteúdo:

```perl
# ------------------------------------------ #
# Substitua pelo caminho onde clonou o repositório de modelos-latex
# Exemplo:
my $latex_classes_dir = '/home/usuario/modelos-latex';
# ------------------------------------------ #  

ensure_path( 'TEXINPUTS', "$latex_classes_dir/classes//" );
ensure_path( 'TEXINPUTS', "$latex_classes_dir/apresentacao/ifsclean//" );
ensure_path( 'TEXINPUTS', "$latex_classes_dir/apresentacao/ifscyan//" );

# Usar lualatex
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Tornar lualatex o padrão
$pdf_mode = 4;

# Forçar o uso do lualatex
$pdflatex = 'lualatex %O %S';

# Descomente caso queira que os arquivos de saída (PDF, log, etc.) 
# sejam gerados em um diretório específico, por exemplo, `outlatexdir`
# $out_dir = 'outlatexdir';
```



## Licença
Os modelos neste repositório estão sob a licença [Creative Commons Zero (CC0)](https://creativecommons.org/publicdomain/zero/1.0/deed.pt-br), isso significa que o autor abriu mão dos direitos de autor, e a obra pode ser usada, modificada e distribuída livremente, sem a necessidade de autorização.