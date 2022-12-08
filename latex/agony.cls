\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agony}

%
% Options
%

\RequirePackage{kvoptions}
\DeclareStringOption{class}
\DeclareBoolOption{tikz}
\DeclareBoolOption{nogeometry}
\DeclareBoolOption{notes}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*
\ifagony@notes\LoadClass[11pt]{report}\else\LoadClass[11pt]{article}\fi

%
% Load packages
%

\usepackage{xparse}
\usepackage{xspace}

% Typography
\usepackage[english]{babel}
\usepackage{iftex}
\usepackage{amsfonts,amssymb}
\ifluatex
  \usepackage{unicode-math}
  \setmathfont{latinmodern-math.otf}
  % fixes because latinmodern-math is dumb
  \setmathfont[range=\mathbb]{texgyrepagella-math.otf}[AutoFakeBold=3] % restore nice-looking ℝ 
  \AtBeginDocument{
    \renewcommand\setminus{\smallsetminus} % ∖ should be small to look like an operator
    \renewcommand\varnothing{\diameter} % ∅ should obviously be
  }
\else
  \usepackage[T1]{fontenc}
  \usepackage{lmodern}
\fi

% Formatting
\usepackage[titles]{tocloft}
\addto\captionsenglish{\renewcommand{\contentsname}{\@title}}
\usepackage{titlesec}
\usepackage{multicol,collcell}
\usepackage[dvipsnames,table]{xcolor}
\usepackage{array} % for \newcolumntype macro

\usepackage{enumerate}
\usepackage{paralist}
\usepackage[shortlabels]{enumitem} % remove space before enums
\setlist[enumerate]{topsep=0pt}
\setlist[enumerate,1]{label={(\alph*)}}
\setlist[enumerate,2]{label={(\roman*)}}

% Math
\usepackage{amsmath}
\usepackage{physics}
\usepackage{cancel}
\usepackage{systeme}
\sysdelim.. % no curly braces
\usepackage{mathtools} % for \DeclarePairedDelimiter macro
\@ifpackageloaded{unicode-math}{
  \let\underbrace\LaTeXunderbrace
  \let\overbrace\LaTeXoverbrace
  \AtBeginDocument{
    % See https://github.com/wspr/unicode-math/issues/457
    \renewcommand{\Re}{\operatorname{Re}}
    \renewcommand{\Im}{\operatorname{Im}}
  }
}{}

% See https://tex.stackexchange.com/questions/510506/conflict-between-flexisym-and-polynom-packages
% \catcode`^=12 \catcode`_=12
\usepackage{polynom}
% \catcode`^=7 \catcode`_=8

% Figures
\ifagony@tikz
  \RequirePackage{tikz,pgfplots}
  \pgfplotsset{compat=1.15}
  \usepgfplotslibrary{fillbetween}
  \usetikzlibrary{patterns,positioning,shapes,calc,chains}
\fi

%
% Styles
%

\ifagony@nogeometry\else
  \headheight 13.6pt
  \setlength{\headsep}{10pt}
  \textwidth 15cm
  \textheight 24.3cm
  \evensidemargin 6mm
  \oddsidemargin 6mm
  \topmargin -1.1cm
  
  \RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[c]{\thepage}
  \lhead{\@title}
  \rhead{\@author}

  \fancypagestyle{firstpage}{
    \fancyhf{}
    \rhead{\@author}
    \fancyfoot[c]{\thepage}
  }
\fi
\setlength{\parskip}{1.5ex}
\parindent=0pt

\author{James Ah Yong}

% Links
\usepackage{imakeidx,bookmark,hyperref,cleveref}
\hypersetup{
  colorlinks,
  linkcolor=RoyalBlue,
  linktoc=all
}

