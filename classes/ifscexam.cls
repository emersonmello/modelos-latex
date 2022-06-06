% ifscexam.cls
% ------------------------------------------------------------%
% 2022-06-03
% 2015-2020 - Emerson Ribeiro de Mello - mello@ifsc.edu.br
% ------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifscexam}[2022/06/03 version 1.01 IFSC exam] 

% This class is based on class "exam"
\PassOptionsToClass{\CurrentOption}{exam}
\LoadClass[addpoints]{exam}


\RequirePackage[a4paper,hmargin=2cm,top=2cm,bottom=2cm,headheight=2cm,heightrounded]{geometry}

% -------------------------------------------------%
% Configurações da classe exam
% -------------------------------------------------%
% dicas obtidas em
% http://www.tex-br.org/index.php?title=Exam&printable=yes
\newcommand{\formatoquestao}{\qformat{\textbf{Questão \thequestion:}\hfill[\pointsofquestion{\arabic{question}} \points]}}

\newcommand{\tf}[1][{}]{%
  \fillin[#1][0.25in]%
}

\marginpointname{\points}
\setlength\linefillheight{.6cm} %distância entre linhas

% traduções 
\pointpoints{ponto}{pontos}
\renewcommand{\solutiontitle}{\noindent\textbf{Resposta:}\enspace}
\totalformat{Total: \totalpoints\ \points}
\hqword{Questões} %substitutes text for Question:
\hpgword{Páginas} %substitutes text for Page:
\hpword{Total de pontos} %substitutes text for Points:
\hsword{Pontos obtidos} %substitutes text for Score:
\htword{Total} %substitutes text for Total% 
%-------------------------------------------------%


%-------------------------------------------------%
% Configurações do cabeçalho e rodapé
%-------------------------------------------------%
\pagestyle{headandfoot}

% Rodapé
\if@twoside%
\cfoot{}
\lfoot{\oddeven{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny}}{\begin{tiny}Página \thepage\ de \numpages\end{tiny}}}
\rfoot{\oddeven{\begin{tiny}Página \thepage\ de \numpages\end{tiny}}{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny}}}
\else%
\cfoot{}
\lfoot{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny}}
\rfoot{\begin{tiny}Página \thepage\ de \numpages\end{tiny}}
\fi% 
