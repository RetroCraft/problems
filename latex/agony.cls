\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{agony}

%
% Options
%

\RequirePackage{kvoptions}
\DeclareStringOption{class}
\DeclareBoolOption{tikz}
\DeclareBoolOption{nogeometry}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*
\LoadClass[11pt]{article}

%
% Load packages
%

\usepackage{xparse}
\usepackage{xspace}

% Typography
\usepackage[english]{babel}
\usepackage{iftex}
\ifluatex
  \usepackage{unicode-math}
  \AtBeginDocument{\renewcommand\setminus{\smallsetminus}}
  \setmathfont{latinmodern-math.otf}[AutoFakeBold=3]
\else
  \usepackage[T1]{fontenc}
  \usepackage{lmodern}
  \usepackage{amsfonts,amssymb}
\fi

% Formatting
\usepackage[titles]{tocloft}
\renewcommand*\contentsname{\@title}
\usepackage{titlesec}
\usepackage{multicol,collcell}
\usepackage[dvipsnames,table]{xcolor}
\usepackage{array} % for \newcolumntype macro

\usepackage{enumerate}
\usepackage[shortlabels]{enumitem} % remove space before enums
\setlist[enumerate]{topsep=0pt}

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
}{}

% See https://tex.stackexchange.com/questions/510506/conflict-between-flexisym-and-polynom-packages
\catcode`^=12 \catcode`_=12
\usepackage{polynom}
\catcode`^=7 \catcode`_=8

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
\usepackage{hyperref,cleveref}
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

% Statistics
\def\@stat{stat230}
\ifx\agony@class\@stat
  \RequirePackage{minted}
  \definecolor{bg}{rgb}{0.95,0.95,0.95}
  \usemintedstyle{tango}
  \newminted{r}{autogobble,mathescape,bgcolor=bg}
  \newcommand{\rr}{\mintinline{r}}
  \newminted[outcode]{text}{autogobble,mathescape,escapeinside=||}
  \DeclareMathOperator{\Bi}{Binomial}
  \DeclareMathOperator{\Hyp}{Hypergeometric}
  \DeclareMathOperator{\NB}{Negative Binomial}
  \DeclareMathOperator{\Geo}{Geometric}
  \DeclareMathOperator{\Pois}{Poisson}
  \DeclareMathOperator{\Exp}{Exponential}
  \DeclareMathOperator{\Unif}{Uniform}
  \DeclareMathOperator{\Var}{Var}
  \DeclareMathOperator{\Cov}{Cov}
  \DeclareMathOperator{\SD}{SD}
  \setlist[enumerate,1]{label={(\alph*)}}
  \setlist[enumerate,2]{label={(\roman*)}}
