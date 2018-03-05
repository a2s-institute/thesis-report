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

% \renewcommand{\familydefault}{\sfdefault}

% Packages
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{graphicx}


\usepackage{lipsum} % Used to test
% Definitions

\newcommand*{\project}[1]{\gdef\@project{#1}%
}
\newcommand*{\@project}{Final Year Project}

\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}%
}
\newcommand*{\@supervisor}{\texttt{\string\supervisor} currently
not set. Please fix this.}

% \addtoiargdef{\supervisor}{%
% %   \begingroup\let\footnote\@gobble}{%
% %   \begingroup
% %     \renewcommand{\thanks}[1]{}
% %     \renewcommand{\and}{\unskip, }
% %     \renewcommand{\andnext}{\unskip, }
% %     \renewcommand{\thanksmark}[1]{}
% %     \renewcommand{\thanksgap}[1]{}
% %     \protected@xdef\thesupervisor{#1}
% %   \endgroup\endgroup}
% % \newcommand{\presupervisor}[1]{\def\@bspresupervisor{#1}}
% % \newcommand{\postsupervisor}[1]{\def\@bspostsupervisor{#1}}
% % \renewcommand{\maketitlehookc}{%
% %   {\@bspresupervisor \@director \@bspostsupervisor}%
% }

% \presupervisor{\begin{center}
%   \large \lineskip .5em%
%   \begin{tabular}[t]{c}}
% \postsupervisor{\end{tabular}\par\end{center}}

% Colors
\definecolor{hbrsblue}{RGB}{11,161,226}

\definecolor{keywords}{RGB}{0,100,0}
\definecolor{comments}{RGB}{0,100,50}
\definecolor{stringred}{RGB}{160,0,0}
\definecolor{codeblue}{RGB}{0,0,150}


% Title page
\renewcommand*{\maketitle}{%
\begin{titlepage}
{\raggedleft%
    \centering
	\includegraphics[width=8cm]{images/Logo-HBRS-cyan.png}\par
}\vspace{1cm}
	\centering
% {\scshape\LARGE Columbidae University \par}
% \vspace{1cm}
{\scshape\Large\@project\unskip\strut\par}
\vspace{1.5cm}
{\huge\bfseries\@title\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
\vfill

Supervised by\par
\vskip 8pt
\@supervisor\unskip\strut\par
% \ifcsname @supervisor\endcsname
% \\ \@supervisor \fi \\
% \vfill

\vfill
{\large Submitted to the Department of Computer Science\\
in partial fullfilment of the requirements for the degree\\
of Master of Science in Autonomous Systems.}
\vskip 20pt

{\large \@date\par}
\end{titlepage}
}


%%%%%%%%%%%%%%%%%%%%%
% Abstract
%%%%%%%%%%%%%%%%%%%%%

\newenvironment{abstract}{%
\chapter*{Abstract}
}

\endinput
