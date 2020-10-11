\LoadClassWithOptions{scrreprt}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bhthesis}[2019/03/31 Custom report class built on top of scrreprt.]

\RequirePackage[utf8]{inputenc}
\RequirePackage[charter]{mathdesign}
\RequirePackage{graphicx}
\RequirePackage{tikz}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{framed}
\RequirePackage{xcolor}

\RequirePackage{mathtools}

\RequirePackage{fullpage}
\RequirePackage[Bjornstrup]{fncychap}
\ChTitleVar{\raggedright\Huge\sffamily\bfseries}
\ChNumVar{\fontsize{76}{80}\usefont{OT1}{pzc}{m}{n}\selectfont\color{aaudark}}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    linkcolor={green!50!black},
    citecolor={green!50!black},
    urlcolor={green!50!black}
}

\definecolor{aaulight}{RGB}{70,153,194}
\definecolor{aaudark}{RGB}{67,111,128}
\renewenvironment{leftbar}{
  \def\FrameCommand{{\color{aaulight}\vrule width 3pt} \hspace{10pt}}
  \MakeFramed {\advance\hsize-\width \FrameRestore}}{\endMakeFramed}

\declaretheoremstyle[spaceabove=5pt, spacebelow=5pt,
  headfont={\sffamily\bfseries},
  preheadhook=\begin{leftbar}, postfoothook=\end{leftbar}]{bhresult}

\declaretheorem[style=bhresult, name=Theorem]{theorem}
\declaretheorem[style=bhresult, name=Theorem, numbered=no]{theorem*}
\declaretheorem[style=bhresult, name=Proposition, sibling=theorem]{proposition}
\declaretheorem[style=bhresult, name=Proposition, numbered=no]{proposition*}
\declaretheorem[style=bhresult, name=Lemma, sibling=theorem]{lemma}
\declaretheorem[style=bhresult, name=Lemma, numbered=no]{lemma*}
\declaretheorem[style=bhresult, name=Corollary, sibling=theorem]{corollary}
\declaretheorem[style=bhresult, name=Corollary, numbered=no]{corollary*}


\declaretheoremstyle[spaceabove=6pt, spacebelow=10pt,
  headfont={\textcolor{aaulight}{$\blacktriangleright$}\ \sffamily},
  prefoothook={\textcolor{aaulight}{$\blacktriangleleft$}}]{bhremark}
\declaretheorem[style=bhremark, name=Definition, sibling=theorem]{definition}
\declaretheorem[style=bhremark, name=Definition, numbered=no]{definition*}
\declaretheorem[style=bhremark, name=Remark, numbered=no]{remark}
\declaretheorem[style=bhremark, name=Observation, numbered=no]{observation}
\declaretheorem[style=bhremark, name=Example, numbered=no]{example}

\newif\if@bachelor
\newif\if@master
\newif\if@diss

\DeclareOption{bachelor}{
  \@bachelortrue
  \@masterfalse
  \@dissfalse
}
\DeclareOption{master}{
  \@bachelorfalse
  \@mastertrue
  \@dissfalse
}
\DeclareOption{diss}{
  \@bachelorfalse
  \@masterfalse
  \@disstrue
}
\ProcessOptions

