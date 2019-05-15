% inifsc.cls
% 2019-05-15 Emerson Ribeiro de Mello - mello@ifsc.edu.br

% https://en.wikibooks.org/wiki/LaTeX/List_Structures#Easylist_package

\ProvidesClass{inifsc}[2019/05/15 version 1.00 Instrucao Normativa] 
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---

% para preencher dados da instituição no cabeçalho
\newcommand{\instituicao}[1]{\def\@instituicao{#1}}
\newcommand{\show@instituicao}{\@instituicao}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions \relax
\LoadClass{memoir}



% --- Class structure:

\global\let\@disposicao\@empty
\newcommand{\listadisposicao}[1]{\def\@disposicao{#1}}
\let\disposicao\listadisposicao %
\newcommand{\show@disposicao}{\@disposicao}

\global\let\@assinatura\@empty
\newcommand{\listaassinatura}[2]{\def\@assinatura{#1\\#2}}
\let\assinatura\listaassinatura %
\newcommand{\show@assinatura}{\@assinatura}

\global\let\@aprovado\@empty
\newcommand{\listaaprovado}[1]{\def\@aprovado{#1}}
\let\aprovado\listaaprovado %
\newcommand{\show@aprovado}{\@aprovado}

\newenvironment{normativa}[1]{%
\begin{center}
{\normalfont\sffamily\Large\bfseries\centering#1}\\[8ex]
\end{center}
\ifx\@disposicao\@empty
  \relax
\else
\begin{flushright}
\begin{minipage}{.7\linewidth}
\begin{small}
\show@disposicao
\end{small}  
\end{minipage}\\
\end{flushright}
\fi %
}{%
\vspace{10ex}
\ifx\@assinatura\@empty
  \relax
\else
\begin{center}
	\show@assinatura
\end{center}
\fi %
\vspace{10ex}
\ifx\@aprovado\@empty
  \relax
\else
\noindent\show@aprovado
\fi %
}

% Codificação de caracteres
\RequirePackage[utf8]{inputenc}

\RequirePackage{enumitem}
\RequirePackage{moreenum}

% Novas listas enumerate para artigo, paragrafo, inciso e alinea

\newlist{artigo}{enumerate}{1}
\setlist[artigo]{resume,labelindent=\parindent, itemindent=0px, align=left, label=\textbf{Art. \arabic*º}, ref=art. \arabic*º}

\newlist{paragrafo}{enumerate}{4}
\setlist[paragrafo,1]{start=1,labelindent=\parindent,topsep=0pt, itemindent=0px, align=left, label=\textbf{§ \arabic*º}, ref=§ \arabic*º}
\setlist[paragrafo,2]{start=1,labelindent=\parindent, topsep=0pt,align=left,itemindent=0px, label=\Roman*.,ref=\Roman*}
\setlist[paragrafo,3]{start=1,labelindent=\parindent,topsep=0pt, itemindent=0px,align=left, label=\alph*),ref=\alph*}
\setlist[paragrafo,4]{start=1,labelindent=\parindent,topsep=0pt, itemindent=0px, align=left, label=\arabic*.}

\newlist{inciso}{enumerate}{3}
\setlist[inciso,1]{start=1,labelindent=\parindent, topsep=0pt,align=left, itemindent=0px,label=\Roman*.,ref=\Roman*}
\setlist[inciso,2]{start=1,labelindent=\parindent,topsep=0pt, align=left,itemindent=0px, label=\alph*),ref=\alph*}
\setlist[inciso,3]{start=1,labelindent=\parindent,topsep=0pt, itemindent=0px, align=left, label=\arabic*.}

% comando para gerar parágrafo único
\newcommand{\paragrafounico}[1]{%
\par\textbf{Parágrafo único - } #1\par
}


\RequirePackage{titlesec}

\titleformat{\chapter}[display]
  {\normalfont\sffamily\Large\bfseries\centering}
  {\MakeUppercase{\chaptertitlename}\ \thechapter}{0pt}{\Large}

% Para deixar a seção no seguinte formato: 
%   Seção I
%   Título
\titleformat{\section}[display]
  {\normalfont\sffamily\large\bfseries\centering}
  {Seção \thesection}{0pt}{\large}

\titlespacing*{\chapter}{0pt}{30pt}{20pt}
\renewcommand\thechapter{\Roman{chapter}}
\renewcommand\thesection{\Roman{section}}
\gdef\clearforchapter{}



% Page layout
\RequirePackage[a4paper,hmargin=2.3cm,top=3.5cm,bottom=2cm,headheight=3cm,heightrounded]{geometry}

\RequirePackage{lastpage}
\RequirePackage{hyperref}
\hypersetup{colorlinks,
	linkcolor=black,  %%% cor do tableofcontents, \ref, \footnote, etc
	citecolor=black,  %%% cor do \cite
	urlcolor=black,   %%% cor do \url e \href
	%pdfpagemode,     %%%  None (default), UseThumbs, UseOutlines, FullScreen
	pdfstartview=FitH, %%% FitB, FitH
	bookmarksopen=false,
	bookmarksopenlevel=1
}

% Cabeçalho
\makepagestyle{plain}
\makeevenfoot{plain}{}{\thepage}{}
\makeoddfoot{plain}{}{\thepage}{}

% Usando um logo que ocupa o cabeçalho todo
\makeoddhead{plain}{}{\pgfuseimage{logo}}{}
\makeevenhead{plain}{}{\pgfuseimage{logo}}{}
\makeoddhead{headings}{}{\pgfuseimage{logo}}{}
\makeevenhead{headings}{}{\pgfuseimage{logo}}{}

% Para usar um logo na esquerda e o texto de instituição na direita
% \makeoddhead{plain}{\pgfuseimage{logo}}{}{\textsc{\scriptsize{\show@instituicao}}}
% \makeevenhead{plain}{\pgfuseimage{logo}}{}{\textsc{\scriptsize{\show@instituicao}}}
% \makeheadrule{plain}{\textwidth}{\normalrulethickness}
% \makeoddhead{headings}{\pgfuseimage{logo}}{}{\textsc{\scriptsize{\show@instituicao}}}
% \makeevenhead{headings}{\pgfuseimage{logo}}{}{\textsc{\scriptsize{\show@instituicao}}}
% \makeheadrule{headings}{\textwidth}{\normalrulethickness}

\makeevenfoot{headings}{}{\thepage}{}
\makeoddfoot{headings}{}{\thepage}{}


\AtBeginDocument{\thispagestyle{plain}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Helvetica Font in Text in LaTeX %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[scaled=1]{helvet}
\RequirePackage[helvet]{sfmath}
\RequirePackage[T1]{fontenc}