\fi
\def\@logic{cs245}
\ifx\agony@class\@logic
  \RequirePDFTeX
  \RequirePackage{breqn} % breaks with unicode-math, isolating issue to here

  \setlist[enumerate,1]{label={(\alph*)}}
  \setlist[enumerate,2]{label={(\roman*)}}

  \RequirePackage{forest}
  \RequirePackage{turnstile}
  \RequirePackage{bussproofs}
  \EnableBpAbbreviations

  \let\Form\@undefined % Overrides hyperref's Form environment
  \DeclareMathOperator{\Form}{Form}
  \DeclareMathOperator{\Atom}{Atom}
  \DeclareMathOperator{\Term}{Term}
  \DeclareMathOperator{\Sent}{Sent}
  \renewcommand{\L}{\ensuremath{\mathcal{L}}} % Overrides \L -> Ł
  \newcommand{\Lp}{\ensuremath{\mathcal{L}^p}}

  \renewcommand{\S}{\ensuremath{\Sigma}\xspace} % Overrides \S -> §

  % Operators
  \newcommand{\timplies}{\models}
  \newcommand{\tequiv}{\mathrel{\models\!\mid}}
  \newcommand{\deduces}{\vdash}
  \newcommand{\dequiv}{\mathrel{\vdash\hspace{-0.8em}\reflectbox{$\vdash$}}}
  \newcommand{\nharr}{\nleftrightarrow}

  % Shorthands
  \newcommand{\0}{\ensuremath{\emptyset}\xspace}
  \newcommand{\n}{\ensuremath{\lnot}\xspace}
  \renewcommand{\o}{\ensuremath{\lor}\xspace} % overrides ø
  \renewcommand{\a}{\ensuremath{\land}\xspace} % overrides something that looks important
  \renewcommand{\i}{\ensuremath{\to}\xspace} % overrides dotless i
  \newcommand{\e}{\ensuremath{\harr}\xspace}
  \def\Tab{&}
  \def\tab{\ifinalign@\Tab\fi}
  \renewcommand{\t}{\ensuremath{\timplies}\xspace} % overrides tie
  \renewcommand{\tt}{\ensuremath{\tequiv}\xspace} % overrides monospace font
  \renewcommand{\d}{\ensuremath{\deduces}\xspace} % overrides dot under
  \renewcommand{\dd}{\ensuremath{\dequiv}\xspace} % overrides physics derivative
  \newcommand{\E}{\ensuremath{\in}\xspace}
  \newcommand{\A}[1][\!]{\ensuremath{\forall}#1\,\xspace}
  \newcommand{\X}[1][\!]{\ensuremath{\exists}#1\,\xspace}
  \newcommand{\eq}{\ensuremath{\approx}\xspace}

  % Shamelessly stolen from Arthur
  \newcounter{deduction}
  \NewDocumentEnvironment{deduction}{s}
    {\refstepcounter{deduction}\IfBooleanTF{#1}{}{\proof}\setcounter{equation}{0}\align}
    {\endalign\IfBooleanTF{#1}{}{\endproof}}
  \newcommand{\linternal}[2]{\label{proof:#1:eqn:#2}}
  \newcommand{\rinternal}[2]{\ref{proof:#1:eqn:#2}}
  \newcommand{\nrinternal}[2]{\nameref{proof:#1:eqn:#2}}
  \renewcommand{\l}[1]{\linternal{\thededuction}{#1}}
  \renewcommand{\r}[1]{\rinternal{\thededuction}{#1}}
  \renewcommand{\nr}[1]{\nrinternal{\thededuction}{#1}}
  \renewcommand{\j}[1]{&\text{(#1)}} % for justification

  \ExplSyntaxOn
  \tl_new:N \l__agony_deduce_tl
  \NewDocumentEnvironment{deduceinternal}{+b}
   {
    \tl_set:Nn \l__agony_deduce_tl { #1 }
    \regex_replace_all:nnN { \<\-\> } { \c{e} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \-\> } { \c{i} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \|\-\| } { \c{tab}\c{dd} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \|\- } { \c{tab}\c{d} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \|\=\| } { \c{tab}\c{tt} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \|\= } { \c{tab}\c{t} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \! } { \c{n} } \l__agony_deduce_tl
    \regex_replace_all:nnN { (\W)\-(\W) } { \1\c{ensuremath}\cB\{-\cE\}\2 } \l__agony_deduce_tl
    \regex_replace_all:nnN { \band\b } { \c{a} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \bor\b } { \c{o} } \l__agony_deduce_tl
    \regex_replace_all:nnN { \~ } { \c{eq} } \l__agony_deduce_tl
    \tl_use:N \l__agony_deduce_tl
   }
   {}
  \newenvironment{deduce}{\refstepcounter{deduction}\setcounter{equation}{0}\deduceinternal\align}{\endalign\enddeduceinternal}
  \newenvironment{deduce*}{\refstepcounter{deduction}\setcounter{equation}{0}\deduceinternal\start@align\@ne\st@rredtrue\m@ne}{\endalign\enddeduceinternal}
  \newcommand{\@resolvent}[1]{\ifthenelse{\equal{#1}{Prem}}{Premise}{\ifthenelse{\equal{#1}{NegCon}}{Negation\ of\ conclusion}{Resolvent\ of\ #1}}}
  \newcommand{\@resolve}[1]{\expandafter\ifx\expandafter\##1\else\@resolvent{#1}\fi}
  \newenvironment{resolution}{\refstepcounter{deduction}\setcounter{equation}{0}\center\deduceinternal\tabular{>{\refstepcounter{equation}\theequation.}r>{\collectcell\logic}l<{\endcollectcell}>{\collectcell\@resolve}l<{\endcollectcell}}}{\endtabular\enddeduceinternal\endcenter}
  \newenvironment{setofsupport}{\refstepcounter{deduction}\setcounter{equation}{0}\center\deduceinternal\tabular{>{\refstepcounter{equation}\theequation.}r>{\collectcell\logic}l<{\endcollectcell}>{\collectcell\@resolvent}l<{\endcollectcell}>{$\S=\{}r<{\}$}}}{\endtabular\enddeduceinternal\endcenter}
  \ExplSyntaxOff
  \newcommand{\logic}[1]{\ensuremath{\begin{deduceinternal}#1\end{deduceinternal}}}
  \newcolumntype{L}{>{\collectcell\logic}c<{\endcollectcell}}

  % Hoare triples
  \usepackage{stmaryrd}
  \DeclarePairedDelimiter\hoare{{\,\llparenthesis\,}}{{\,\rrparenthesis\,}}
  \newcommand{\Hoare}[1]{\logic{\hoare{#1}}}
  \RequirePackage{minted}
  \usemintedstyle{tango}
  \newminted{c}{autogobble,mathescape,escapeinside=@@}
  % bugged math symbols
  \newcommand\m{\mathrel{\text{\textminus}}}
  \newcommand\lt{\mathrel{\text{\textless}}}
  \newcommand\gt{\mathrel{\text{\textgreater}}}
  \newcommand\hj[1]{\hspace{5em}\textrm{#1}} % Hoare justification
\fi

\def\@optimization{co250}
\ifx\agony@class\@optimization
  \setlist[enumerate,1]{label={(\alph*)}}
  \setlist[enumerate,2]{label={\roman*.}}
  \RequirePackage{nicematrix} % For labelled matrices
  \newcommand{\zero}{\mathbb{0}}
  \newcommand{\one}{\mathbb{1}}
  
  \newenvironment{lp}[2]%
    {\begin{equation*}\aligned #1 && \multicolumn{4}{l}{$#2$} \\ \mathrm{s.t.}}%
    {\endaligned\end{equation*}}
\fi

\def\@macroecon{ec260}
\ifx\agony@class\@macroecon
  \setlist[enumerate,1]{label={(\alph*)}}
  \setlist[enumerate,2]{label={(\roman*)}}
\fi

\def\@datastructures{cs240}
\ifx\agony@class\@datastructures
  \setlist[enumerate,1]{label={\textbf{(\alph*)}}}
  \setlist[enumerate,2]{label={\textbf{(\roman*)}}}

  \RequirePackage{minted}
  \usemintedstyle{tango}
  \newminted{pseudo}{autogobble,mathescape,escapeinside=@@,linenos}

  % Pseudocode
  \RequirePackage{algorithm}
  \RequirePackage{algpseudocodex}
  \algrenewcommand\textproc{\textit}

  % Automatically create dummy bookmarks for splitting file
  \let\@prob\prob
  \renewcommand{\prob}{\pdfbookmark{\thequestion}{\thequestion}\@prob}
\fi

\def\@combinatorics{math239}
\ifx\agony@class\@combinatorics
  \newcommand{\id}{\operatorname{id}}
  \newcommand{\bijects}{\rightleftharpoons}
  \newcommand{\powerset}{\mathcal{P}}
\fi

\def\@hardware{cs251}
\ifx\agony@class\@hardware
  \setlist[enumerate,1]{label={(\alph*)}}
  \setlist[enumerate,2]{label={(\roman*)}}
  \newcommand{\integ}[2]{
    Statement of Academic Integrity for \thetitle

    I declare the following statements to be true:
    \begin{itemize}[nosep]
      \item I have not used any unauthorized aids.
      \item I recognize that while I can discuss the questions in this assignment on Piazza and
      other forums with the instructors and with other students in the class, the write up
      that I am submitting is my own.
      \item I am aware that misconduct related to course work can result in significant penalties,
      including failing the course and suspension (this is covered in Policy 71)
    \end{itemize}

    \textbf{Student Name:} \@author
    
    \textbf{UW ID\#:} #1

    \textbf{Signature:} \includegraphics[height=15px]{#2}

    \textbf{Date:} \today
    \pagebreak
  }
\fi
