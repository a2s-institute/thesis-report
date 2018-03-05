%
% LaTeX2e Style for MAS R&D and master thesis reports
% Author: Argentina Ortega Sainz, Hochschule Bonn-Rhein-Sieg, Germany
% Please feel free to send issues, suggestions or pull requests to:
% Based on the template created by Ronni Hartanto in 2003
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mas_report}[2018/01/25 The MAS report class]

\newcommand{\reporttype}[1]{#1}
\RequirePackage{xcolor}
\RequirePackage{ifthen}
\definecolor{slcolor}{HTML}{882B21}


% Options
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{thesis}{}
\DeclareOption{rnd}{}

% Report options
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Execute the default option
\ExecuteOptions{thesis}

% Process other options
\ProcessOptions\relax

% Load class options
\LoadClass[10pt,a4paper,twosides]{book}

\renewcommand{\sfdefault}{phv}
\renewcommand{\familydefault}{\sfdefault}
\usepackage[numbers]{natbib}\citeindextrue % Round brackets around citations, change to square for square brackets
\usepackage{graphicx} % Required to include images
\usepackage{amsmath,amssymb,theorem} % Math packages
\usepackage{listings} % Required for including snippets of code
\usepackage{booktabs} % Required for better horizontal rules in tables
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage[titletoc]{appendix}

\usepackage{lipsum} % Used to test


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\bibname{References} %Change Bibliography to References

\newcommand*{\project}[1]{\gdef\@project{#1}%
}
\newcommand*{\@project}{Please select Master Thesis or R\&D Project}

\newcommand*{\supervisors}[1]{\gdef\@supervisors{#1}%
}
\newcommand*{\@supervisors}{\texttt{\string\supervisors} currently
not set. Please fix this.}

% Colors
\definecolor{hbrs}{RGB}{11,161,226}

\definecolor{keywords}{RGB}{0,100,0}
\definecolor{comments}{RGB}{0,100,50}
\definecolor{stringred}{RGB}{160,0,0}
\definecolor{codeblue}{RGB}{0,0,150}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\maketitle}{%
\begin{titlepage}
{\raggedleft%
    \centering
	\includegraphics[width=8cm]{images/Logo-HBRS-cyan.png}\par
}\vspace{1cm}
	\centering
{\Large\@project\unskip\strut\par}
\vspace{1.5cm}
{\huge\bfseries\@title\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
\vfill

{\normalsize Submitted to the Hochschule Bonn-Rhein-Sieg,\\
Department of Computer Science\\
in partial fullfilment of the requirements for the degree\\
of Master of Science in Autonomous Systems.}
\vfill

Supervised by\par
\vskip 8pt
{\large
\@supervisors\unskip\strut\par
}% \ifcsname @supervisors\endcsname
% \\ \@supervisors \fi \\
% \vfill

\vfill

{\large \@date\par}
\end{titlepage}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaration of authorship
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\statementpage{%
    \thispagestyle{empty}
    \hbox{}
    \vfill
    \noindent
    I, the undersigned below, declare that this work has not previously been
    submitted to this or any other university, and that unless otherwise stated,
    it is entirely my own work.
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
% Copyright
%%%%%%%%%%%%%%%%%%%%

\def\copyrightpage{%
    \hbox{ }
    \vfill
    \begin{center}
        \copyright\ Copyright \@copyrightyear \\
        by \\
        \@author \\
        All Rights Reserved \\ [12pt]
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
\oddsidemargin 28pt      %   Left margin on odd-numbered pages.
\evensidemargin 0pt      %   Left margin on even-numbered pages.
\marginparwidth 40pt     %   Width of marginal notes.

\marginparsep 12pt          % Horizontal space between outer margin and
                            % marginal note
\textwidth 15cm             % width of text

% VERTICAL SPACING:
                         % Top of page:
\topmargin  10pt          %    distance from top of page to running head
\headheight 14pt         %    Height of box containing running head.
\headsep  1cm            %    Space between running head and text.
\textheight 8.8in        %    space for text
\footskip 30pt           %    Distance from baseline of box containing foot
                         %    to baseline of last line of text.


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
    % \fancyfoot[C]{\thepage}
    \fancyfoot[C]{}
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
\renewcommand*\chaptermark[1]{\markboth{\textcolor{hbrs} {\thechapter.\ } #1}{}}
\renewcommand*\sectionmark[1]{\markright{\textcolor{hbrs}{\thesection.\ } #1}}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright}%format
    {\color{gray}\fontsize{68pt}{68pt}\selectfont\bfseries\thechapter}%label
    {0pt}%sep
    {\Huge\color{hbrs}}%before code
    [\vspace{2cm}]

\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}


\endinput
