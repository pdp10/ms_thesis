%
% CUEDthesis v1.1
% By Harish Bhanderi <harish.bhanderi@cantab.net
% Version 1.0 released 15/07/2002
% Version 1.1 released 14/07/2010
% Modified in 2012 by Piero Dalle Pezze 
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUEDthesisPSnPDF}[2010/07/14 v1.1 CUED thesis class]
%-------------------------- initial code -----------------------
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
\ProcessOptions\relax%

\ifCU@bookmode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
   \LoadClass[dvips, a4paper]{book}%
\else%
   \LoadClass[pdftex, a4paper]{book}%
\fi%
\else
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
  \LoadClass[dvips, a4paper]{report}%
\else%
   \LoadClass[pdftex, a4paper]{report}%
\fi%
%\renewcommand{\refname}{References}%
\fi

%\DeclareOption{book}{%
%}%
\usepackage{setspace}
\usepackage{tocbibind}
\usepackage{amsmath, amsthm, amssymb}
%\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{eucal}
\usepackage[english]{babel} % american english    (does not split mTORC1)
%\usepackage[british]{babel}  % british english   (splits mT-ORC1)
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}






% natbib (old) - add pagebackref from the hyperref options
\usepackage[square, sort, numbers, authoryear]{natbib}

% Remove authoryear if \bibliographystyle{Classes/CUEDbiblio} is used.
%\usepackage[square, sort, numbers]{natbib}

% biblatex (new) - remove pagebackref from the hyperref options
%\usepackage[style=authoryear,backref=false,hyperref=true,natbib=true]{biblatex} 

\usepackage{ifthen}
\usepackage{ifpdf}


%Table of Content
%uncomment next line to change 'contents' name to 'table of content'
\AtBeginDocument{\renewcommand\contentsname{Table of Contents}}

%Bibliography
%uncomment next line to change bibliography name to references for Book document class
\renewcommand{\bibname}{References}
% note that this doesn't do much if you later define another bibliography style 



