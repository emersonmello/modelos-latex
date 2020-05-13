% techrepifsc.cls
% 2020-03-18 Emerson Ribeiro de Mello - mello@ifsc.edu.br
%
% This class is based on https://github.com/OR-Bologna/tech-report-template
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{ifsctech}[2020/03/18 version 1.00 Techincal Report Class for IFSC] 
\ProvidesFile{imagens/ifsc-v.png}[2020/03/18 Logo of the Federal Institute of Santa Catarina]
\IfFileExists{imagens/ifsc-v.png}{}{\ClassError{ifsctech}{The picture of IFSC's logo is missing!}{It should always be in imagens/ifsc-v.png}}


% This class is based on class "report"
\LoadClassWithOptions{report}

%---------------------------------------------------------%
% Pacotes
%---------------------------------------------------------%

\RequirePackage[a4paper,hmargin=2cm,vmargin=2cm]{geometry}

% Fontes
\RequirePackage[T1]{fontenc}

% Codificação de caracteres
\RequirePackage[utf8]{inputenc}
\RequirePackage[brazilian]{babel}

% Fontes
\RequirePackage{amsfonts,amsmath}
\RequirePackage{lmodern}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Helvetica Font in Text and Math in LaTeX %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fix-cm}

\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled=1]{helvet}
\RequirePackage[helvet]{sfmath}
\everymath={\sf}
% Fontes https://fontawesome.com/?from=io
\RequirePackage{fontawesome}


% Titlesec for custom secion titles
\RequirePackage[medium]{titlesec}

\RequirePackage{parskip}
\RequirePackage{tikz}
\RequirePackage[skins]{tcolorbox}


\RequirePackage{enumitem}
\RequirePackage{url,graphicx,tikz,pgf}
\urlstyle{sf}

\definecolor{coolblack}{rgb}{0.0, 0.18, 0.39}
\definecolor{darkcerulean}{rgb}{0.03, 0.27, 0.49}
\definecolor{darkpastelblue}{rgb}{0.47, 0.62, 0.8}
\definecolor{indigo}{rgb}{0.0, 0.25, 0.42}
\definecolor{midnightblue}{rgb}{0.1, 0.1, 0.44}
\RequirePackage[colorlinks=true,linkcolor=midnightblue,citecolor=midnightblue,urlcolor=black]{hyperref}

% Para alterar rodapé e incluir número da revisão
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{ %
  \fancyhf{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\begin{tiny}Página \thepage\end{tiny}}
  \fancyfoot[R]{\begin{tiny}\textsc{Versão \numeroRevisao}\end{tiny}}
}

\fancypagestyle{followingpage}{%
\fancyhf{} % remove everything
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\begin{tiny}Página \thepage\end{tiny}}
\fancyfoot[R]{\begin{tiny}\textsc{Versão \numeroRevisao}\end{tiny}}
}
\pagestyle{followingpage}


%-----------------------------%
% Para fazer glossário
%-----------------------------%
% para listar acronimos, para aparecer no TOC, para não agrupar por iniciais 
% \usepackage[acronym,toc,nogroupskip,postpunc=dot,xindy]{glossaries-extra}

% https://tex.stackexchange.com/questions/417534/glossaries-dual-entry-isused-flag

\usepackage[record,% use bib2gls
 abbreviations,
 nostyles,% only need list style so don't load others
 stylemods={list},% load glossary-list.sty
 style=list,
 toc,nogroupskip,postpunc=dot]{glossaries-extra}

 \setabbreviationstyle{long-short}

