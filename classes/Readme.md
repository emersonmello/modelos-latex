# Classes e arquivos comuns

Os arquivos dispostos nesse diretório são usados pelos modelos desse repositório. 

Dentro do diretório de cada modelo há um arquivo `.latexmk` que contém o caminho relativo para o diretório `classes`, com a seguinte linha:

```perl
$ENV{'TEXINPUTS'}='.:../classes/:../classes/imagens/:' . $ENV{'TEXINPUTS'};
```
Essa linha informa ao *latexmk* que os arquivos `.cls` e `.sty` estão dentro do diretório `classes`. Assim, não é necessário copiar esses arquivos para cada projeto.
