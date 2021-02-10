%
% LaTeX2e Style for MAS R&D and master thesis reports
% Author: Argentina Ortega Sainz, Hochschule Bonn-Rhein-Sieg, Germany
% Please feel free to send issues, suggestions or pull requests to:
% https://github.com/mas-group/project-report
% Based on the template created by Ronni Hartanto in 2003
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mas_report}[2018/01/25 The MAS report class]

\RequirePackage{xcolor}
\RequirePackage{ifthen}
\definecolor{slcolor}{HTML}{882B21}

\newcommand*{\project}[1]{\gdef\@project{#1}%
}
\newcommand*{\@project}{\texttt{project} not set. Please select Master's Thesis or R\&D Project}

% Options
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{thesis}{\project{Master's Thesis}}
\DeclareOption{rnd}{\project{R\&D Project}}

% Report options
\DeclareOption{twosides}{
  \PassOptionsToClass{\CurrentOption}{book}
  \PassOptionsToPackage{left=3cm,right=2cm}{geometry}
}
\DeclareOption{oneside}{
    \PassOptionsToClass{\CurrentOption}{book}
    \PassOptionsToPackage{left=3cm,right=2cm, asymmetric}{geometry}
}
% Execute the default option
\ExecuteOptions{thesis}
\ExecuteOptions{twosides}
% Process other options
\ProcessOptions\relax

% Load class options
\LoadClass[10pt,a4paper]{book}

% \renewcommand{\sfdefault}{phv}
% \renewcommand{\familydefault}{\sfdefault}

%-------------------------------------------------------------------------------
%	VARIOUS REQUIRED PACKAGES AND CONFIGURATIONS
%-------------------------------------------------------------------------------

\usepackage[numbers]{natbib}\citeindextrue % Round brackets around citations, change to square for square brackets
\usepackage{graphicx} % Required to include images
\usepackage{amsmath,amssymb,theorem} % Math packages
\usepackage{listings} % Required for including snippets of code
\usepackage{booktabs} % Required for better horizontal rules in tables
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage[titletoc]{appendix}
\usepackage{setspace}
\usepackage{subfiles}
\usepackage{geometry}
% \usepackage{showframe}
\usepackage{subcaption}	% Required for sub-figures
\usepackage{multirow} % Required to enable merging of columns/rows in a table
\usepackage{rotating} % Required to display sideways tables/figures
\usepackage{hyperref} % Enable hyperlinks
\usepackage{titling}

\usepackage{lipsum} % Used to test
\usepackage{lmodern}%

\onehalfspacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\bibname{References} %Change Bibliography to References

\newcommand{\thirdpartylogo}[1]{\def\@thirdpartylogo{#1}}
\thirdpartylogo{}

\newcommand*{\supervisors}[1]{\gdef\@supervisors{#1}%
}
\newcommand*{\@supervisors}{\texttt{\string\supervisors} currently
not set. Please fix this.}

\newcommand*{\phdsupervisor}[1]{\def\@phdsupervisor{#1}%
}
\phdsupervisor{}

\newcommand*{\thephdsupervisor}{\@phdsupervisor}

\newcommand*{\phdproject}[1]{\def\@phdproject{#1}%
}
\phdproject{}

% PDF Metadata
\newcommand*{\keywords}[1]{\def\@keywords{#1}}
\keywords{}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\subject{}

% Acknowledgements
\newcommand{\phdack}[1]{This project was conducted under the supervision of \thephdsupervisor, in the context of their PhD project with the working title `` \@phdproject".}

% Colors
\definecolor{hbrs}{RGB}{1,106,186}

\definecolor{keywords}{RGB}{0,100,0}
\definecolor{comments}{RGB}{0,100,50}
\definecolor{stringred}{RGB}{160,0,0}
\definecolor{codeblue}{RGB}{0,0,150}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set up hyperlinks and PDF metadata
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
  \hypersetup{%
    colorlinks=true,  % Use colored links instead of boxes
    linkcolor=black,  % Internal link color
    citecolor=black,  % Citations color
    urlcolor=black,  % External url color
    pagebackref=true, % Enable reference links
    pdftitle={\@title},
    pdfsubject={\@subject},
    pdfauthor={\@author},
    pdfkeywords={\@keywords}
  }%
}
\RequirePackage{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\maketitle}{%
\begin{titlepage}
    \newgeometry{left=3cm, bottom=3cm}

    \begin{minipage}{0.475\textwidth}
        \centering
	   \includegraphics[height=1.3cm]{images/Logo-HBRS-cyan.png}
    \end{minipage}
    \begin{minipage}{0.475\textwidth}
        \centering
	   \includegraphics[height=1.3cm]{images/b-it.pdf}
    \end{minipage}
    \centering
    \vfill
    \ifx\@thirdpartylogo\@empty
    \relax
    \else
    \begin{minipage}{0.4\textwidth}
        \centering
	   \includegraphics[height=1.3cm]{\@thirdpartylogo}
    \end{minipage}

    \fi%

\vfill
{\Large\@project\unskip\strut\par}
\vspace{1.5cm}
{\huge\bfseries\@title\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
\vfill

{\normalsize Submitted to Hochschule Bonn-Rhein-Sieg,\\
Department of Computer Science\\
in partial fullfilment of the requirements for the degree\\
of Master of Science in Autonomous Systems}
\vfill

Supervised by\par
\vskip 8pt
{\large
\@supervisors\unskip\strut\par
}
\vfill

{\large \@date\par}
\end{titlepage}
\restoregeometry
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaration of authorship
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{authorship}{\begin{itemize}}{\end{itemize}}

\newcommand{\caitem}[2]{\item \textbf{#1}: #2}

\newcommand*{\jointwork}[1]{\def\@jointwork{#1}%
}
\jointwork{}

\def\statementpage{%
    \thispagestyle{empty}
    \hbox{}
    \vfill
    \noindent
    I, the undersigned below, declare that this work has not previously been
    submitted to this or any other university and that it is, unless otherwise stated, entirely my own work%
    \ifx\@jointwork\@empty
    .
    \else
    , except for the following aspects, which were authored as listed below:
       \@jointwork
    \fi%

    \vskip 60pt

    \hrule width 4cm
    \hfill \hspace{5cm}
    \hrulefill

    \vskip -3pt

    \leftline{\hspace{1.5cm} Date \hfill \@author \hspace{1.5cm}}

    \vskip 60pt
    \clearpage
}%

%%%%%%%%%%%%%%%%%%%%
% Copyright page
%%%%%%%%%%%%%%%%%%%%

\def\copyrightpage#1{%
    \hbox{ }
    \vfill
    \begin{center}
        \copyright\ #1~\@author
        \ifx\@phdsupervisor\@empty
        \else
          , \@phdsupervisor
        \fi%
        .~All Rights Reserved \\ [12pt]
    \end{center}
    \clearpage
}%


%%%%%%%%%%%%%%%%%%%%%
% Abstract
%%%%%%%%%%%%%%%%%%%%%

\newenvironment{abstract}{%
\chapter*{Abstract}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{acknowledgements}{%
\chapter*{Acknowledgements}
% \cleardoublepage\thispagestyle{empty}\null\vfill\begin{center}%
    % \bfseries Acknowledgements\end{center}

}
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIDE MARGINS:
% \oddsidemargin 28pt      %   Left margin on odd-numbered pages.
% \evensidemargin 0pt      %   Left margin on even-numbered pages.
% \marginparwidth 40pt     %   Width of marginal notes.
%
% \marginparsep 12pt          % Horizontal space between outer margin and
%                             % marginal note
% \textwidth 15cm             % width of text
%
% % VERTICAL SPACING:
%                          % Top of page:
% \topmargin  10pt          %    distance from top of page to running head
% \headheight 14pt         %    Height of box containing running head.
% \headsep  1cm            %    Space between running head and text.
% \textheight 8.8in        %    space for text
% \footskip 30pt           %    Distance from baseline of box containing foot
%                          %    to baseline of last line of text.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}

\let\footruleskip\undefined
\usepackage{fancyhdr}% http://ctan.org/pkg/fancyhdr

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\thepage}
    % \fancyfoot[C]{}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0.5pt}
    %% Page numbers on the top left and top right.
    \fancyfoot[C]{\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\nouppercase{\rightmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\nouppercase{\leftmark}}
}


%% Print the current chapter and section at the top of the page in cyan.
\renewcommand*\chaptermark[1]{\markboth{\textcolor{black} {\thechapter.\ } #1}{}}
\renewcommand*\sectionmark[1]{\markright{\textcolor{black}{\thesection.\ } #1}}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}
    [display] % sectioning paragraph shape
    {\flushright}% format to be applied to the title, label, and text
    {\color{gray}\fontsize{68pt}{68pt}\selectfont\bfseries\thechapter}% sectioning label
    {0pt}% horizontal separation between label and title body and it must be a length and not be empty.
    {\Huge\color{black}}% code preceding the title body
    [\vspace{1cm}] % code following the title body (optional)

\titlespacing{\chapter}{0pt}{-50pt}{\baselineskip}

\titleformat{\section}
    [block]
    {\flushleft}%format
    {}%label
    {0pt}%sep
    {\bfseries\large\thesection~}%before code
    % [\vspace{0.5cm}]

\titlespacing{\section}{0pt}{0pt}{5pt}

\titleformat{\subsection}[display]
    {\flushleft}%format
    {}%label
    {0pt}%sep
    {\bfseries\large\thesubsection~}%before code
    % [\vspace{0.5cm}]

\titlespacing{\subsection}{0pt}{0pt}{2pt}

%\renewcommand{\cfttoctitlefont}{\color{hbrs}}
%\renewcommand{\cftlottitlefont}{\flushright\color{hbrs}}
%\renewcommand{\cftloftitlefont}{\flushright\color{hbrs}}




\endinput
