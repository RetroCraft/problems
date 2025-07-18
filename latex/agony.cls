\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agony}

% 
% agony
% LaTeX class for note-taking and assignment-writing
% 

%
% Options
%

\RequirePackage{kvoptions}
\DeclareStringOption{class}
\DeclareBoolOption{tikz}
\DeclareBoolOption{minted}
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
  % \setmathfont[range={\mathscr,\mathbfscr}]{XITS Math} % restore different script font
  % [tex.se/648178] fix stacking
  \def\corrxits#1{\expanded{\Umathstackdenomdown#1=\the\Umathfractiondenomdown#1}\relax}
  \corrxits\scriptstyle       \corrxits\crampedscriptstyle
  \corrxits\textstyle         \corrxits\crampedtextstyle
  \corrxits\scriptscriptstyle \corrxits\crampedscriptscriptstyle
  \AtBeginDocument{
    \renewcommand\setminus{\smallsetminus} % ∖ should be small to look like an operator
    \renewcommand\varnothing{\diameter} % ∅ should obviously be
  }
\else
  \usepackage[T1]{fontenc}
  \usepackage{lmodern}
\fi
\usepackage{contour}
\usepackage[normalem]{ulem}
\renewcommand{\ULdepth}{1.8pt}
\contourlength{0.8pt}
\newcommand{\myuline}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}
\NewDocumentCommand\term{sO{#3}m}{\myuline{#3}\IfBooleanF#1{\index{#2}}}

% Formatting
\usepackage[titles]{tocloft}
\addto\captionsenglish{\renewcommand{\contentsname}{\@title}}
\usepackage{titlesec}
\usepackage{multirow,multicol,collcell}
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
    % [wspr/unicode-math#457]
    \renewcommand{\Re}{\operatorname{Re}}
    \renewcommand{\Im}{\operatorname{Im}}
  }
}{}

% [tex.se/510506]
% \catcode`^=12 \catcode`_=12
\usepackage{polynom}
% \catcode`^=7 \catcode`_=8

% Figures
\RequirePackage{float}
\ifagony@tikz
  \RequirePackage{tikz,pgfplots,transparent,annotate-equations}
  \pgfplotsset{compat=1.15}
  \usepgfplotslibrary{fillbetween}
  \usetikzlibrary{patterns,positioning,shapes,calc,chains,tikzmark}
  \tikzset{
    vertalign/.style = {
        baseline={([yshift=-.8ex]current bounding box.center)}
      },
    bold/.style = {font=\bfseries},
    annotate equations/text/.style={font=\footnotesize},
  }
\fi

\ifagony@minted
  % [gpoore/minted#181]
  \@namedef{ver@framed.sty}{9999/12/31}
  \@namedef{opt@framed.sty}{}
  \RequirePackage{minted}
  \usemintedstyle{tango}
  \newminted{pseudo}{autogobble,mathescape,escapeinside=@@,linenos}
\fi

%
% Styles
%

\ifagony@nogeometry\else
  \usepackage{geometry}
  \geometry{letterpaper,margin=1in}
  % increase header for fancyhdr
  \setlength{\headheight}{15pt}
  \setlength{\topmargin}{-20pt}
  \setlength{\headsep}{1.5ex}

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
\usepackage{imakeidx,bookmark,hyperref}
\RequirePackage{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=RoyalBlue,
  linktoc=all
}

% Question/Problem theorem styles
\usepackage{mdframed}
\usepackage{amsthm,thmtools,thm-restate}

\newcounter{question}[subsection]
\renewcommand{\thequestion}{Q\ifnum\value{question}<10 0\fi\arabic{question}}
\newcommand{\question}{\par\refstepcounter{question}\textbf{\thequestion}.\space}
\declaretheorem[sibling=question,style=definition,name=,
  refname={problem,problems},Refname={Problem,Problems}]{prob}

\declaretheoremstyle[
  spaceabove=6pt,spacebelow=6pt,
  headfont=\normalfont\itshape,bodyfont=\normalfont,
  qed=\qedsymbol]{proof}
\declaretheorem[name=Proof,style=proof,unnumbered]{prf}
\declaretheorem[name=Solution,style=proof,unnumbered]{sol}

%
% Macros
%

\newcommand{\nr}[1]{\refstepcounter{equation}\label{#1}\tag{\theequation}} % label in align* env
% \skipto{5} immediately before environment #5
\newcommand{\skipto}[2][theorem]{\setcounter{#1}{#2}\addtocounter{#1}{-1}}

% Cute initialisms (with versions for start of sentences)
\newcommand{\Wlog}{\textsc{wlog}\xspace}
\newcommand{\WLOG}{\textsc{Wlog}\xspace}
\newcommand{\Tfae}{\textsc{tfae}\xspace}
\newcommand{\TFAE}{\textsc{Tfae}\xspace}
\newcommand{\xth}{\textsuperscript{th}\xspace}
\newcommand{\nd}{\textsuperscript{nd}\xspace}

% Typesetting
\newcolumntype{C}{>{$}c<{$}} % math version of "C" column type
\newcommand{\dint}{\displaystyle\int}
\newcommand{\dlim}[2]{\lim\limits_{#1\to#2}} % totally not \dfrac ripoff
\newcommand{\dilim}[1]{\dlim{#1}{\infty}} % infinite limits
\newcommand{\ilim}[1]{\lim_{#1\to\infty}}
\newcommand{\at}[2]{\left.#1\right|_{#2}}
\newcommand{\mmid}{\mathrel{\middle|}}
\newcommand{\br}{\\} % non-aligning line break

% Fonts
\newcommand{\bb}{\mathbb}
\newcommand{\rv}{\mathsf} % random variable => sans-serif
\newcommand{\vv}{\mathsf} % algorithm variable => sans-serif
\newcommand{\xx}{\mathtt} % hex literal => typewriter
\newcommand{\sv}{\mathcal} % set variable => caligraphic

% Sets
\newcommand{\N}{\ensuremath{\bb{N}}}
\newcommand{\Z}{\ensuremath{\bb{Z}}}
\newcommand{\Q}{\ensuremath{\bb{Q}}}
\newcommand{\R}{\ensuremath{\bb{R}}}
\newcommand{\C}{\ensuremath{\bb{C}}}
\newcommand{\F}{\ensuremath{\bb{F}}}

% Functions
\newcommand{\fn}{\operatorname}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\id}{id}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator{\cis}{cis}

% Operators
\newcommand{\Rarr}{\Rightarrow}
\newcommand{\Larr}{\Leftarrow}
\newcommand{\Harr}{\Leftrightarrow}
\newcommand{\harr}{\leftrightarrow}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\newcommand{\xor}{\oplus}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% Calculus
\newcommand{\dyx}{\dv{y}{x}}

% Linear Algebra
\newcommand{\trans}{^{\intercal}} % Transpose
\newcommand{\xto}{\xrightarrow} % \xto{R_1 \harr R_2}
\newcommand{\xfrom}{\xleftarrow}
\DeclareMathOperator{\Proj}{Proj}
\DeclareMathOperator{\Perp}{Perp}
\DeclareMathOperator{\Span}{Span}
\DeclareMathOperator{\Col}{Col}
\DeclareMathOperator{\adj}{adj}
% [tex.se/2233] add optional argument for augmented matrices to ams *matrix environments and physics bmqty
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

% Category Theory
\newcommand{\cat}[1]{\symsf{#1}}
\renewcommand{\op}{^{\cat{op}}} % overrides physics.sty \op for \outerproduct
\DeclareMathOperator{\Obj}{Obj}
\newcommand{\Hom}[1][]{\ifthenelse{\isempty{#1}}{\operatorname{Hom}}{\operatorname{Hom}_{\cat{#1}}}}
\newcommand{\End}[1][]{\ifthenelse{\isempty{#1}}{\operatorname{End}}{\operatorname{End}_{\cat{#1}}}}
\newcommand{\mono}{\rightarrowtail}
\newcommand{\epi}{\twoheadrightarrow}
\newcommand{\into}{\hookrightarrow}
\newcommand{\toto}{\rightrightarrows}
\newcommand{\tofrom}{\rightleftarrows}

% Group Theory
\DeclareMathOperator{\Aut}{Aut}

% Class-specific macros
% Files are named agony-[class].sty and placed in this directory
\ifx\agony@class\@empty\else
  \IfFileExists{agony-\agony@class.tex}{\input{agony-\agony@class.tex}}{}
\fi

% Notes-specific macros (e.g. layout)
\ifagony@notes\input{agony-note.tex}\fi