% Para deixar em maiúscula a primeira letra na lista de siglas e glossário
\renewcommand{\glsnamefont}[1]{\makefirstuc{#1}}


% \newcommand{\glsxtrpostnamegeneral}{%
%   \ifglshasfield{dualid}{\glscurrententrylabel}%
%   { (\glshyperlink{\glscurrentfieldvalue})}%
%   {}%
% }

\renewcommand{\glsxtrpostdescabbreviation}{%
  \ifglshasfield{dualid}{\glscurrententrylabel}%
  { (\textit{Veja:} 
     \glshyperlink[\glsentryname\glscurrentfieldvalue]{\glscurrentfieldvalue})}%
  {}%
}
%-----------------------------%

% para quebrar citações que estouram a margem
\RequirePackage{breakcites}
\RequirePackage{soulutf8}
\RequirePackage{csquotes}

% Set up how figure and table captions are displayed
% Make the standard latex tables look so much better
\RequirePackage{array,booktabs,bookmark,multirow}


% Para incluir a lista de figuras no sumário
\RequirePackage[nottoc,notbib]{tocbibind}



% Pacote para incluir listagem de códigos

% para resolver o problema dos apostrofos e crases no listings
\RequirePackage{upquote,listings}


% Para ficar visível os Overfull hbox
\overfullrule=2cm


% Para formatar unidades físicas para o padrão usado no Brasil
\RequirePackage{siunitx}

\RequirePackage{microtype}

\RequirePackage{xifthen}

% Aumentando a largura das linhas das tabelas
\renewcommand{\arraystretch}{1.2}


%-----------------------------%
% Configurações para o TODO Notes
%-----------------------------%
\setlength{\marginparwidth}{2cm}
\usepackage{xargs}   
\usepackage[colorinlistoftodos,prependcaption,textsize=tiny]{todonotes}
\newcommandx{\duvida}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\corrigir}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\melhorar}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}


%---------------------------------------------------------%

% espaçamento entre linhas
\renewcommand{\baselinestretch}{1.2} 

%---------------------------------------------------------%
% Comandos
%---------------------------------------------------------%

% Ambiente para manter histórico das revisões
\def\numeroRevisao{0.0.0}