%
% Data to appear on the title page
% \author and \title are defined by the latex kernel
%
\gdef\@authorname{}
\gdef\@authornameone{}
\gdef\@authornamemore{}
\renewcommand\author[1]{\gdef\@author{#1}
  \let\@authorname\@authornameone}
\newcommand\authors[1]{\gdef\@author{#1}
  \let\@authorname\@authornamemore}
\renewcommand*{\@extratitle}{}
\renewcommand{\extratitle}[1]{\gdef\@extratitle{#1}}
\gdef\@reporttype{}
\newcommand \reporttype[1]{\gdef \@reporttype{#1}}
\gdef\@university{}
\newcommand \university[1]{\gdef \@university{#1}}
\gdef\@universityname{}
\newcommand \universityname[1]{\gdef \@universityname{#1}}
\gdef\@fakultaetname{}
\newcommand \fakultaetname[1]{\gdef \@fakultaetname{#1}}
\gdef\@studname{}
\newcommand \studname[1]{\gdef \@studname{#1}}
\gdef\@grade{}
\newcommand \grade[1]{\gdef \@grade{#1}}
\renewcommand{\and}{$\;\cdot\;$}
\gdef\@institute{}
\newcommand \institute[1]{\gdef \@institute{#1}}
\gdef\@researchgroup{}
\newcommand \researchgroup[1]{\gdef \@researchgroup{#1}}
\gdef\@advisor{}
\newcommand \advisor[1]{\gdef \@advisor{#1}}
\gdef\@firstreviewer{}
\newcommand\firstreviewer[1]{\gdef\@firstreviewer{#1}}
\gdef\@city{Klagenfurt}
\newcommand \city[1]{\gdef \@city{#1}}
\renewcommand*{\next@tpage}{\clearpage\thispagestyle{empty}}

%
% title page format
%
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Bold Line
\if@titlepage
    \renewcommand*\maketitle[1][1]{\begin{titlepage}%
    \setcounter{page}{#1}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
    \let\@oldmakefnmark\@makefnmark
    \def\@makefnmark{\rlap\@oldmakefnmark}
    \ifx\@extratitle\@empty \else
        \noindent\@extratitle\next@tpage\cleardoublepage\thispagestyle{empty}
    \fi
    \large
    %
    % Logo zentrieren (oder auch nicht)
    %
    \ifx\@university\@empty\else
      \@university\par
      \vskip 1em
    \fi
    \begin{center}
    \fontsize{12}{14}\selectfont
    {\lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em
    \HRule\par
    {\lineskip .5em%
     \sectfont\Huge
      \begin{tabular}[t]{c}%
        \@title
      \end{tabular}\par}%
    \HRule\par
    \vskip 2em
    {\huge\textsc{\@reporttype}}
    \vskip 1em
    \if@bachelor\else
    zur Erlangung des akademischen Grades \\
    \@grade
    \fi
    \vfill
    {\textsc{Studium}}\\[0.25em]
    {\Large\@studname}
    \vfill
    \@universityname \\[0.2em]
    \@fakultaetname
    \vfill
    \if@bachelor
      \begin{minipage}[t]{0.42\linewidth}
        \fontsize{14}{18}\selectfont
        {\textsc{Betreuer}}\\
        \fontsize{12}{14}\selectfont
        \@advisor
      \end{minipage}\hfill\,
    \fi
    \if@master
    \begin{center}
      \begin{minipage}[t]{0.42\linewidth}
        \fontsize{14}{18}\selectfont
        {\textsc{Betreuer}}\\
        \fontsize{12}{14}\selectfont
        \@advisor
      \end{minipage}
      \hfill
      \begin{minipage}[t]{0.47\linewidth}
        \flushright\fontsize{14}{18}\selectfont
        {\textsc{Gutachter}}\\
        \fontsize{12}{14}\selectfont
        \@firstreviewer
      \end{minipage}\\[2em]
      \hfill
    \end{center}
    \fi
    \if@diss
    \begin{center}
      \begin{minipage}[t]{0.42\linewidth}
        \fontsize{14}{18}\selectfont
        {\textsc{Betreuer}}\\
        \fontsize{13}{13}\selectfont
        \@advisor
      \end{minipage}
      \hfill
      \begin{minipage}[t]{0.47\linewidth}
        \flushright\fontsize{14}{18}\selectfont
        {\textsc{Erstgutachter}}\\
        \fontsize{13}{13}\selectfont
        \@firstreviewer
      \end{minipage}\\[2em]
      \hfill
      \begin{minipage}[t]{0.47\linewidth}
        \flushright\fontsize{14}{18}\selectfont
        {\textsc{Zweitgutachter}}\\
        \fontsize{13}{13}\selectfont
        \@firstreviewer
      \end{minipage}
    \end{center}
    \fi


    \vfill
    \fontsize{12}{12}\selectfont
    \hfill \@city, \@date
  \end{center}\par
  \pagestyle{empty}
  \cleardoublepage
  \end{titlepage}
    % \@thanks
    % \null
    % \if@twoside\next@tpage
    %     \noindent\begin{minipage}[t]{\textwidth}
    %     \@uppertitleback
    %     \end{minipage}\par
    %     \vfill
    %     \noindent\begin{minipage}[b]{\textwidth}
    %     \@lowertitleback
    %     \end{minipage}
    % \fi
    % \ifx\@dedication\@empty \else
    %     \next@tpage\null\vfill
    %     {\centering \Large \@dedication \par}
    %     \vskip \z@ \@plus3fill
    %     \if@twoside \next@tpage\cleardoublepage \fi
    % \fi
    % \end{titlepage}
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\@reporttype\@empty
    \global\let\@university\@empty
    \global\let\@institute\@empty
    \global\let\@researchgroup\@empty
    \global\let\@advisor\@empty
    \global\let\@city\@empty
    \global\let\@version\@empty
    \global\let\@uppertitleback\@empty
    \global\let\@lowertitleback\@empty
    \global\let\@dedication\@empty
    \global\let\author\relax
    \global\let\title\relax
    \global\let\date\relax
    \global\let\reporttype\@empty
    \global\let\university\@empty
    \global\let\universityname\@empty
    \global\let\institute\@empty
    \global\let\researchgroup\@empty
    \global\let\advisor\@empty
    \global\let\city\@empty
    \global\let\version\@empty
    \global\let\and\relax}
\else
     \newcommand*\maketitle[1][1]{%\par
       \@tempcnta=#1\relax\ifnum\@tempcnta=1\else
         \ClassWarning{kluconf}
                      {Optional argument of \string\maketitle\space ignored
                       at\MessageBreak
                       notitlepage-mode}\fi
       \begingroup
         \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
         \let\@oldmakefnmark\@makefnmark
         \def\@makefnmark{\rlap\@oldmakefnmark}
         \if@twocolumn
           \ifnum \col@number=\@ne
             \@maketitle
           \else
             \twocolumn[\@maketitle]%
           \fi
         \else
           \newpage
           \global\@topnum\z@   % Prevents figures from going at top of page.
           \@maketitle
         \fi
         \thispagestyle{empty}\@thanks
       \endgroup
       \setcounter{footnote}{0}%
       \let\thanks\relax
       \let\maketitle\relax
       \let\@maketitle\relax
       \global\let\@thanks\@empty
       \global\let\@author\@empty
       \global\let\@date\@empty
       \global\let\@title\@empty
       \global\let\@reporttype\@empty
       \global\let\@university\@empty
       \global\let\@institute\@empty
       \global\let\@researchgroup\@empty
       \global\let\@advisor\@empty
       \global\let\@city\@empty
       \global\let\@version\@empty
       \global\let\@uppertitleback\@empty
       \global\let\@lowertitleback\@empty
       \global\let\@dedication\@empty
       \global\let\author\relax
       \global\let\title\relax
       \global\let\date\relax
       \global\let\reporttype\@empty
       \global\let\university\@empty
       \global\let\institute\@empty
       \global\let\researchgroup\@empty
       \global\let\advisor\@empty
       \global\let\city\@empty
       \global\let\version\@empty
       \global\let\and\relax}
\fi
\def\@maketitle{%
  \clearpage
  \let\footnote\thanks
  \begingroup
  \parskip\z@ \parsep\z@
  \ifx\@extratitle\@empty \else
      \noindent\@extratitle \next@tpage \if@twoside \null\next@tpage \fi
  \fi
  \begin{center}%
    \@university\par
    \ifx\@reporttype\@empty \else
        \vskip 1em
  {\sc\@reporttype}\par
    \fi
    \vskip 1em
    {\sectfont\huge \@title \par}%
    \vskip 15pt%
    {\lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 15pt%
    \@date \par%
    \vskip \z@ \@plus 1em
    \ifx\@dedication\@empty \else
        \vskip 2em
        {\Large \@dedication \par}
    \fi
  \end{center}%
  \par
  \vskip 30pt
  \endgroup
}