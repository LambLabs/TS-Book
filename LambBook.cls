%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LambBook LaTeX Template - THESIS CLASS FILE
%
% This template has been downloaded from:
% http://new.owieczka.net
%
% This class file defines the structure and design of the template. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{LambBook}
              [2014/06/18 v1.0 LaTeX document class]
\def\baseclass{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
%% Fallback
%\DeclareOption*{\ClassWarning{LambPhDThesis}{Unknown option '\CurrentOption'}}
%\def\@checkoptions#1#2{
%  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
%  \@tempswafalse
%  \@tfor\@this:=#2\do{
%    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
%    \ifin@ \@tempswatrue \@break@tfor \fi}
%  \let\@this\@empty
%  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
%}
%\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
%\PassOptionsToClass{a4paper}{\baseclass}
%\PassOptionsToClass{12pt}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
%====================================================
\RequirePackage[utf8]{inputenc} % Allows the use of international characters

%====================================================
%Command definition

%====================================================
% Paper Size of Margin
\RequirePackage{geometry} % Adjust paper geometry
\newgeometry{tmargin=2.5cm, bmargin=2.5cm, lmargin=2cm, rmargin=2cm} 
\linespread{1.3} %Interlinia półtora
%====================================================
% Headers 
\RequirePackage{fancyhdr}

% Headers for Chapter Page
\fancypagestyle{plain}{
\fancyhf{}
\fancyhead[L]{\@author}
\fancyhead[R]{\@title}
\fancyhead[C]{}
\fancyfoot[L]{}
\fancyfoot[R]{\today}
\fancyfoot[C]{\thepage}
}
% Headers for the rest
\fancypagestyle{main}{
\fancyhf{}
\fancyhead[L]{\@author}
\fancyhead[R]{\@title}
\fancyhead[C]{}
\fancyfoot[L]{}
\fancyfoot[R]{\today}
\fancyfoot[C]{\thepage}
}

\pagestyle{main}

%====================================================
% Title Page definition
\newcommand{\makebooktitle}{%
\thispagestyle{empty}
\begin{titlepage}
\begin{center}

\@title

\@author

\vfill

% Bottom of the page
{\large \@date}

\end{center}
\end{titlepage}
\cleardoublepage
}
%====================================================
% Schematic environment
%\RequirePackage{tabularx}
\newcounter{myschematcounter}
\setcounter{myschematcounter}{0}
\renewcommand*{\themyschematcounter}{S\arabic{myschematcounter}}
\newsavebox{\myschematbox}
\newenvironment{schemat}%
{%
\refstepcounter{myschematcounter}%Increment the environment's counter
\begin{center}
\hfill
\begin{lrbox}{\myschematbox}
\begin{circuitikz}[scale=1.0] \ctikzset{voltage/distance from line=0.2}\ctikzset{voltage/european label distance=2.00} %
}%
{%
\end{circuitikz}
\end{lrbox}
\raisebox{-0.5\height}{\usebox{\myschematbox}}
\hfill
\raisebox{-0.5\height}{(\themyschematcounter)}
\end{center}
}%
%\numberwithin{myschematcounter}{section}%

%====================================================
%\def\debugbook{0}
\newcommand{\setdebug}{\def\bookcompilation{Debug}}
\newcommand{\setrelease}{\def\bookcompilation{Release}}
%Wyswietlanie wylko jednego zadania w trybie debugbook
\newcommand{\inputTask}[2][Release] 
{
%  \ifthenelse{\equal{#1}{Release}}{\input{#2}}{}
  \ifthenelse{\equal{#1}{\bookcompilation}}{\input{#2}}{}
}
%====================================================
%Nowe  środowisko dla zadań
\newcounter{tasknumber}[section]
\newenvironment{task}[1][]{\refstepcounter{tasknumber}\par\medskip
  \noindent \textbf{Zadanie~\thetasknumber. #1} \rmfamily}{\newpage}%\medskip

%\newpage

%\raggedbottom
%\setlength{\topskip}{1\topskip \@plus 5\p@}
%\doublehyphendemerits=10000       % No consecutive line hyphens.
%\brokenpenalty=10000              % No broken words across columns/pages.
%\widowpenalty=9999                % Almost no widows at bottom of page.
%\clubpenalty=9999                 % Almost no orphans at top of page.
%\interfootnotelinepenalty=9999    % Almost never break footnotes.

%\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
%\renewcommand{\sectionmark}[1]{}
%\renewcommand{\subsectionmark}[1]{}
%\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
%\hbox{}
%\thispagestyle{empty}
%\newpage
%\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
%\theoremstyle{plain}
%\newtheorem{example}{Example}[chapter]
%\newtheorem{theorem}{Theorem}[chapter]
%\newtheorem{corollary}[theorem]{Corollary}
%\newtheorem{lemma}[theorem]{Lemma}
%\newtheorem{proposition}[theorem]{Proposition}
%\newtheorem{axiom}[theorem]{Axiom}
%\theoremstyle{definition}
%\newtheorem{definition}[theorem]{Definition}
%\theoremstyle{remark}
%\newtheorem{remark}[theorem]{Remark}
%\usepackage[centerlast,small,sc]{caption}
%\setlength{\captionmargin}{20pt}
%\newcommand{\fref}[1]{Figure~\ref{#1}}
%\newcommand{\tref}[1]{Table~\ref{#1}}
%\newcommand{\eref}[1]{Equation~\ref{#1}}
%\newcommand{\cref}[1]{Chapter~\ref{#1}}
%\newcommand{\sref}[1]{Section~\ref{#1}}
%\newcommand{\aref}[1]{Appendix~\ref{#1}}
%\renewcommand{\topfraction}{0.85}
%\renewcommand{\bottomfraction}{.85}
%\renewcommand{\textfraction}{0.1}
%\renewcommand{\dbltopfraction}{.85}
%\renewcommand{\floatpagefraction}{0.75}
%\renewcommand{\dblfloatpagefraction}{.75}
%\setcounter{topnumber}{9}
%\setcounter{bottomnumber}{9}
%\setcounter{totalnumber}{20}
%\setcounter{dbltopnumber}{9}
%\usepackage{graphicx}
%\usepackage{epstopdf}
%\usepackage{booktabs}
%\usepackage{rotating}
%\usepackage{listings}
%\usepackage{lstpatch}
%\lstset{captionpos=b,
%        frame=tb,
%        basicstyle=\scriptsize\ttfamily,
%        showstringspaces=false,
%        keepspaces=true}
%\lstdefinestyle{matlab} {
%        language=Matlab,
%        keywordstyle=\color{blue},
%        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
%        stringstyle=\color[rgb]{0.7,0,0} }
%\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
%   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
%   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
%   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
%\pdfstringdefDisableCommands{
%   \let\\\space
%}

%\addtocounter{secnumdepth}{1}
%\setcounter{tocdepth}{6}
%\newcounter{dummy}
%\newcommand\addtotoc[1]{
%\refstepcounter{dummy}
%\addcontentsline{toc}{chapter}{#1}}
%\renewcommand\tableofcontents{
%\btypeout{Table of Contents}
%\addtotoc{Contents}
%\begin{spacing}{1}{
%    \setlength{\parskip}{1pt}
%    \if@twocolumn
%      \@restonecoltrue\onecolumn
%    \else
%      \@restonecolfalse
%    \fi
%    \chapter*{\contentsname
%        \@mkboth{
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
%    \@starttoc{toc}
%    \if@restonecol\twocolumn\fi
%   \cleardoublepage
%}\end{spacing}
%}
\endinput
