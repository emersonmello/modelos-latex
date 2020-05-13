# Modelo de Relatório Técnico

Esse modelo faz uso da classe `report` e apresenta um exemplo de como gerar glossário e lista de siglas com o pacote [glossaries-extra](https://www.ctan.org/pkg/glossaries-extra) e com a ferramenta [bib2gls](https://www.ctan.org/pkg/bib2gls). Para as referências bibliográficas foi feito uso do estilo fornecido pelo pacote [abnTeX2](https://github.com/abntex/abntex2).

## Histórico de versões do documento

A semântica da numeração das versões que colocará no relatório deve seguir a orientação descrita no documento [Semantic Versioning 2.0.0](https://semver.org/).

Dada uma revisão numerada como `MAIOR.MENOR.CORREÇÃO`, incremente esses componentes da seguinte forma:

1. `MAIOR` quando as alterações tornarem a nova versão incompatível com a versão anterior;
2. `MENOR` quando as alterações adicionarem novos capítulos, seções ou parágrafos e que ainda assim mantém compatibilidade com a versão anterior do documento;
3. `CORREÇÃO` quando fizer pequenas correções e ajustes no documento.

O primeiro ambiente que deve ser criado e atualizado na escrita deste tipo de relatório é o ambiente `histórico` que está logo após o comando `\begin{document}`. 
```tex
%-----------------------------%
% Histórico de revisões do presente documento
%-----------------------------%
\begin{historico}
  % \revisao{1.1.0}{04.05.2020}{Adição da seção exemplo}
  % \revisao{1.0.1}{04.05.2020}{Correção de erros ortográficos}
  \revisao{1.0.0}{04.05.2020}{Versão inicial}
\end{historico}
%-----------------------------%
```


## Configurações para o script [latexmk](https://mg.readthedocs.io/latexmk.html)

Para quem usa a o script [latexmk](https://mg.readthedocs.io/latexmk.html) para compilar, abaixo são apresentadas [instruções](https://tex.stackexchange.com/questions/1226/how-to-make-latexmk-use-makeglossaries/1228#1228) que ajudam a gerar o glossário por meio dele. 

As instruções abaixo podem estar no arquivo de configuração global, no home do usuário (`$/.latexmkrc`), ou dentro do diretório desse projeto de relatório `.latexmkrc`. 

O presente projeto já possui esse arquivo [.latexmkrc](.latexmkrc). Atente-se que é um arquivo oculto.

```perl
# https://tex.stackexchange.com/questions/400325/latexmkrc-for-bib2gls
push @file_not_found, '^Package .* No file `([^\\\']*)\\\'';
print("GLOBAL LATEXMK: Glossaries Module...\n");

add_cus_dep('aux', 'glstex', 0, 'run_bib2gls');

sub run_bib2gls {
  if ( $silent ) {
    my $ret = system "bib2gls --silent --group '$_[0]'";
  } else {
    my $ret = system "bib2gls --group '$_[0]'";
  };
  my ($base, $path) = fileparse( $_[0] );
  if ($path && -e "$base.glstex") {
    rename "$base.glstex", "$path$base.glstex";
  }
  # Analyze log file.
  local *LOG;
  $LOG = "$_[0].glg";
  if (!$ret && -e $LOG) {
    open LOG, "<$LOG";
    while (<LOG>) {
      if (/^Reading (.*\.bib)\s$/) {
        rdb_ensure_file( $rule, $1 );
      }
    }
    close LOG;
  }
  return $ret;
}

$clean_ext .= ' %R.ist %R.xdy';
$clean_ext .= ' nav snm vrb run.xml';
```


## Usando o [Visual Studio Code](https://code.visualstudio.com/) como IDE LaTeX

### Lista de extensões que deve instalar

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [bibtexLanguage](https://marketplace.visualstudio.com/items?itemName=phr0s.bib)
- [Brazilian Portuguese - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-portuguese-brazilian)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

### Configurações do VSCode

Edite o arquivo `settings.json` (File -> Preferences -> Settings) e adicione dentro dele o bloco a seguir. Esse bloco contém instruções para o latexmk e faz com que os arquivos gerados com a compilação do projeto sejam colocados no subdiretório `outlatexdir`, inclusive o PDF.

> Use o VSCode para abrir o diretório desse projeto e não apenas para abrir o .tex. O VSCode trata diretório como workspace.

Com as configurações abaixo, sempre que salvar o arquivo .tex, o projeto será automaticamente compilado com o latexmk.

```json
"files.exclude": {
        "**/*.alg": true,
        "**/*.aux": true,
        "**/*.bbl": true,
        "**/*.bcf": true,
        "**/*.blg": true,
        "**/*.fdb_latexmk": true,
        "**/*.fls": true,
        "**/*.glg": true,
        "**/*.gls": true,
        "**/*.idx": true,
        "**/*.ind": true,
        "**/*.ist": true,
        "**/*.lof": true,
        "**/*.lol": true,
        "**/*.log": true,
        "**/*.lot": true,
        "**/*.nav": true,
        "**/*.out": true,
        "**/*.snm": true,
        "**/*.synctex*": true,
        "**/*.toc": true,
        "**/*.vrb": true,
        "**/*.xdy": true,
        "**/*.acr": true,
        "**/.classpath": true,
        "**/.factorypath": true,
        "**/.project": true,
        "**/.settings": true,
        "**/*.run.xml" : true,
        "**/*.acn": true,
        "**/*.glo": true
      },
      "latex-workshop.latex.clean.subfolder.enabled": true,
      "latex-workshop.synctex.afterBuild.enabled": true,
      "latex-workshop.latex.outDir": "%DIR%/outlatexdir",
      "latex-workshop.latex.recipe.default": "lastUsed",
      "latex-workshop.latex.recipes": [
      {
        "name": "latexmk",
        "tools": ["latexmk", "latexmk-clean"]
      }
      ],
      "latex-workshop.latex.tools": [
      {
        "name": "latexmk",
        "command": "latexmk",
        "args": [
          "-pdf",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "-aux-directory=%OUTDIR%",
          "-outdir=%OUTDIR%",
          "%DOC%"
        ],
        "env": {}
      },
      {
        "name": "latexmk-clean",
        "command": "latexmk",
        "args": ["-bibtex", "-c", "-outdir=%OUTDIR%", "%DOC%"]
      },
      {
          "name": "pdflatex",
          "command": "pdflatex",
          "args": [
              "-synctex=1",
              "-interaction=nonstopmode",
              "-file-line-error",
              "-output-directory=%OUTDIR%",
              "%DOC%"
          ]
      },
      {
        "name": "biber",
        "command": "biber",
         "args": [
          "--input-directory=%OUTDIR%",
          "--output-directory=%OUTDIR%",
          "%DOCFILE%"
        ]
      },
      {
        "name": "makeglossaries",
        "command": "makeglossaries",
        "args": [
          "-d%OUTDIR%",
          "%DOCFILE%"
        ]
      }
    ],
    "latex-workshop.latex.clean.fileTypes": [
      "*.aux",
      "*.bbl",
      "*.blg",
      "*.bcf",
      "*.idx",
      "*.ind",
      "*.lof",
      "*.lol",
      "*.lot",
      "*.out",
      "*.toc",
      "*.acn",
      "*.acr",
      "*.alg",
      "*.glg",
      "*.glo",
      "*.gls",
      "*.fls",
      "*.log",
      "*.fdb_latexmk",
      "*.snm",
      "*.nav",
      "*.vrb",
      "*.run.xml",
      "*.xdy"
    ],
    "latex-workshop.message.update.show": false,
    "latex-workshop.view.pdf.viewer": "tab",
    "latex-workshop.view.pdf.zoom": "page-width",
```

