# Classes e arquivos comuns

Os arquivos dispostos nesse diretório são usados pelos modelos desse repositório. 

Nos arquivos `.tex` de cada modelo é feita a inclusão dessas classes e estilos por meio do caminho relativo. Exemplo:

```tex
\documentclass[11pt]{../classes/ifscarticle}
\usepackage{../classes/ifscutils}
```

Caso não queira fazer uso de caminhos relativos é possível definir a variável de ambiente `TEXINPUTS` e informar nela o caminho completo onde encontram-se esses arquivos. Se estiver usando o *script* [latexmk](https://mg.readthedocs.io/latexmk.html) para compilar seu projeto localmente, então coloque a seguinte linha no arquivo `$HOME/.latexmrc`:
```perl
$ENV{'TEXINPUTS'}='/onde/voce/salvou/modelos-latex/classes//:' . $ENV{'TEXINPUTS'}; %
```

## Como usar no Overleaf

O [Overleaf](https://www.overleaf.com) usa o [latexmk](https://mg.readthedocs.io/latexmk.html) para compilar os projetos. Então, caso queira manter os arquivos deste diretório em um subdiretório do projeto, basta criar na raiz do projeto o arquivo chamado `latexmrc` e dentro colocar a linha que foi apresentada logo acima.

### Copiando classes e estilos para a raiz de um projeto Overleaf

Outra opção seria criar um projeto Overleaf e deixar nesse projeto uma cópia das classes e estilos na raiz do mesmo. Para tal, siga os passos descritos abaixo:

1. Crie um projeto no Overleaf e o copie para lá os arquivos do modelo que deseja. Por exemplo, copiar todos os arquivos que estão no diretório [nota-de-aula](../nota-de-aula)
1. Copie os arquivos [ifscarticile.cls](ifscarticile.cls) e [ifscutils.sty](ifscutils.sty) que estão nesse diretório para a raiz do projeto criado no Overleaf
2. Edite as duas linhas iniciais do arquivo `.tex` para que fique da seguinte forma:
```tex
\documentclass[11pt]{ifscarticle}
\usepackage{ifscutils}
```