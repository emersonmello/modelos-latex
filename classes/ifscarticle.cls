% ifscarticle.cls
% ------------------------------------------------------------%
% 2022-06-03
% 2015-2025 - Emerson Ribeiro de Mello - mello@ifsc.edu.br
% ------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifscarticle}[2022/06/03 version 1.01 IFSC article] 

% espaçamento entre parágrafos
\setlength{\parskip}{.3em}

%---------------------------------------------------------%
% Pacotes
%---------------------------------------------------------%

%---------------------------------------------------------%
% ATENÇÃO: O pacote ifscutils é necessário para essa classe
% Para evitar dependências de soluções externas para localizar
% tal arquivo, deve-se incluir a linha abaixo dentro do arquivo
% .tex, já apontando para o caminho relativo do arquivo ifscutils.sty
% \RequirePackage{ifscutils}
%---------------------------------------------------------%

% Para alterar rodapé e incluir número da revisão
\RequirePackage{fancyhdr}

% This class is based on class "article"
\LoadClassWithOptions{article}


% Para imprimir frente e verso
\if@twoside%
\RequirePackage[a4paper,hmargin=2cm,top=2cm,bottom=2cm,headheight=2cm,heightrounded,twoside]{geometry}
\fancypagestyle{followingpage}{%
  \fancyhf{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}%
  \fancyfoot[RE,LO]{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny} }%
  \fancyfoot[LE,RO]{\begin{tiny}Página \thepage\end{tiny}}%
}
\else
\RequirePackage[a4paper,hmargin=2cm,top=2cm,bottom=2cm,headheight=2cm,heightrounded]{geometry}
\fancypagestyle{followingpage}{%
  \fancyhf{} % remove everything
  \renewcommand{\headrulewidth}{0pt} % remove lines as well
  \renewcommand{\footrulewidth}{0pt}%
  \fancyfoot[L]{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny} }%
  \fancyfoot[R]{\begin{tiny}Página \thepage\end{tiny}}%
}
\fi

\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{followingpage}}