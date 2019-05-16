% ata.cls
% 2019-05-03 Emerson Ribeiro de Mello - mello@ifsc.edu.br
% Esse documento está fortemente baseado no modelo desenvolvido no artigo Minutes in Less That Hours: Using LaTeX Resources de Jimm Hefferon

\ProvidesClass{ata}[2019/05/03 version 1.00 Ata de Reuniao] 
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: initial code part
% ---

% para preencher dados da instituição no cabeçalho
\newcommand{\instituicao}[1]{\def\@instituicao{#1}}
\newcommand{\show@instituicao}{\@instituicao}

% para preencher dados do departamento/colegiado no cabeçalho
\newcommand{\departamento}[1]{\def\@departamento{#1}}
\newcommand{\show@departamento}{\@departamento}


% Quem participou?
\def\@presentes{Ninguém}
\newcommand{\listapresentes}[1]{\def\@presentes{#1}}
\newcommand{\show@presentes}{\@presentes}

% quais papéis que os membros podem possuir?
\newcommand{\papel}[2]{#1 (#2)}
\newcommand{\presidente}[1]{\papel{#1}{Presidente}}
\newcommand{\secretario}[1]{\papel{#1}{Secretário}}
\newcommand{\secretaria}[1]{\papel{#1}{Secretária}}
\newcommand{\titular}[1]{\papel{#1}{membro titular}}
\newcommand{\suplente}[1]{\papel{#1}{membro suplente}}

% Tipos de justificativa
\newcommand{\justificativa}[2]{#1 (#2)}
\newcommand{\capacitacao}[1]{\justificativa{#1}{justificado -- capacitação}}
\newcommand{\aula}[1]{\justificativa{#1}{justificado -- em aula}}

% quem está ausente? 
\global\let\@ausentes\@empty
\newcommand{\listaausentes}[1]{\def\@ausentes{#1}}
\let\ausentes\listaausentes %
\newcommand{\show@ausentes}{\@ausentes}

% convidados
\global\let\@convidados\@empty
\newcommand{\listaconvidados}[1]{\def\@convidados{#1}}
\let\convidados\listaconvidados %
\newcommand{\show@convidados}{\@convidados}

% quem são os membros? 
\global\let\@membros\@empty
\newcommand{\listamembros}[1]{\def\@membros{#1}}
\let\membros\listamembros %
\newcommand{\show@membros}{\@membros}

% what day is it?
\def\@date{\today}
\newcommand{\setdate}[1]{\def\@date{#1}}
\newcommand{\show@date}{\@date}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass{article}

% --- Class structure: main code part
% ---

% \newcommand{\lista@membros}{
% % \begin{description}[align=left,labelwidth=2cm]
% \begin{description}
% \item[Presentes:] \show@presentes
% \ifx\@ausentes\@empty
%   \relax
% \else
%   \item[Ausentes:] \show@ausentes
% \fi %
% \ifx\@convidados\@empty
%   \relax
% \else
%   \item[Convidados:] \show@convidados
% \fi %
% \end{description}
% }

\newcommand{\lista@membros}{
% \begin{description}[align=left,labelwidth=2cm]
\noindent
\textbf{Presentes:} \show@presentes.
\ifx\@ausentes\@empty
  \relax
\else
\noindent
\textbf{Ausentes:} \show@ausentes.
\fi %
\ifx\@convidados\@empty
  \relax
\else
\noindent
\textbf{Convidados:} \show@convidados.
\fi %
\vspace{1ex}
}

\newenvironment{reuniao}[1]{%
\begin{center}
  {\Large\textbf{ATA da Reunião #1}}\\[1ex]
  {\large\textbf{\show@departamento}}\\[1ex]
  \show@date
\end{center}
\vspace{1.5ex}
}{%
\lista@membros
\vspace{1ex}
}

% environments inside the minutes
\newenvironment{businesslist}[1]{%
%\renewcommand\theenumi{\alph{\enumi}}
\vspace{2ex}\par\noindent\textbf{#1}\par
\begin{enumerate}
}{%
\end{enumerate}
}

\newenvironment{assuntos}{%
\begin{businesslist}{Assuntos}
}{%
\end{businesslist}
}

\newenvironment{informes}{%
\begin{businesslist}{Informes}
}{%
\end{businesslist}
}

% % when is the next meeting?
\newcommand{\proximareuniao}[1]{%
\par\noindent\textbf{Próxima reunião:} #1\par
}

% % OK the minutes of the last meeting
\newcommand{\aprovada}{A ATA da reunião passada foi aprovada. }

% Para hachurar partes confidenciais
\RequirePackage{censor}

% Codificação de caracteres
\RequirePackage[utf8]{inputenc}


% Page layout
\RequirePackage[a4paper,hmargin=2.3cm,top=3.5cm,bottom=2cm,headheight=3cm,heightrounded]{geometry}

\RequirePackage{lastpage}

\RequirePackage{fancyhdr}


\fancypagestyle{firstpage}{%
  \fancyhf{} % clear all six fields
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhead[C]{\pgfuseimage{logo}}
  \fancyfoot[R]{página \thepage~de \pageref{LastPage}}
}

% Se desejar usar um texto para o cabeçalho, faça uso do comando instituicao e descomente as linhas abaixo
% \fancypagestyle{firstpage}{%
%   \fancyhf{} % clear all six fields
%   \renewcommand{\headrulewidth}{1pt}
%   \renewcommand{\footrulewidth}{0pt}
%   \fancyhead[L]{\pgfuseimage{logo}}
%   \fancyhead[R]{
%   \begin{scriptsize}  
%   \textsc{\show@instituicao}
%   \end{scriptsize}}
%   \fancyfoot[R]{página \thepage~de \pageref{LastPage}}
% }

\fancypagestyle{followingpage}{%
  \fancyhf{} % clear all six fields
  \fancyhead[RE,LO]{\begin{tiny}\textsc{\show@departamento}\end{tiny}}
  \renewcommand{\headrulewidth}{.4pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[R]{\begin{small}página \thepage~de \pageref{LastPage}\end{small}}
}


\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}




% A redefinição abaixo é necessária para permitir que o comando \blackout do pacote censor
% processe caracteres utf8 (com mais de 1 byte), por exemplo, caracteres acentuados.

\def\stringend{$}
\long\def\blackout#1{%
\protected@edef\tmp{#1}%
\def~{-}\expandafter\censor@Block\tmp\stringend\let~\sv@tilde}
\long\def\censor@Block{\IfNextToken\stringend{\@gobble}%
  {\IfNextToken\@sptoken{ \bl@t{\censor@Block}}%
  {\bl@t{\censor@Block}}}}

\long\def\bl@t#1#2{%
\ifx\bpar#2\let\next\par\else\ifx.#2\let\next\censordot\else\def\next{\censor{#2}}\fi\fi
  \next#1}