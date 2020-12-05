% ifscexam.cls
% ------------------------------------------------------------%
% 2020-12-05
% 2015-2020 - Emerson Ribeiro de Mello - mello@ifsc.edu.br
% ------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ifscarticle}[2020/11/23 version 1.00 IFSC exam] 

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
% \footrule
\firstpagefooter{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny}}{}{\begin{tiny}Página \thepage\ de \numpages\end{tiny}}
\runningfooter{\begin{tiny}IFSC -- \textsc{Campus São José}\end{tiny}}{}{\begin{tiny}Página \thepage\ de \numpages\end{tiny}}