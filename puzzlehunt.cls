% Class for puzzlehunt booklets
% See http://en.wikibooks.org/wiki/LaTeX/Creating_Packages
% and the version used with https://github.com/MaPPmath/hsc16
% Use with:
%     \documentclass{puzzlehunt}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{puzzlehunt}[2016/07/05 PUZZLEHUNT]

% No fancy options, please
\DeclareOption*{
  \ClassWarning{puzzlehunt}{No class options allowed.}
}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass[11pt,openany,oneside,letterpaper]{book}

% Page formatting
\RequirePackage[margin=0.8in]{geometry}

% Space out paragraphs
\setlength{\parskip}{6pt plus1pt minus1pt}




% Graphics
\RequirePackage{graphicx} % to display images

% Logicpuzzle package
\RequirePackage{logicpuzzle}
\let\titleformat\undefined % to avoid namespace collision with titlesec

% Datetime formatting
\RequirePackage[yyyymmdd,hhmmss]{datetime}

% Fonts
\usepackage{cmbright}
\usepackage[T1]{fontenc}


% Custom Title Page

\newcommand{\phBannerLogo}{example-image-16x10.pdf}% uses mwe image
\newcommand{\phSetBannerLogo}[1]{\renewcommand{\phBannerLogo}{#1}}

\newcommand{\phTitlePage}{%
\begin{titlepage}
  \begin{center}
	\includegraphics[width=0.6\textwidth]{\phBannerLogo}\par\vspace{1cm}
	{\Huge\textbf{\@title} \par}
	\vspace{2em}
	{\LARGE\textit{\@author} \par}
	\vfill
	{\large Version \@date \par}
  \end{center}
\end{titlepage}
}

\newcommand{\phTableOfContents}{\tableofcontents}


% Custom Chapter/Section Headings
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}

\pagestyle{empty}
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
% \fancyfoot[C]{\textbf{\thepage}} % except the center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

\newcommand{\phSquareLogo}{example-image-1x1.pdf}% uses mwe image
\newcommand{\phSetSquareLogo}[1]{\renewcommand{\phSquareLogo}{#1}}

\newcommand{\phSetChapterDefaultStyle}[1]{
  \titleformat{\chapter}[display]{}{}{0pt}
  {
    \Large\bfseries
    \vspace*{-1.5em}
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \@title \vspace{0.1in}} \\
      {\Huge \bfseries #1 \vspace{0.25in}}
    \end{tabular}
    \vspace{1em}
  }
  \titlespacing*{\chapter}{0pt}{*0}{0pt}
}
\newcommand{\phSetChapterWorksheetStyle}[2]{
  \titleformat{\chapter}[display]{}{}{0pt}
  {
    \Large\bfseries
    \vspace*{-1.5em}
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \@title \vspace{0.1in}} \\
      {\Huge \bfseries #1 \vspace{0.1in}} \\
      {\LARGE \bfseries #2 \vspace{0.05in}}
    \end{tabular}
  }
  \titlespacing*{\chapter}{0pt}{*0}{0pt}
}

\phSetChapterDefaultStyle{}


\newcommand{\phSetSectionFancyStyle}[1]{
  \titleformat{\section}[display]{}{}{0pt}
  {
    \Large\bfseries
    \includegraphics[height=1.2in]{\phSquareLogo}
    \begin{tabular}[b]{l}
      {\Large \@title \vspace{0.1in}} \\
      {\Huge \bfseries \phChapterName \vspace{0.1in}} \\
      {\LARGE \bfseries #1 \vspace{0.05in}}
    \end{tabular}
    \vspace{1em}
  }
  \titlespacing{\section}{0pt}{0pt}{0pt}
}

\newcommand{\phSetSectionSimpleStyle}[1]{
  \titleformat{\section}[hang]{\normalfont\Large\bfseries}{}{0pt}{#1}
  \titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
}
\newcommand{\phSetSectionEmptyStyle}[1]{
  \titleformat{\section}[hang]{}{}{0pt}{}
  \titlespacing*{\section}{0pt}{0pt}{0pt}
}

\phSetSectionSimpleStyle{}

\newcommand{\phChapterName}{\@title}
\newcommand{\phSetChapterName}[1]{\renewcommand{\phChapterName}{#1}}

\newcommand{\phPart}[1]{\part{#1}}
\newcommand{\phChapter}[1]{\phSetChapterDefaultStyle{#1}\chapter{#1}\phSetChapterName{#1}}
\newcommand{\phChapterWorksheet}[2]{\phSetChapterWorksheetStyle{#1}{#2}\chapter{#1}\phSetChapterName{#1}\phSetSectionEmptyStyle{#2}\section{#2}}
\newcommand{\phSection}[1]{\phSetSectionSimpleStyle{#1}\section{#1}}
\newcommand{\phWorksheet}[1]{\newpage\phSetSectionFancyStyle{#1}\section{#1}}



% Example environment
\newsavebox{\@phExampleBox}
\newenvironment{phExample}{
  \begin{center}
    \begin{lrbox}{\@phExampleBox}
      \begin{minipage}{.9\linewidth}
        \vspace{1em}
        \begin{center}
          \begin{minipage}{.9\linewidth}
            \textbf{Example}
}{
          \end{minipage}
        \end{center}
        \vspace{1em}
      \end{minipage}
    \end{lrbox}\fbox{\usebox{\@phExampleBox}}
  \end{center}
}


% Box to fill in letters
\newcommand{\phLetterBox}[2]{
  \begin{tikzpicture}
    \fill[white] (0,-2em) rectangle (2em,2em);
    \draw (0,0) rectangle (2em,2em);
    \node at (1em,-1em) {#1};
    \node at (1em,1em) {#2};
  \end{tikzpicture}
}



% Lorem ipsum generator (useful for mockups)
\RequirePackage{lipsum}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}
\newcommand{\phUrl}[1]{\(\langle\)\url{#1}\(\rangle\)}

% Watermarks
\RequirePackage{draftwatermark}
\SetWatermarkText{}
\SetWatermarkLightness{0.95}
\newcommand{\phMarkDraft}{
  \SetWatermarkText{DRAFT \today}
  \SetWatermarkScale{0.5}
}

% that's all folks
\endinput