% Nomenclature
\usepackage[intoc,norefpage,norefeq]{nomencl}
\makenomenclature
\renewcommand{\nompreamble}{\markboth{Nomenclature}{Nomenclature}}
% \renewcommand\nomgroup[1]{%
%   \ifthenelse{\equal{#1}{A}}{%
%    \item[\textbf{Acronyms}] }{%             	A - Acronyms
%     \ifthenelse{\equal{#1}{G}}{%
%      \item[\textbf{Greek Symbols}]}{%             G - Greek
%       \ifthenelse{\equal{#1}{R}}{%
%         \item[\textbf{Roman Symbols}]}{%              R - Roman
%           \ifthenelse{\equal{#1}{P}}{%
%            \item[\textbf{Superscripts}]}{{%             P - Superscripts
% 	    \ifthenelse{\equal{#1}{B}}{%
% 	     \item[\textbf{Subscripts}]}{{%    		B - Subscripts
% 	    \ifthenelse{\equal{#1}{Z}}{%
% 	     \item[\textbf{Other Symbols}]}%              Z - Other Symbols
%               			{{}}}}}}}}}}

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = OneColumn, % display single page, advancing flips the page - Sasa Tomic
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 %pagebackref, % only if natbib is used
% Override hyper links colours (for printing) and for leaving the hyperlink to the names of the sections instead of their page number.
                 colorlinks = true,
                 linkcolor = blue,  % black, %
                 urlcolor  = blue,  % black, %
                 citecolor = red,  % black, %
                 anchorcolor = green,  % black, %
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref} 
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}

    \pdfcompresslevel=9
    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 %pagebackref,  % only if natbib is used
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

%define the page size including an offset for binding
%\setlength{\topmargin}{0.0in}
%\setlength{\oddsidemargin}{0in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textheight}{700pt}
%\setlength{\textwidth}{500pt}


%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{1.96cm}
%\setlength{\oddsidemargin}{-0.54cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markright{\thechapter.\ #1}{}}
%\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{}
\fancyhf{}
%\fancyhead[RO]{\bfseries\rightmark} % [TABLE OF CONTENTS]
%\fancyhead[LE]{\bfseries\leftmark}
\fancyhead[RO]{\bfseries{\nouppercase{\rightmark}}} % [Table of Contents]
\fancyhead[LE]{\bfseries{\nouppercase{\leftmark}}}

\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The submitted text. (e.g. A thesis submitted for the degree of)
\def\submittedtext#1{\gdef\@submittedtext{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}


%define title page layout
\renewcommand{\maketitle}{%
\pagenumbering{roman} % Sasa Tomic
\setcounter{page}{0}  % Sasa Tomic
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  %\null \vfill
  \begin{center}
    { \huge {\bfseries {\@title}} \par}
  %\null \vfill
{\large \vspace*{20mm} {{\@crest} \par} \vspace*{20mm}}
  %\null \vfill
    {{\large \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    %{{\submittedtext} \par}
    {{\@submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{4ex}
    {\@degreedate}}
  \end{center}
  %\null \vfill
\end{alwayssingle}}




% Small figure caption (``footnotesize'' or ``small'' are fine)
\usepackage[footnotesize]{caption}
\usepackage{pdfpages}
\usepackage[absolute]{textpos}
\newcommand{\argmin}{\operatornamewithlimits{argmin}}
%\usepackage{amsthm, amssymb}
\newtheorem{rationale}{Rationale}
\newtheorem{lemma}{Lemma}
\newtheorem{theorem}{Theorem}
\newtheorem{definition}{Definition}
% This packages add hyphenations
\usepackage{hyphenat}    % TSC1\hyp{}TSC2
%\usepackage[shortcuts]{extdash}  % TSC1\-/TSC2





% Reduce the space above chapter title, table of contents, etc by replacing \vspace*{50\p@}
\makeatletter
\renewcommand*\@makechapterhead[1]{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
% the table of contents and other sectional units that use \chapter* (\@makeschapterhead) 
\renewcommand*\@makeschapterhead[1]{%
  %\vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\makeatother






% DECLARATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{declaration}
{\begin{alwayssingle}
  %\pagestyle{empty}
  \begin{center}
  %\vspace*{1.5cm}
  \vspace*{0.4cm}
  {\Large \bfseries Declaration}
  \end{center}
  \vspace{0.5cm}
%  \begin{quote}
}
{
%\end{quote}
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  %\pagestyle{empty}
  \begin{center}
  \vspace*{0.4cm}
  {\Large }
  \end{center}
  \vspace{0.5cm}
%  \begin{quote} 
\begin{center}}
{\end{center} 
%\end{quote} 
\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acks}
{\begin{alwayssingle}
%\pagestyle{empty}
\begin{center}
\vspace*{0.4cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
%\begin{quote}
}
{
%\end{quote}
\end{alwayssingle}}

% PEOPLE
%
% The people environment makes sure the list of people gets its
% own page.

\newenvironment{people}
{\begin{alwayssingle}
  %\pagestyle{empty}
  \vspace*{0.4cm}
  %\hspace{2.5cm}
  }
{\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle}
%\pagestyle{empty}
\begin{center}
\vspace*{0.4cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} 
{\begin{alwayssingle} 
  %\pagestyle{empty}
  \begin{center}
  \vspace*{0.4cm}
  {\Large \bfseries Abstract}
  \end{center}
  \vspace{0.5cm}
   %\begin{quote}
}
{
%\end{quote}
\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} 
{\begin{alwayssingle} 
  %\pagestyle{empty}
  \begin{center}
  \vspace*{0.4cm}
  {\Large \bfseries Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} 
  {\begin{alwayssingle} 
  %\pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}



%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}




% A new definition for descriptive lists
%
% list item multilined ( `\newline` inside of item label ?)
% See Forum http://tex.stackexchange.com/questions/68973/list-item-multilined-newline-inside-of-item-label
% \bf (list descriptor in bold)
\newenvironment{my_bold_description}[1]
  {\list{}{\renewcommand\makelabel[1]{\bf##1\hfil}%
     \settowidth\labelwidth{\makelabel{\bf#1}}%
     \setlength\leftmargin{\dimexpr\labelwidth+\labelsep\relax}}}
  {\endlist}

% As before but in italics (\it)
\newenvironment{my_italics_description}[1]
  {\list{}{\renewcommand\makelabel[1]{\it##1\hfil}%
     \settowidth\labelwidth{\makelabel{\it#1}}%
     \setlength\leftmargin{\dimexpr\labelwidth+\labelsep\relax}}}
  {\endlist}




% Appendix
%
% (see http://tex.stackexchange.com/questions/15974/add-appendix-before-a-for-appendix-a-in-thesis-toc)
%The appendix package adds some extra functionality for dealing with appendices. This extra functionality (including the one you need) is accessed by using the \appendices environment instead of the \appendix command. So changing your thesis class \backmatter command to remove the \appendix command, along the with [titletoc] option of the package (which appends the appendix name to the letter in the TOC) should solve your problem.
\usepackage[titletoc]{appendix}
\makeatletter
\renewcommand\backmatter{
    \def\chaptermark##1{\markboth{%
        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}{%
        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}}%
    \def\sectionmark##1{\relax}}
\makeatother