% Question/Problem theorem styles
\usepackage{amsthm,thmtools}
\titleformat{\section}{\normalsize\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{1em}{}

\newcommand{\QType}{Q}
\newcounter{question}[subsection]
\renewcommand{\thequestion}{\QType\ifnum\value{question}<10 0\fi\arabic{question}}
\newcommand{\question}{\par\refstepcounter{question}\textbf{\thequestion}.\space}

\newcommand{\qsection}[2]{%
  \renewcommand{\QType}{#2}
  \section*{#1}
  \refstepcounter{section}
}
\declaretheoremstyle[
  spaceabove=6pt,spacebelow=6pt,
  headfont=\normalfont\itshape,bodyfont=\normalfont,
  qed=\qedsymbol]{proof}
\declaretheorem[sibling=question,style=definition,name=,
  refname={problem,problems},Refname={Problem,Problems}]{prob}
\declaretheorem[numberwithin=subsection,style=definition,name=Exercise,
  refname={exercise,exercises},Refname={Exercise,Exercises}]{xca}
\declaretheorem[name=Proof,style=proof,unnumbered]{prf}
\declaretheorem[name=Solution,style=proof,unnumbered]{sol}

%
% Macros
%

\newcommand{\thetitle}{\@title}

% properly typeset ε-δ (epsilon en dash delta)
\newcommand{\epsdel}[1][\delta]{\ensuremath{\epsilon\mathit{\textnormal{--}}#1}}
\newcommand{\nr}[1]{\refstepcounter{equation}\label{#1}\tag{\theequation}} % label in * env
\newcommand{\by}[1]{& \text{by #1}}
\newcommand{\IH}{\by{inductive hypothesis}}
\newcommand{\pf}[2]{%
\let\tmp\relax\newcommand\tmp[1]{#1}
\ensuremath{p_1^{\tmp{1}}p_2^{\tmp{2}}\cdots p_#2^{\tmp{#2}}}}
\newcommand{\FLT}{F\ensuremath{\ell}T}
% multiple choice (remove spacing between items)
\newenvironment{choices}{\begin{enumerate}[(a),nosep]}{\end{enumerate}}

% Cute initialisms (with versions for start of sentences)
\newcommand{\Wlog}{\textsc{wlog}\xspace}
\newcommand{\WLOG}{\textsc{Wlog}\xspace}
\newcommand{\Tfae}{\textsc{tfae}\xspace}
\newcommand{\TFAE}{\textsc{Tfae}\xspace}

% Typesetting
\newcolumntype{C}{>{$}c<{$}} % math version of "C" column type
\newcommand{\dint}{\displaystyle\int}
\newcommand{\dlim}[2]{\lim\limits_{#1\to#2}} % totally not \dfrac ripoff
\newcommand{\dilim}[1]{\dlim{#1}{\infty}} % infinite limits
\newcommand{\ilim}[1]{\lim_{#1\to\infty}}
\newcommand\at[2]{\left.#1\right|_{#2}}

% Sets
\newcommand{\bb}{\mathbb}
\newcommand{\N}{\ensuremath{\mathbb{N}}}
\newcommand{\Z}{\ensuremath{\mathbb{Z}}}
\newcommand{\Q}{\ensuremath{\mathbb{Q}}}
\newcommand{\R}{\ensuremath{\mathbb{R}}}
\newcommand{\C}{\ensuremath{\mathbb{C}}}
\newcommand{\F}{\ensuremath{\mathbb{F}}}
\let\U\@undefined
\newcommand{\U}{\ensuremath{\mathcal{U}}}
\let\O\@undefined
\newcommand{\O}{\ensuremath{\mathcal{O}}}
\newcommand{\Mnn}{\ensuremath{M_{n \times n}}}
\newcommand{\sym}{\mathbin{\triangle}}

% Functions
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\cis}{cis}

% Operators
\newcommand{\Rarr}{\Rightarrow}
\newcommand{\Larr}{\Leftarrow}
\newcommand{\Harr}{\Leftrightarrow}
\newcommand{\harr}{\leftrightarrow}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\newcommand{\dyx}{\dv{y}{x}}

% Linear Algebra
\newcommand{\trans}{^{\intercal}} % Transpose
\newcommand{\xto}{\xrightarrow} % \xto{R_1 \harr R_2}
\newcommand{\cbm}[2]{\ensuremath{{}_{#1}[I]{}_{#2}}} % change of basis matrix
\DeclareMathOperator{\Proj}{Proj}
\DeclareMathOperator{\Perp}{Perp}
\DeclareMathOperator{\Span}{Span}
\DeclareMathOperator{\Col}{Col}
\DeclareMathOperator{\adj}{adj}
% add optional argument for augmented matrices to ams *matrix environments and physics bmqty (tex.se 2233)
\renewcommand*\env@matrix[1][*\c@MaxMatrixCols c]{%
  \hskip -\arraycolsep%
  \let\@ifnextchar\new@ifnextchar%
  \array{#1}}
\RenewDocumentCommand{\bmqty}{om}{\IfValueTF{#1}{\begin{bmatrix}[#1]#2\end{bmatrix}}{\begin{bmatrix}#2\end{bmatrix}}}
\RenewDocumentCommand{\pmqty}{om}{\IfValueTF{#1}{\begin{pmatrix}[#1]#2\end{pmatrix}}{\begin{pmatrix}#2\end{pmatrix}}}
% function mqty
\newcommand{\fmqty}[1]{\pqty{\pmqty{#1}}}
% allow redefinition of inner product separator
\newcommand{\ipsep}{\middle\vert}
\RenewDocumentCommand{\innerproduct}{ s m g }
{\IfBooleanTF{#1}
  { % No resize
    \IfNoValueTF{#3}
    {\vphantom{#2}\left\langle\smash{#2}\ipsep\smash{#2}\right\rangle}
    {\vphantom{#2#3}\left\langle\smash{#2}\ipsep\smash{#3}\right\rangle}
  }
  { % Auto resize
    \IfNoValueTF{#3}
    {\left\langle{#2}\ipsep{#2}\right\rangle}
    {\left\langle{#2}\ipsep{#3}\right\rangle}
  }}

% Notes-specific macros (e.g. layout)
\ifagony@notes\input{agony-note.tex}\fi

% Class-specific macros
% Files are named agony-[class].sty and placed in this directory
\ifx\agony@class\@empty\else
  \IfFileExists{agony-\agony@class.tex}{\input{agony-\agony@class.tex}}{}
\fi