\newenvironment{historico}{%
\newcommand{\revisao}[3]{%
  \ifthenelse{\equal{\numeroRevisao}{0.0.0}}{%
    \gdef \numeroRevisao{\string##1}% Update version number
  }
  \string##1 & ##2 & ##3\\%
}%
\chapter*{Histórico de revisões}%
\begin{center}%
  \begin{tabular*}{\linewidth}{rp{2cm}p{.8\linewidth}}\toprule%
    Revisão & Data & Descrição\\\midrule%
}{%
\bottomrule%
\end{tabular*}%    
\end{center}%
}%


\definecolor{azul}{HTML}{7da6cb}
\definecolor{amarelo}{HTML}{f0b400}

\newenvironment{informacao}
{
\begin{tcolorbox}[enhanced, drop fuzzy shadow, enlarge by=1mm, sidebyside, boxrule=0pt,width=.98\linewidth,lefthand width=.8cm, lower separated=false]
\begin{center}
  \textcolor{azul}{{\Huge \faInfoCircle}}
\end{center}
\tcblower
}{
\end{tcolorbox}
}

\newenvironment{atencao}
{
\begin{tcolorbox}[enhanced, drop fuzzy shadow, enlarge by=1mm, sidebyside, boxrule=0pt,width=.98\linewidth,lefthand width=.8cm, lower separated=false]
\begin{center}
  \textcolor{azul}{{\Huge \faExclamationCircle}}
\end{center}
\tcblower
}{
\end{tcolorbox}
}

\newenvironment{cuidado}
{
\begin{tcolorbox}[enhanced, drop fuzzy shadow, enlarge by=1mm, sidebyside, boxrule=0pt,width=.98\linewidth,lefthand width=.9cm, lower separated=false]
\begin{center}
  \textcolor{amarelo}{{\Huge \faWarning}}
\end{center}
\tcblower
}{
\end{tcolorbox}
}

\renewcommand{\lstlistlistingname}{Lista de Códigos}
\renewcommand*\lstlistingname{Listagem}


\newcommand{\@rodape}{}
\newcommand{\rodape}[1]{%
  \renewcommand{\@rodape}{#1}
}

% Provides a command to set the tech report number (which is stored in \@reportnumber)
\newcommand{\@reportnumber}{000/0000}
\newcommand{\reportnumber}[1]{%
  \renewcommand{\@reportnumber}{#1}
}

% Format chapter and section headers
\titleformat{\chapter}{\scshape\Huge}{\thechapter}{0.5em}{}
\titleformat{\section}{\scshape\Large\vspace{-0.3em}}{\thesection}{0.3em}{}

% Things to do at the beginning of the document
\AtBeginDocument{%


\definecolor{verdeescuro}{RGB}{13,79,77}
\definecolor{background}{RGB}{238,241,236}
  
% --------------------------------------------------------------- %
% 3. Make the title page
% --------------------------------------------------------------- %
  \newgeometry{top=2.4cm,bottom=2.4cm,left=2.4cm,right=2.4cm}
  \makeatletter

  \begin{titlepage}
  
    \begin{center}
        \vspace*{1em}
        \includegraphics[height=13em,keepaspectratio]{./imagens/ifsc-v.png}\\
        \vspace{4em}
        {\sffamily\Huge \@title}\\[2em]
        {\sffamily Relatório Técnico \@reportnumber}\\[4em]
        {\sffamily{\large \@author}}\\[2em]
        {\sffamily \@date}
        \vfill
        \begin{tikzpicture}[overlay, remember picture]
          \fill[verdeescuro] (-12,-0.4) rectangle (12,-2.4);
          \node[color=white] at (0,-1.4) {\sffamily \@rodape};
        \end{tikzpicture}
    \end{center}
  \end{titlepage}

  \makeatother
  \restoregeometry
}
% -------------------------------------------------%
% Configurações para o listing
% -------------------------------------------------%


\definecolor{hellgelb}{rgb}{1,1,0.9}
\definecolor{colKeys}{rgb}{0,0,0}
\definecolor{colIdentifier}{rgb}{0,0,0.9}
\definecolor{colComments}{rgb}{.4,.4,.4}
\definecolor{colString}{rgb}{0,0,0.6}


\definecolor{deepblue}{rgb}{0,0,0.8}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}

\definecolor{colBack}{rgb}{1,1,0.9}
\definecolor{colKeys}{rgb}{108,48,130}%{0,0,0}
\definecolor{colIdentifier}{rgb}{0,0,0.9}
\definecolor{colComments}{rgb}{0,0.6,0}%{.4,.4,.4}
\definecolor{colString}{rgb}{0.6,0,0}


\definecolor{javared}{rgb}{0.6,0,0} % for strings
\definecolor{javagreen}{rgb}{0.25,0.5,0.35} % comments
\definecolor{javapurple}{rgb}{0.5,0,0.35} % keywords
\definecolor{javadocblue}{rgb}{0.25,0.35,0.75} % javadoc

% XML color
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{lightblue}{rgb}{0.0,0.0,0.9}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}
\definecolor{darkred}{rgb}{0.6,0.0,0.0}



\lstset{ %
  aboveskip=\bigskipamount,
  backgroundcolor=\color{colBack},   % choose the background color; you must add \usepackage{color} or 
  basicstyle=\ttfamily\footnotesize,       % the size of the fonts that are used for the code
  keywordstyle=\color{deepblue},
  stringstyle=\color{javared},
  commentstyle=\color{javagreen},
  morecomment=[s][\color{javadocblue}]{/**}{*/},
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=n,                    % sets the caption-position to none
  columns=flexible,
%  commentstyle=\color{colComments},    % comment style
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapechar={@*},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  linewidth=0.98\linewidth,
  tab=$\to$,
  float=tbph,
  xleftmargin=10pt,
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
%identifierstyle=\color{colIdentifier},
%  keywordstyle=\color{deepblue},       % keyword style
%  otherkeywords={*,...},            % if you want to add more keywords to the set
  % firstnumber=last,
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny,
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
%   stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
%  stringstyle=\color{colString},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}

% Criando definição para linguagem Groovy
\definecolor{groovyblue}{HTML}{0000A0}
\definecolor{groovygreen}{HTML}{008000}
\definecolor{darkgray}{rgb}{.4,.4,.4}
 
\lstdefinelanguage{Groovy}[]{Java}{
  keywordstyle=\color{groovyblue}\bfseries,
  stringstyle=\color{groovygreen}\ttfamily,
  keywords=[3]{each, findAll, groupBy, collect, inject, eachWithIndex},
  morekeywords={def, as, in, use},
  moredelim=[is][\textcolor{darkgray}]{\%\%}{\%\%},
  moredelim=[il][\textcolor{darkgray}]{§§}
}


\lstdefinelanguage{XML}
{
  morestring=[s][\color{mauve}]{"}{"},
  morestring=[s][\color{black}]{>}{<},
  morecomment=[s]{<?}{?>},
  morecomment=[s][\color{dkgreen}]{<!--}{-->},
  stringstyle=\color{black},
  identifierstyle=\color{lightblue},
  keywordstyle=\color{red},
  morekeywords={xmlns,xsi,noNamespaceSchemaLocation,type,id,x,y,source,target,version,tool,transRef,roleRef,objective,eventually}% list your attributes here
}


\definecolor{eclipseStrings}{RGB}{42,0.0,255}
\definecolor{eclipseKeywords}{RGB}{127,0,85}
\colorlet{numb}{magenta!60!black}

\lstdefinelanguage{json}{
  basicstyle=\normalfont\ttfamily,
    commentstyle=\color{eclipseStrings}, % style of comment
    stringstyle=\color{eclipseKeywords}, % style of strings
    string=[s]{"}{"},
    comment=[l]{:\ "},
    morecomment=[l]{:"},
    literate=
        *{0}{{{\color{numb}0}}}{1}
         {1}{{{\color{numb}1}}}{1}
         {2}{{{\color{numb}2}}}{1}
         {3}{{{\color{numb}3}}}{1}
         {4}{{{\color{numb}4}}}{1}
         {5}{{{\color{numb}5}}}{1}
         {6}{{{\color{numb}6}}}{1}
         {7}{{{\color{numb}7}}}{1}
         {8}{{{\color{numb}8}}}{1}
         {9}{{{\color{numb}9}}}{1}
}

% Permitindo caracteres acentuados dentro do ambiente lstlisting
\lstset{%
        inputencoding=utf8,
        extendedchars=true,
        literate=%
        {é}{{\'{e}}}1
        {è}{{\`{e}}}1
        {ê}{{\^{e}}}1
        {ë}{{\¨{e}}}1
        {É}{{\'{E}}}1
        {Ê}{{\^{E}}}1
        {û}{{\^{u}}}1
        {ù}{{\`{u}}}1
        {â}{{\^{a}}}1
        {à}{{\`{a}}}1
        {á}{{\'{a}}}1
        {ã}{{\~{a}}}1
        {Á}{{\'{A}}}1
        {Â}{{\^{A}}}1
        {Ã}{{\~{A}}}1
        {ç}{{\c{c}}}1
        {Ç}{{\c{C}}}1
        {õ}{{\~{o}}}1
        {ó}{{\'{o}}}1
        {ú}{{\'{u}}}1
        {Ú}{{\'{U}}}1
        {ô}{{\^{o}}}1
        {Õ}{{\~{O}}}1
        {Ó}{{\'{O}}}1
        {Ô}{{\^{O}}}1
        {î}{{\^{i}}}1
        {Î}{{\^{I}}}1
        {í}{{\'{i}}}1
        {Í}{{\~{Í}}}1
}

\lstdefinestyle{shell}{language=csh,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{shellp}{language=csh,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{php}{language=php,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{phpp}{language=php,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{ansic}{language=c,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{ansicp}{language=c,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{cpp}{language=C++,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{cppp}{language=C++,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{json}{language=json,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{java}{language=java,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{javap}{language=java,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{matlab}{language=matlab,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{matlabp}{language=matlab,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{python}{language=python,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{pythonp}{language=python,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{xml}{language=XML,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{xmlp}{language=XML,basicstyle=\ttfamily\scriptsize}
\lstdefinestyle{sql}{language=sql,basicstyle=\ttfamily\footnotesize}
\lstdefinestyle{sqlp}{language=sql,basicstyle=\ttfamily\scriptsize}

\lstdefinestyle{groovy}{language=Groovy,basicstyle=\ttfamily\footnotesize}
\newcommand{\groovy}{\lstset{style=Groovy}}

\newcommand{\cpp}{\lstset{style=cpp}}
\newcommand{\cppp}{\lstset{style=cppp}}
\newcommand{\ansic}{\lstset{style=ansic}}
\newcommand{\ansicp}{\lstset{style=ansicp}}
\newcommand{\json}{\lstset{style=json}}
\newcommand{\java}{\lstset{style=java}}
\newcommand{\javap}{\lstset{style=javap}}
\newcommand{\sql}{\lstset{style=sql}}
\newcommand{\sqlp}{\lstset{style=sqlp}}
\newcommand{\xml}{\lstset{style=xml}}
\newcommand{\xmlp}{\lstset{style=xmlp}}
\newcommand{\python}{\lstset{style=python}}
\newcommand{\pythonp}{\lstset{style=pythonp}}
\newcommand{\csh}{\lstset{style=shell}}
\newcommand{\cshp}{\lstset{style=shellp}}
\newcommand{\shell}{\lstset{style=shell}}
\newcommand{\shellp}{\lstset{style=shellp}}


% Incluindo códigos que estão em um arquivo externo
%parâmetros: linguagem (shell, java, matlab, python, c, php), label, caption, arquivo

%\includecode[shell]{l_olamundo}{Olá mundo em shell script}{codigos/ola.sh}

\newcommand{\includecode}[4][c]{\lstinputlisting[captionpos=t,caption=#3, label=#2,escapechar={@*}, style=#1]{#4}}