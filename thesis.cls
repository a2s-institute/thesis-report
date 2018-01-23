%% 
%% This is file `thesis.cls', for use at FH-BRS Master Autonomous System.
%% It is based on the standard LaTeX report class.
%% Created October 9, 2003 by Ronny Hartanto,
%% Modified March 10, 2004.
%% 
%% This file is part of the LaTeX2e system. 
%% ---------------------------------------- 
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2003/10/09 'Thesis' template of University of Applied Science Bonn Rhein Sieg - BIT Center]
%  Note that the setspace package is built in (code included near the end of 
%  this file) to provide "line-and-a half spacing" (1.4 by default) and also
%  the singlespace environment. 


% RPI option chap:
\newif\ifchap  % true for chap option
  \chapfalse   % false by default
\DeclareOption{chap}{\chaptrue} % option to print "Chapter" at each new chapter
\newcommand\docsize{}  % to allow 10pt or 11pt to be specified as option
\DeclareOption{10pt}{\renewcommand\docsize{10pt}}
\DeclareOption{11pt}{\renewcommand\docsize{11pt}}
\DeclareOption{12pt}{\renewcommand\docsize{12pt}}
%  Prepare to load the standard report class (12pt):
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{12pt}         % define 12pt as the default doc size
\ProcessOptions
\LoadClass[\docsize]{book}  % load report.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  The following sections are revisions or additions to report.cls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FOOTNOTES:   make them continuously numbered throughout document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define command that can undo having footnotes reset with each chapter:
% (taken from removefr.sty by Donald Arseneau) 
\def\@removefromreset#1#2{\let\@tempb\@elt
   \expandafter\let\expandafter\@tempa\csname c@#1\endcsname
   \def\@elt##1{\expandafter\ifx\csname c@##1\endcsname\@tempa\else
         \noexpand\@elt{##1}\fi}%
   \expandafter\edef\csname cl@#2\endcsname{\csname cl@#2\endcsname}%
   \let\@elt\@tempb}
% use the command \@removefromreset to undo the \@addtoreset in report.cls:
\@removefromreset{footnote}{chapter}
%
% define command to allow people to reset footnote counter at will: 
\def\resetfootnote{\setcounter{footnote}{0}}  % definition to reset footnote


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIDE MARGINS:
\if@twoside                 % Values for two-sided printing:
   \oddsidemargin 28pt      %   Left margin on odd-numbered pages.
   \evensidemargin 0pt      %   Left margin on even-numbered pages.
   \marginparwidth 40pt     %   Width of marginal notes.
\else                       % Values for one-sided printing:
   \oddsidemargin 28pt	    %   Note that \oddsidemargin = \evensidemargin
   \evensidemargin 28pt
   \marginparwidth 40pt
\fi
\marginparsep 12pt          % Horizontal space between outer margin and
                            % marginal note
\textwidth 15cm             % width of text
 
% VERTICAL SPACING:
                         % Top of page:
\topmargin  0pt          %    distance from top of page to running head
\headheight 14pt         %    Height of box containing running head.
\headsep  1cm            %    Space between running head and text.
\textheight 8.8in        %    space for text
\footskip 30pt           %    Distance from baseline of box containing foot
                         %    to baseline of last line of text.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FANCY HEADER:   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
% Chapter page style:
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[R]{\thepage}
%  \fancyfoot[C]{\thepage}
  \renewcommand\headrulewidth{0pt}
  %\renewcommand\footrulewidth{0.4pt}
  \renewcommand\footrulewidth{0pt}
}
\renewcommand{\chaptermark}[1]{%
	\markboth{\chaptername\ \thechapter.\ #1}{}}
% Other page style:
\fancypagestyle{trail}{
	\fancyhf{}
	%\renewcommand\headrulewidth{0.4pt}
	\renewcommand\headrulewidth{0pt}
	\fancyhead[ER]{\footnotesize{\@thetitle} }
%	\fancyfoot[OC,EC]{\thepage}
	\fancyfoot[OR,EL]{\thepage}
	\renewcommand\footrulewidth{0pt}
	\fancyhead[OL]{\footnotesize{\nouppercase{\leftmark} } }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            SECTION HEADINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
\newcommand\chaptersize{\Large}
\newcommand\sectionsize{\large}
\newcommand\subsectionsize{\normalsize}
\newcommand\subsubsectionsize{\normalsize}
\newcounter{firstchapter}
\setcounter{firstchapter}{0}

\setcounter{secnumdepth}{3}    % Number subsubsections in the chapters
\setcounter{tocdepth}{3}       % Put subsubsections in the table of contents

% Print "CHAPTER" if chap option is specified:
\ifchap
  \renewcommand\@chapapp{\chaptername}
\else
  \renewcommand\@chapapp{}
\fi

\def\specialhead#1{%   GENERAL HEADING WITHOUT A NUMBER (for abstract, etc.)
     \chapter*{\flushleft \LARGE #1 \@mkboth{#1}{#1}}
     \hrule 
	   \vskip 25pt
     \addcontentsline{toc}{chapter}{#1}}

\def\@chapter[#1]#2{\ifnum\c@firstchapter=0    % start of rpi added stuff
                      \if@twoside\cleardoublepage\suppressfloats[t]\fi
                      \pagenumbering{arabic} 
                      \setcounter{firstchapter}{1}
                    \fi
                    \renewcommand{\thepage}{\arabic{page}}
                    \thispagestyle{plain}
                    %\pagestyle{myheadings}      % end of rpi added stuff
                    \pagestyle{trail}
                    \ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter.}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}% 
%                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
%                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{0\p@}%
  {\parindent \z@ \raggedright %\centering 
  \normalfont \chaptersize
    \ifnum \c@secnumdepth >\m@ne
      \ifchap
         \bfseries \@chapapp{} \thechapter    % print "Chapter" and number
         \vskip 9pt							% i add this line 
         \par\nobreak						% i add this line
         %\vskip -3pt           %\par\nobreak (original)
       \else
         \bfseries \thechapter. 
       \fi
    \fi
    \LARGE
    \interlinepenalty\@M
    \bfseries #1\par\nobreak
    %\vskip 15\p@
    \vskip 18pt
    \hrule 
		\vskip 25pt
  }}

\def\@makeschapterhead#1{%    heading for chapter* command (no numbering)
  \vspace*{0\p@}%
  {\parindent \z@ \raggedright \centering
    \normalfont  \chaptersize 
    \interlinepenalty\@M
    \bfseries  #1\par\nobreak
    \vskip 15\p@
  }}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {3.5ex \@plus 1ex \@minus .2ex}%
                                   {.5ex \@plus .3ex}%{1.4ex \@plus.2ex}%
                                   {\normalfont\sectionsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {3.25ex\@plus 1ex \@minus .2ex}%
                                     {.3ex \@plus .2ex}%{1.2ex \@plus .2ex}%
                                     {\normalfont\subsectionsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {3.25ex\@plus 1ex \@minus .2ex}%
                                     {.2ex \@plus .1ex}%{1ex \@plus .2ex}%
                                     {\normalfont\subsubsectionsize\bfseries}}
% \paragraph and \subparagraph headings unchanged from report.cls.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  APPENDIX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \chaptrue
  \renewcommand\@chapapp{\appendixname}%
  \renewcommand\thechapter{\@Alph\c@chapter}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FIGURES and TABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%control float placement:
%
\setcounter{topnumber}{2}
\renewcommand\topfraction{.8}
\setcounter{bottomnumber}{2}
\renewcommand\bottomfraction{.8}
\setcounter{totalnumber}{4}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.8}
\renewcommand\dblfloatpagefraction{.8}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\bfseries#1:~~#2}%   Make caption bold
  \ifdim \wd\@tempboxa >\hsize
   {\bfseries #1:~~#2}\par%            Make caption bold
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  TABLE of CONTENTS,  LIST OF TABLES,  LIST OF FIGURES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \pagestyle{trail}
    \chapter*{\flushleft \LARGE \contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \hrule 
		\vskip 25pt
    % I have added here 07.01.2004
    %\addcontentsline{toc}{chapter}{\contentsname}  % add toc to toc
    % end of add 
    \vskip -1em \begin{singlespace}      % singlespacing
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    \end{singlespace}
    }
 
\renewcommand*\l@chapter{\pagebreak[3]\vskip 10pt plus 1pt minus 1pt
                         \@dottedtocline{0}{0em}{1.4em}}
\renewcommand*\l@section{\vskip 6pt plus 1pt minus 1pt
                         \@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*\l@subsection{\ifnum\c@tocdepth>1\vskip 4pt minus 1pt \fi
                         \@dottedtocline{2}{3.8em}{3.2em}}
\renewcommand*\l@subsubsection{\ifnum\c@tocdepth>2 \vskip 3pt minus 1pt \fi
                         \@dottedtocline{3}{7.0em}{4.1em}}

% The following removed because it's not consistent with entries from longtable
%% modify the definition below (taken from latex.ltx) to include 
%% "Table" and "Figure" in entries for lot and lof: 
%\long\def\@caption#1[#2]#3{%\baselineskip 14.5 pt
%  \addcontentsline{\csname ext@#1\endcsname}{#1}%
%  {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
%  \begingroup
%    \@parboxrestore
%    \normalsize
%    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
%  \endgroup}
 
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \pagestyle{trail}
    \chapter*{%\centering 
    	\flushleft \LARGE \listfigurename  % center it
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \hrule 
		\vskip 25pt
    \addcontentsline{toc}{chapter}{\listfigurename}  % add lof to toc
    \vskip -1em \begin{singlespace}  % singlespacing
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \end{singlespace}
    }

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \pagestyle{trail}
    \chapter*{%\centering
      \flushleft \LARGE \listtablename  % center it
      \@mkboth{\MakeUppercase\listtablename}%
              {\MakeUppercase\listtablename}}%
    \hrule 
		\vskip 25pt
    \addcontentsline{toc}{chapter}{\listtablename}  % add lot to toc
    \vskip -1em \begin{singlespace}  % singlespacing
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \end{singlespace}
    }

%remove following at same time as remove code to put "Figure" in LOF
%\renewcommand*\l@figure{\vskip 10pt plus 1pt minus 1pt
%                       \@dottedtocline{1}{0em}{5.8em}}
 
\renewcommand*\l@figure{\vskip 10pt plus 1pt minus 1pt
                       \@dottedtocline{1}{0em}{2.8em}}
\let\l@table\l@figure

\let\rpicaption\caption
\let\lrpicaption\caption


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  BIBLIOGRAPHY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RPI def: for use in making an unnumbered bibliography with hanging indents
\def\bibentry{\vskip10pt\par\noindent\hangindent=40pt\frenchspacing}

% report definition modified for no automatic heading and use ragged right
\newcommand{\bibalign}{\raggedright}

\renewenvironment{thebibliography}[1]
     {\bibalign\frenchspacing
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FOR RPI TITLEPAGE, ABSTR. TITLEPAGE & COPYRIGHT PAGE 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \def\thesistitle#1{\gdef\@thesistitle{#1}}
 \def\thetitle#1{\gdef\@thetitle{#1}}
 \def\author#1{\gdef\@author{#1}}
 \def\degree#1{\gdef\@degree{#1}}
 \def\department#1{\gdef\@department{#1}}
 \newcount\numcomm \numcomm=1
 \def\signaturelines#1{\numcomm=#1}
 \def\thadviser#1{\gdef\@thadviser{#1}} 
 \def\projadviser#1{\gdef\@projadviser{#1}} \projadviser{*}
 \def\cothadviser#1{\gdef\@cothadviser{#1}} \cothadviser{*} 
 \def\coprojadviser#1{\gdef\@coprojadviser{#1}} \coprojadviser{*}
 \def\exthadviser#1{\gdef\@exthadviser{#1}} \exthadviser{*} 
 \def\doctype{\if \@projadviser *Thesis \else Project \fi}
 \def\adviser{\if \@projadviser *\@thadviser \else \@projadviser\fi}
 \def\coadviser{\if \@coprojadviser *\@cothadviser\else \@coprojadviser\fi}
 \def\exadviser{\if \@coprojadviser *\@exthadviser\else \@coprojadviser\fi}
 \def\memberone#1{\gdef\@memberone{#1}}
 \def\membertwo#1{\gdef\@membertwo{#1}}
 \def\memberthree#1{\gdef\@memberthree{#1}}
 \def\memberfour#1{\gdef\@memberfour{#1}}
 \def\memberfive#1{\gdef\@memberfive{#1}}
 \def\membersix#1{\gdef\@membersix{#1}}
 \def\copyrightyear#1{\gdef\@copyrightyear{#1}} \copyrightyear{\the\year}
 \def\submitdate#1{\gdef\@submitdate{#1}}

\newcount\numcount
\def\sigblock{
   \ifnum\numcomm < 3  % master's thesis or project
     \vskip .8in plus 24pt minus 24pt
     \if \coadviser *  % no coadviser
       %\leftline{Approved: \hfil}\vskip 48pt
       %\hrule width2.8in\hfil \vskip -3pt
       \leftline{Referee and Tutor: \adviser \hfil}
       %\leftline{\doctype Adviser \hfil}
       \vskip 6pt 
     \else
       %\leftline{Approved: \hfil}\vskip 48pt
       %\hrule width2.8in\hfil \vskip -3pt
       {\Large
       \leftline{Referee and Tutor: \hspace{2pt} \adviser\hfil}%, \doctype Adviser\hfil}
%      \leftline{\adviser, Co-\doctype Adviser\hfil}   % this puts in "Co"
       %\vskip 36pt  \hrule width 2.8in\hfil \vskip -3pt
       \leftline{Referee: \hspace{69pt} \coadviser\hfil}%, \doctype Adviser\hfil}
%      \leftline{\coadviser, Co-\doctype Adviser\hfil} % this puts in "Co"
			 \leftline{external Referee: \hspace{15pt} \exadviser\hfil}} 
       %\vskip 6pt       
     \fi
   \else  % PhD thesis
      \numcount=\numcomm
      \leftline{Approved by the\hfil}
      \leftline{Examining Committee:\hfil}
      \vskip 28pt \vfil 
      \hrule width 2.8in \hfil \vskip -3pt
      \leftline{\adviser, \doctype Adviser\hfil} 
%     \leftline{\adviser, Co-\doctype Adviser\hfil} % put "Co-" in the line
      \advance \numcount by -1
      \if \coadviser * \else % there's a co-adviser
        \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
        \leftline{\coadviser, \doctype Adviser\hfil}
%       \leftline{\coadviser, Co-\doctype Adviser\hfil} % put "Co-" in the line
        \advance \numcount by -1
      \fi
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@memberone, Member\hfil}
      \advance \numcount by -1
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@membertwo, Member\hfil}
      \advance \numcount by -1 \ifnum\numcount > 0
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@memberthree, Member\hfil}  \fi
      \advance \numcount by -1 \ifnum\numcount > 0
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@memberfour, Member\hfil}   \fi
      \advance \numcount by -1 \ifnum\numcount > 0
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@memberfive, Member\hfil}  \fi
      \advance \numcount by -1 \ifnum\numcount > 0
      \vskip 19pt\vfil\hrule width 2.8in\hfil\vskip -3pt
      \leftline{\@membersix, Member\hfil} \fi
      \fi} 

 \def\sigblockabs{%
    \numcount=\numcomm
    \leftline{Examining Committee: \hfil}
    \begin{quote}   
      \adviser, \doctype Adviser\\[4pt]  \advance \numcount by -1
%     \adviser, Co-\doctype Adviser\hfil\\[4pt]  \advance \numcount by -1
      \if \coadviser * \else 
        \coadviser, \doctype Adviser\\[4pt]    \advance\numcount by -1
%       \coadviser, Co-\doctype Adviser\\[4pt] \advance\numcount by -1
      \fi
      \@memberone, Member\\[4pt] \advance \numcount by -1
      \ifnum\numcount > 0
      \@membertwo, Member\\[4pt] \advance \numcount by -1 \fi
      \ifnum\numcount > 0
      \@memberthree, Member\\[4pt] \advance \numcount by -1 \fi
      \ifnum\numcount > 0
      \@memberfour, Member\\[4pt] \advance \numcount by -1  \fi
      \ifnum\numcount > 0
      \@memberfive, Member\\[4pt]\advance \numcount by -1  \fi
      \ifnum\numcount > 0
      \@membersix, Member\\[4pt] \advance \numcount by -1\fi
    \end{quote}
 }

 \def\titlepage{%
 		 \setcounter{page}{-9}
     \thispagestyle{empty}
     \vskip -3.5cm
		 \leftline{\includegraphics[width=9.5cm]{pictures/FH-Header}\hfil}
     \ifnum\numcomm<3 \vglue .5in\vfil \fi  % masters
     \ifnum\numcomm>5 \hbox{ } \vspace{-24pt}\fi % make more space on page
     \begin{singlespace}
     \begin{center}
     		 \vskip 1cm
     		 {\huge\expandafter{\textbf{Master Thesis}}}\\ 
     		 \vskip 1.5cm
         \parindent=5pt
         {\LARGE\uppercase\expandafter{\textbf{\@thesistitle}}}\\ [12pt]
%         By \\ [12pt]
			   \vskip 0.75cm
         {\Large\textbf{\@author}}\\ [12pt]
         \vskip 6pt
         {\Large\textbf{
				 A thesis submitted to the\\
				 University of Applied Sciences Bonn-Rhein-Sieg\\
				 for the degree of\\
				 Master of Science in Autonomous Systems}}\\
%         A \doctype Submitted to the Graduate\\ [8pt]
%         Faculty of Informatic \\ [8pt]
%         in Partial Fulfillment of the\\ [8pt]
%         Requirements for the Degree of\\ [8pt]
%         A \doctype Submitted to the Graduate\\ [8pt]
%         Faculty of Rensselaer Polytechnic Institute\\ [8pt]
%         in Partial Fulfillment of the\\ [8pt]
%         Requirements for the Degree of\\ [8pt]
%         \uppercase\expandafter{\@degree}\\ [8pt]
         \ifnum \numcomm > 2 Major Subject:~~\@department\\  \fi
         \ifnum\numcomm < 7 \vskip 32pt \else \vskip 24pt \fi
         %\vskip 3cm
         \sigblock 
         \ifnum \numcomm < 7 \vskip 32pt \else \vskip 24pt \fi
%         University of Applied Science Bonn Rhein Sieg\\
%         St.Augustin, Germany\\ [14pt]
%         Rensselaer Polytechnic Institute\\
%         Troy, New York\\ [14pt]
         %\ifnum\numcomm>6 \vskip -8pt \fi
     \end{center}
     \leftline {\Large Submitted: \hspace{56pt}\@submitdate}
     \ifnum\numcomm>6 \vskip -8pt \fi
     \end{singlespace}
     \newpage
     \pagestyle{plain}
     \pagenumbering{roman}
     \setcounter{page}{2}}
 
 \def\abstitlepage{%
     \if@twoside\thispagestyle{empty}\cleardoublepage\fi
     \thispagestyle{empty}
     \begin{singlespace}
     \begin{center}
         \parindent=0pt
         \vglue 24pt plus 24pt minus 12pt
         {\large\uppercase\expandafter{\@thesistitle}}\\ [11pt]
         By \\ [11pt]
         \@author\\ [11pt]
         An Abstract of a Thesis Submitted to the Graduate\\ [7pt]
         Faculty of Applied Informatics\\ [7pt]
         in Partial Fulfillment of the\\ [7pt]
         Requirements for the Degree of\\ [7pt]
         \uppercase\expandafter{\@degree}\\ [7pt]
         Major Subject:~~\@department\\  [7pt]
         The original of the complete thesis is on file\\
         in the University of Applied Science Bonn Rhein Sieg Library\\
%       \vskip 36pt plus 2pt minus 12pt

%         An Abstract of a Thesis Submitted to the Graduate\\ [7pt]
%         Faculty of Rensselaer Polytechnic Institute\\ [7pt]
%         in Partial Fulfillment of the\\ [7pt]
%         Requirements for the Degree of\\ [7pt]
%         \uppercase\expandafter{\@degree}\\ [7pt]
%         Major Subject:~~\@department\\  [7pt]
%         The original of the complete thesis is on file\\
%         in the Rensselaer Polytechnic Institute Library\\

       \vfill
       \sigblockabs 
       \vskip 36pt plus 2pt minus 12pt 
        University of Applied Science Bonn Rhein Sieg\\
        St. Augustin, Bonn\\ [12pt]
%        Rensselaer Polytechnic Institute\\
%        Troy, New York\\ [12pt]
         \@submitdate
     \end{center}
     \end{singlespace}
     \newpage
     \pagestyle{plain}
     \pagenumbering{roman}
     \setcounter{page}{2}}

\def\emptypage{
    \thispagestyle{empty}
    \hbox{ }
    \vfill
    %\begin{center}
    %\copyright\ Copyright \@copyrightyear \\
    %by \\
    %\@author \\
    %All Rights Reserved \\ [12pt]
    %\end{center}
    \clearpage}

\def\statementpage{
		\thispagestyle{empty}
 		\hbox{}
 		\vfill
 		\noindent
I, the undersigned below, declare that this work has not previously been submitted to this or any other university, and that unless otherwise stated, it is entirely my own work.
		\vskip 60pt
		
		\hrule width 2.5cm
		\hfill \hspace{5cm}
		\hrulefill
		\vskip -6pt
    \leftline{\hspace{0.5cm} DATE \hfill \@author \hspace{0.8cm}}   
       
		\vskip 60pt
		\clearpage}

\def\copyrightpage{
    \hbox{ }
    \vfill
    \begin{center}
    \copyright\ Copyright \@copyrightyear \\
    by \\
    \@author \\
    All Rights Reserved \\ [12pt]
    \end{center}
    \clearpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The CODE FROM SETSPACE.STY:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\setspace@size{%
  \ifx \@currsize \normalsize
    \@normalsize
  \else
    \@currsize
  \fi
}

\def\doublespacing{%
  \ifcase \@ptsize \relax % 10pt
    \def \baselinestretch {1.667}%
  \or % 11pt
    \def \baselinestretch {1.618}%
  \or % 12pt
    \def \baselinestretch {1.655}%
  \fi
  \setspace@size
}

\def\onehalfspacing{%
  \ifcase \@ptsize \relax % 10pt
    \def \baselinestretch {1.25}%
  \or % 11pt
    \def \baselinestretch {1.213}%
  \or % 12pt
    \def \baselinestretch {1.241}%
  \fi
  \setspace@size
}

\def\singlespacing{%
  \def \baselinestretch {1}%
  \setspace@size
  \vskip \baselineskip  % Correction for coming into singlespace
}

\def\setstretch#1{%
  \renewcommand{\baselinestretch}{#1}}

%---Stretch the baseline BEFORE calculating the strut size. This improves
%   spacing below tabular environments etc., probably...
%   Comments are welcomed.

\def\@setsize#1#2#3#4{%
  % Modified 1993.04.07--GDG per KPC
  \@nomath#1%
  \let\@currsize#1%
  \baselineskip #2%
  \baselineskip \baselinestretch\baselineskip
  \parskip \baselinestretch\parskip
  \setbox\strutbox \hbox{%
    \vrule height.7\baselineskip depth.3\baselineskip width\z@}%
  \skip\footins \baselinestretch\skip\footins
  \normalbaselineskip\baselineskip#3#4}

%---Increase the space between last line of text and footnote rule.
%\skip\footins 20pt plus4pt minus4pt

%---Reset baselinestretch within floats and footnotes.

% GT:  This is where the conflict with the combination of the color
% package and the figure environment used to occur.

\let\latex@xfloat=\@xfloat
\def\@xfloat #1[#2]{%
  \latex@xfloat #1[#2]%
  \def \baselinestretch {1}\@normalsize  %%  GT: need \@normalsize?
  \normalsize
}

\long\def\@footnotetext#1{%
  \insert\footins{%
    \def\baselinestretch {1}%
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \color@begingroup
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}

\long\def\@mpfootnotetext#1{%
  \global\setbox\@mpfootins\vbox{%
    \unvbox \@mpfootins
    \def\baselinestretch {1}%
    \reset@font\footnotesize
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@mpfootnote\endcsname\@thefnmark}%
    \color@begingroup
      \@makefntext{%
       \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
   \color@endgroup}}

% A single spaced quote (say) is done by surrounding singlespace with quote.
%
\def\singlespace{%
  \vskip \baselineskip
  \def\baselinestretch {1}%
  \setspace@size
  \vskip -\baselineskip
}

\def\endsinglespace{\par}

%  spacing, doublespace and onehalfspace all are meant to INCREASE the
%  spacing (i.e. calling onehalfspace from within doublespace will not
%  produce a graceful transition between spacings)
%
% Next two definitions fixed for consistency with TeX 3.x

\def\spacing#1{%
  \par
  \begingroup             % moved from \endspacing by PGBR 29-1-91
    \def\baselinestretch {#1}%
    \setspace@size
}

\def\endspacing{%
    \par
    \vskip \parskip
    \vskip \baselineskip
  \endgroup
  \vskip -\parskip
  \vskip -\baselineskip
}

% one and a half spacing is 1.5 x pt size
\def\onehalfspace{%
  \ifcase \@ptsize \relax  % 10pt
    \spacing{1.25}%
  \or % 11pt
    \spacing{1.213}%
  \or % 12pt
    \spacing{1.241}%
  \fi
}

\let\endonehalfspace=\endspacing

% double spacing is 2 x pt size
\def\doublespace{%
  \ifcase \@ptsize \relax % 10pt
    \spacing{1.667}%
  \or % 11pt
    \spacing{1.618}%
  \or % 12pt
    \spacing{1.655}%
  \fi
}

\let\enddoublespace=\endspacing

% GT:  EMSH chose to omit display math part that follows.
% She wrote (see above) that the "altered spacing before and after displayed
% equations ... just looked too much".
%
% Fix up spacing before and after displayed math
% (arraystretch seems to do a fine job for inside LaTeX displayed math,
% since array and eqnarray seem to be affected as expected).
% Changing \baselinestretch and doing a font change also works if done here,
% but then you have to change @setsize to remove the call to @nomath)
%
\everydisplay\expandafter{%
  \the\everydisplay
  \abovedisplayskip \baselinestretch\abovedisplayskip
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \baselinestretch\abovedisplayshortskip
  \belowdisplayshortskip \baselinestretch\belowdisplayshortskip
}
%%%%%%%%%%%%%%%%%%%%%%  End of setspace.sty %%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOME INITIALIZATIONS:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% make the following names uppercase:
%\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\listfigurename{LIST OF FIGURES}
\renewcommand\listtablename{LIST OF TABLES}
\renewcommand\bibname{BIBLIOGRAPHY}
%\renewcommand\indexname{INDEX}
%\renewcommand\partname{PART}
%\renewcommand\chaptername{CHAPTER}
%\renewcommand\appendixname{APPENDIX}
%\renewcommand\abstractname{ABSTRACT}

\renewcommand\contentsname{CONTENTS}
\newcommand\abstractname{ABSTRACT}
\renewcommand\chaptersize{\Large}
\renewcommand\sectionsize{\large}
\renewcommand\subsectionsize{\normalsize}
\renewcommand\subsubsectionsize{\normalsize}

\raggedbottom

\setstretch{1.4}        % at 11 or 12pt this is line-and-a-half spacing
\parindent .4in         % Width of paragraph indentation

\markboth{}{}           % Do not include chapter titles in headers;
%\page{myheadings}  % include just page numbers in upper right
\pagestyle{trail}

%\renewcommand{\bibalign}{\raggedright}  %  bibliography is ragged right
% for fully justified bibliography: \renewcommand{\bibalign}{}
\renewcommand{\bibalign}{}

\endinput
%% 
%% End of file `thesis.cls'.
