% zhaw-thesis.cls
% Eigene LaTeX-Klasse auf Basis von KOMA-Script scrartcl

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zhaw-thesis}[2026/04/24 ZHAW thesis class]

% -----------------------------------------------------------------------------
% Basis-Klasse
% -----------------------------------------------------------------------------
\LoadClass[11pt,oneside,a4paper]{scrartcl}

% -----------------------------------------------------------------------------
% Sprache, Encoding, Schrift
% -----------------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage{times}
\RequirePackage[scaled]{helvet}
\RequirePackage{textcomp}
\RequirePackage{type1cm}
\RequirePackage{anyfontsize}

% -----------------------------------------------------------------------------
% Seitenlayout
% -----------------------------------------------------------------------------
\RequirePackage[a4paper,top=2.5cm,bottom=2cm,left=2.5cm,right=2cm,footskip=1cm]{geometry}
\RequirePackage{pdflscape}
\RequirePackage{multicol}
\RequirePackage[absolute]{textpos}
\RequirePackage{eso-pic}

% -----------------------------------------------------------------------------
% Grafiken, Tabellen, Floats
% -----------------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{import}
\RequirePackage{grffile}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{floatflt}
\RequirePackage{rotating}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{tabularray}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{hhline}
\RequirePackage{colortbl}
\RequirePackage[margin=10pt,font=footnotesize,labelfont=bf,labelsep=endash]{caption}

% -----------------------------------------------------------------------------
% Mathematik, Symbole, Chemie
% -----------------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{nicefrac}
\RequirePackage{pifont}
\RequirePackage{chemgreek}

% -----------------------------------------------------------------------------
% Text, Kommentare, URLs
% -----------------------------------------------------------------------------
\RequirePackage{soul}
\RequirePackage[normalem]{ulem}
\RequirePackage{hyphenat}
\RequirePackage{comment}
\RequirePackage{verbatim}
\RequirePackage{fancyvrb}
\RequirePackage{listliketab}
\RequirePackage[hyphens]{url}
\urlstyle{same}

% -----------------------------------------------------------------------------
% PDF und Anhänge
% -----------------------------------------------------------------------------
\RequirePackage[final]{pdfpages}
\RequirePackage{attachfile2}

% -----------------------------------------------------------------------------
% Farben
% -----------------------------------------------------------------------------
\RequirePackage[table]{xcolor}
\definecolor{pantone 2945}{RGB}{0,100,166}
\definecolor{mygrau}{RGB}{100,100,100}
\definecolor{pantone 519}{RGB}{106,32,95}
\definecolor{pantone 349}{RGB}{0,102,51}

% -----------------------------------------------------------------------------
% Bibliographie
% -----------------------------------------------------------------------------
\RequirePackage[
  backend=biber,
  style=ieee,
  url=true,
  doi=true,
  eprint=true
]{biblatex}

\DeclareNameAlias{default}{family-given}
\DeclareNameAlias{sortname}{family-given}

\DeclareFieldFormat{labelname}{%
  \iffieldundef{labelname}
    {\mkbibemph{Anon.}}
    {#1}%
}

% -----------------------------------------------------------------------------
% Listings
% -----------------------------------------------------------------------------
\RequirePackage{listings}

\lstdefinestyle{pythonstyle}{
  language=Python,
  basicstyle=\ttfamily\footnotesize,
  keywordstyle=\color{blue},
  stringstyle=\color{orange},
  commentstyle=\color{gray},
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=single,
  tabsize=4,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=false,
  escapeinside={\%*}{*)},
  morekeywords={self},
}

\lstdefinestyle{pythonstyleColor}{
  language=Python,
  basicstyle=\ttfamily\small,
  keywordstyle=\color{blue},
  stringstyle=\color{orange},
  commentstyle=\color{gray},
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=single,
  tabsize=4,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=false,
  escapeinside={\%*}{*)},
  morekeywords={self},
  literate=%
    *{0}{{{\color{cyan}0}}}{1}%
     {1}{{{\color{cyan}1}}}{1}%
     {2}{{{\color{cyan}2}}}{1}%
     {3}{{{\color{cyan}3}}}{1}%
     {4}{{{\color{cyan}4}}}{1}%
     {5}{{{\color{cyan}5}}}{1}%
     {6}{{{\color{cyan}6}}}{1}%
     {7}{{{\color{cyan}7}}}{1}%
     {8}{{{\color{cyan}8}}}{1}%
     {9}{{{\color{cyan}9}}}{1},
}

\lstdefinestyle{matlabstyle}{
  language=Matlab,
  basicstyle=\ttfamily\small,
  keywordstyle=\color{black},
  stringstyle=\color{blue},
  commentstyle=\color{green},
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=single,
  tabsize=4,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=false,
  escapeinside={\%*}{*)},
  morekeywords={end,if,else,elseif,for,while,function,return,switch,case,otherwise},
}

\newcommand{\codepart}[5]{%
  \lstinputlisting[
    style=pythonstyle,
    inputencoding=utf8,
    firstline=#2,
    lastline=#3,
    firstnumber=#2,
    numberfirstline=true,
    caption={#4},
    label={#5}
  ]{#1}%
}

\renewcommand*{\lstlistingname}{Code}
\renewcommand*{\lstlistlistingname}{Code listing}
\def\lstlistingautorefname{Code}

% -----------------------------------------------------------------------------
% Kopf- und Fusszeile
% -----------------------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\nouppercase{\leftmark}}
\fancyhead[R]{\thepage\hspace{1pt} $/$ \pageref{LastPage}}
\fancyfoot[C]{\footnotesize\emph{Zurich University of Applied Sciences $\cdot$ IUNR -- Institute of ... \\ CH-8401 Winterthur $\cdot$ www.zhaw.ch}}

\setlength{\parindent}{0mm}
\setlength{\parskip}{0pt}

% KOMA-Script clear page fallback
\renewcommand{\cleardoublepage}{\cleardoublestandardpage}

% -----------------------------------------------------------------------------
% Hyperref: möglichst spät laden
% -----------------------------------------------------------------------------
\RequirePackage{hyperref}

\hypersetup{
  colorlinks=false,
  pdfproducer={LaTeX with hyperref package},
  pdfcreator={pdflatex}
}

% -----------------------------------------------------------------------------
% Eigene Metadaten-Commands
% -----------------------------------------------------------------------------
\newcommand{\thesistitle}{Title}
\newcommand{\thesissubtitle}{Subtitle}
\newcommand{\thesisauthor}{Name}
\newcommand{\thesisdate}{\today}
\newcommand{\thesissupervisora}{Prof. Dr. ...}
\newcommand{\thesissupervisorb}{Dr. ...}

\newcommand{\setthesistitle}[1]{\renewcommand{\thesistitle}{#1}}
\newcommand{\setthesissubtitle}[1]{\renewcommand{\thesissubtitle}{#1}}
\newcommand{\setthesisauthor}[1]{\renewcommand{\thesisauthor}{#1}}
\newcommand{\setthesisdate}[1]{\renewcommand{\thesisdate}{#1}}
\newcommand{\setthesissupervisora}[1]{\renewcommand{\thesissupervisora}{#1}}
\newcommand{\setthesissupervisorb}[1]{\renewcommand{\thesissupervisorb}{#1}}

\newcommand{\setupthesismetadata}{%
  \hypersetup{
    pdftitle={\thesistitle},
    pdfauthor={\thesisauthor},
    pdfsubject={Bachelor Thesis at ZHAW},
    pdfkeywords={Typhoon HIL, Grid-forming control, VSM, Power Systems, Bachelor Thesis}
  }%
}
