\ProvidesClass{nsm-thesis}[2025/09/24 The NSM Thesis Class]  % YYYY/MM/DD

% -----------------------------------------------------------------------------
% Class options
% -----------------------------------------------------------------------------
\RequirePackage{ifthen}

% [germanthesis] - Thesis is written in German
\newboolean{germanthesis}
\setboolean{germanthesis}{false}
\DeclareOption{germanthesis}{\setboolean{germanthesis}{true}}

% [plainunnumbered] - Don't print numbers on plain pages
\newboolean{plainunnumbered}
\setboolean{plainunnumbered}{false}
\DeclareOption{plainunnumbered}{\setboolean{plainunnumbered}{true}}

% [earlydraft] - Settings for quick draft printouts
\newboolean{earlydraft}
\setboolean{earlydraft}{false}
\DeclareOption{earlydraft}{\setboolean{earlydraft}{true}}

% [watermark] - Print current time/date at bottom of each page
\newboolean{watermark}
\setboolean{watermark}{false}
\DeclareOption{watermark}{\setboolean{watermark}{true}}

% [phdthesis] - switch to PhD thesis style
\newboolean{phdthesis}
\setboolean{phdthesis}{false}
\DeclareOption{phdthesis}{\setboolean{phdthesis}{true}}

% [twoside] - double sided
\newboolean{oneside}
\setboolean{oneside}{true}
\DeclareOption{twoside}{\setboolean{oneside}{false}}

% [cutmargins] - text body fills complete page
\newboolean{cutmargins}
\setboolean{cutmargins}{false}
\DeclareOption{cutmargins}{\setboolean{cutmargins}{true}}

\ProcessOptions \relax
% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% Basics
% -----------------------------------------------------------------------------
% This class is based on report
\ifthenelse{\boolean{oneside}}{
\LoadClass[a4paper,10pt,onecolumn,oneside,openright]{scrreprt}
}{
\LoadClass[a4paper,10pt,onecolumn,twoside,openright]{scrreprt}
}
\ifthenelse{\boolean{cutmargins}}{
\RequirePackage[paperwidth=365pt,paperheight=618pt,textwidth=345pt,textheight=598pt,bindingoffset=0cm,marginparwidth=3.75cm,hmarginratio=1:1,vmarginratio=1:1]{geometry}
}{
\RequirePackage[a4paper,textwidth=345pt,textheight=598pt,bindingoffset=0cm,marginparwidth=3.75cm,hmarginratio=1:1,vmarginratio=1:1]{geometry}
}

% 150 percent line spacing
\RequirePackage{setspace}
\onehalfspacing

% Allow more (and larger) floats on text pages
\renewcommand{\topfraction}{0.9}  % use up to ..% of space on top
\renewcommand{\bottomfraction}{0.8}  % use up to ..% of space on bottom
\setcounter{topnumber}{4} % place up to .. on top
\setcounter{bottomnumber}{4} % place up to .. on bottom
\setcounter{totalnumber}{4} % place up to .. total
\renewcommand{\textfraction}{0.07} % allow down to ..% of text
\renewcommand{\floatpagefraction}{0.7} % fill at least ..% of float pages (must be less than \topfraction)

% Avoid widows and orphans (single line on bottom or top of page, respectively) at almost any cost
\clubpenalty = 10000
\widowpenalty = 10000
%\raggedbottom

% More encoding and typesetting fixes and tweaks
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\ifthenelse{\boolean{earlydraft}}{
}{
    \RequirePackage[babel]{microtype}
}
\RequirePackage{hyphenat}

% Default fonts
\newcommand{\mypageheadfont}{\normalfont}
\newcommand{\myheadingfont}{\normalfont}
%\RequirePackage[osf]{libertine}  % Linux Libertine
%\renewcommand{\mypageheadfont}{\normalfont\libertine}
%\renewcommand{\myheadingfont}{\normalfont\libertine}
\RequirePackage{amsmath}
% \RequirePackage{amsthm}
% \RequirePackage{amsfonts}
% \RequirePackage{txfonts}  % Math: URW Nimbus Roman
% \RequirePackage{nimbusmononarrow}  % TT: URW Nimbus Mono Narrow
\RequirePackage{opensans}  % SF (alternative): Open Sans
% \RequirePackage{helvet}  % SF (default): Helvetica
% \RequirePackage[scaled=.96]{XCharter}  % RM: Bitstream Charter

% Graphics insertion and filetypes' order of precedence
% \RequirePackage[pdftex]{graphicx}
% \pdfminorversion=7
% \DeclareGraphicsRule{.out.png}{png}{.out.png}{}
% \ifthenelse{\boolean{earlydraft}}{
%     \DeclareGraphicsExtensions{.thumb.jpg,.out.png,.pdf,.png,.jpg}
%     \DeclareGraphicsRule{.thumb.jpg}{jpg}{.thumb.jpg}{}
% }{
%     \DeclareGraphicsExtensions{.out.png,.pdf,.png,.jpg}
% }

% Typesetting URLs
\RequirePackage[lowtilde,hyphens]{url}
\urlstyle{tt}
\g@addto@macro\UrlSpecials{%
    % re-define character '!' to insert a hard line break
    \do\!{\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\searrow}}\newline}%
}

% For hyperref<->algorithm interaction
% \RequirePackage{float}

% Cross-references are clickable
% \PassOptionsToPackage{pdftex,bookmarks=true,bookmarksnumbered=true,colorlinks=false,pdfdisplaydoctitle=true,breaklinks=true}{hyperref}
\PassOptionsToPackage{unicode}{hyperref} % needs to be loaded before `cleveref`
\RequirePackage{hyperref}

% Captions
% \RequirePackage[font=small, labelfont=bf, labelsep=endash, margin=1cm]{caption}

% Subfigures
% \RequirePackage[margin=0cm]{subfig}

% Citations
% \RequirePackage{csquotes}
% \RequirePackage[style=ieee,doi=true,isbn=false,url=false,mincitenames=1,maxcitenames=3,minbibnames=10,maxbibnames=10]{biblatex}
% \DeclareFieldFormat{title}{#1} % never apply title casing, even if bibtex field is unprotected
% \DeclareFieldFormat{sentencecase}{#1} % never apply sentence casing, even if bibtex field is unprotected
% \RequirePackage{xpatch}
% \xpatchbibmacro{textcite}{\addspace}{\addnbspace}{}{}
% \xpatchbibmacro{Textcite}{\addspace}{\addnbspace}{}{}
% \DefineBibliographyStrings{english}{
%     andothers = et~al\adddot\addspace
% }
% \defbibheading{bibliography}[\bibname]{%
%     \chapter*{#1}%
%     \addcontentsline{toc}{chapter}{#1}%
%     \chaptermark{#1}%
% }
% \bibliography{references}

% The "SI" and "num" commands for typesetting units
% \RequirePackage[range-phrase={\dots\,},per-mode=symbol,detect-all,forbid-literal-units]{siunitx}
% \@ifpackagelater{siunitx}{2021-05-17}{
%     % reinstate column type "s" (unit-only)
%     \usepackage{collcell}
%     \newcolumntype{s}{>{\collectcell\unit}c<{\endcollectcell}}
% }{
% }

\ifthenelse{\boolean{germanthesis}}{
    \sisetup{locale=DE}
}{
}
% \AtBeginDocument{
% \DeclareSIUnit\bit{bit}
% \DeclareSIUnit\byte{Byte}
% \DeclareSIUnit\decibelm{dBm}
% \DeclareSIUnit\mph{mph}
% }

% Commands for beautiful tables
\RequirePackage{booktabs}

% Equation typesetting fixes and tweaks + proof/theorem environment
\newtheorem{thm}{Theorem}[section]

% Allow list iteration over comma separated parameters
\RequirePackage{pgf}
\RequirePackage{pgffor}

% -----------------------------------------------------------------------------


% -----------------------------------------------------------------------------
% Internationalization support
% -----------------------------------------------------------------------------

% Multi-language support using Babel
\ifthenelse{\boolean{germanthesis}}{
    \RequirePackage[shorthands=off,american,ngerman]{babel}
}{
    \RequirePackage[shorthands=off,ngerman,american]{babel}
}

% Fix for pdfx 2019/02/27 and older (which tries to load xmpincl in a group, which is now forbidden)
% \@ifpackagelater{pdfx}{2019/02/28}{
% }{
%     % load xmpincl manually
%     \RequirePackage{xmpincl}
%     % redefine \RequirePackage to not load xmpincl
%     \let\mypdfx@RequirePackage\RequirePackage
%     \renewcommand{\RequirePackage}[2][]{%
%         \ifthenelse{\equal{#2}{xmpincl}}{}{\mypdfx@RequirePackage[#1]{#2}}%
%     }
% }
\usepackage{colorprofiles}
% \usepackage[a-2b,mathxmp]{pdfx}[2018/12/22]

% % Don't indent paragraphs in german theses. Instead, leave blank space between paragraphs.
% \ifthenelse{\boolean{germanthesis}}{
%     \RequirePackage{parskip}
% }{
% }

% Time and date functions
\RequirePackage{datetime}
\newdateformat{germandateformat}{%
    \THEDAY{}. \monthnamengerman[\THEMONTH]{} \THEYEAR{}%
}
\newdateformat{americandateformat}{%
    \THEDAY{} \monthnameamerican[\THEMONTH]{} \THEYEAR{}%
}

% Clever References
\ifthenelse{\boolean{germanthesis}}{
    \RequirePackage[ngerman]{cleveref}[2009/17/04]term
    \def\cref{\Cref}
    \def\crefrange{\Crefrange}
    \crefname{lstlisting}{Listing}{Listings}
    \Crefname{lstlisting}{Listing}{Listings}
    \crefname{listing}{Listing}{Listings}
    \Crefname{listing}{Listing}{Listings}
    \crefname{algorithm}{Algorithmus}{Algorithmen}
    \Crefname{algorithm}{Algorithmus}{Algorithmen}
    \crefname{section}{Kapitel}{Kapitel}
    \Crefname{section}{Kapitel}{Kapitel}
}{
    \RequirePackage{cleveref}[2009/17/04]
    \def\cref{\Cref}
    \def\crefrange{\Crefrange}
    \crefname{lstlisting}{listing}{listings}
    \Crefname{lstlisting}{Listing}{Listings}
    \crefname{listing}{listing}{listings}
    \Crefname{listing}{Listing}{Listings}
    \crefname{algorithm}{algorithm}{algorithms}
    \Crefname{algorithm}{Algorithm}{Algorithms}
    \crefname{section}{Chapter}{Chapter}
    \Crefname{section}{Chapter}{Chapter}
}

% Some more language-dependent commands
\ifthenelse{\boolean{germanthesis}}{
    \newcommand{\glossarytitlename}{Abkürzungsverzeichnis}
}{
    \newcommand{\glossarytitlename}{List of Abbreviations}
}

% Language-independent timestamp
\newcommand{\timestamp}{\renewcommand{\dateseparator}{-}\yyyymmdddate\today\quad\settimeformat{hhmmsstime}\currenttime}

% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% All the simple stuff goes here
% -----------------------------------------------------------------------------

% Show overfull boxes
\overfullrule 5pt

% The Enumerate package
\RequirePackage{enumitem}

% The Acronym package
\RequirePackage{acro}

% \@ifpackagelater{acro}{2020/04/29}{
% \NewDocumentCommand\acrodef{mO{#1}mG{}}{\DeclareAcronym{#1}{short={#2}, long={#3}, #4}} % error: G is not valid
% % Set up Acronyms for Enumerate
% \newlist{acronyms}{description}{1}
% \setlist[acronyms]{
%     labelwidth=7em,
%     leftmargin=7.5em,
%     noitemsep,
%     itemindent=0pt,
% }
% \NewAcroTemplate[list]{acronyms}{%
%   \acroheading
%   \acropreamble
%   \begin{acronyms}
%     \acronymsmapF{%
%       \item[\acrowrite{short}\acroifT{alt}{/\acrowrite{alt}}]
%         \acrowrite{list}%
%         \acroifT{foreign}{ (\acrowrite{foreign})}%
%         \acroifT{extra}{, \acrowrite{extra}}%
%         \acropagefill
%         \acropages
%           {\acrotranslate{page}\nobreakspace}
%           {\acrotranslate{pages}\nobreakspace}%
%       }
%       {\item\AcroRerun}
%   \end{acronyms}
% }
% \acsetup{list/heading={chapter*},list/name={\glossarytitlename},list/template=acronyms,format/extra={\emph}}
% }{
% \@ifpackagelater{acro}{2019/02/17}{
%     % work around bug in 2019/02/17
%     \NewDocumentCommand\acrodef{mO{#1}mG{}}{\DeclareAcronym{#1}{short={#2}, long={#3}, foreign-plural={}, #4}}
% }{
%     \NewDocumentCommand\acrodef{mO{#1}mG{}}{\DeclareAcronym{#1}{short={#2}, long={#3}, #4}}
% }
% % Set up Acronyms for Enumerate
% \newlist{acronyms}{description}{1}
% \setlist[acronyms]{
%     labelwidth=7em,
%     leftmargin=7.5em,
%     noitemsep,
%     itemindent=0pt,
% }
% \DeclareAcroListStyle{acronyms}{list}{list=acronyms}
% \acsetup{list-heading={chapter*},list-name={\glossarytitlename},list-style=acronyms,extra-style=comma,extra-format={\emph}}
% }

% Make automatically inserted "blank pages" really blank
\RequirePackage{emptypage}

% Fix spacing around "..."
\RequirePackage{ellipsis}

% TeX ist kein Zeichenprogramm
\RequirePackage{tikz}[2010/10/13]
\usetikzlibrary{}

% Ensure that no floats are typeset before they are referenced
\RequirePackage{flafter}

% Provide the \FloatBarrier command that flushes all pending floats
\RequirePackage{placeins}

% Nag about deprecated LaTeX packages and commands
\RequirePackage[l2tabu, orthodox]{nag}

% Define command that will return current filename
\RequirePackage{currfile}

% Do not reset footnote counter on new chapter
\RequirePackage[]{chngcntr}
\counterwithout{footnote}{chapter}

% "Draft" watermark
\newcommand{\thewatermark}{\ifthenelse{\boolean{watermark}}{%
    \begin{tikzpicture}[remember picture, overlay]
        \node[anchor=south, outer sep=3.75cm] at (current page.south) {
            \color{gray}\currfilename\quad\timestamp
        };
    \end{tikzpicture}%
}{}}

% The "algorithm" environment
\RequirePackage{algorithmic}[2009/08/24]
\RequirePackage[plain,chapter]{algorithm}
\floatplacement{algorithm}{bp}

% The "syntax" environment
\RequirePackage[nounderscore,rounded]{syntax}

\renewcommand\fs@plain{%
\def\@fs@cfont{\rmfamily}%
\let\@fs@capt\floatc@plain%
\def\@fs@pre{\hrule\relax\kern2pt}%
\def\@fs@post{}%
\def\@fs@mid{\kern2pt\hrule\relax\vspace\abovecaptionskip\relax}%
\let\@fs@iftopcapt\iffalse%
}
\floatstyle{plain}
\restylefloat{algorithm}
\ifthenelse{\boolean{germanthesis}}{
    \floatname{algorithm}{Algorithmus}
}{
}

% Chapter/section headings and page styles
%\RequirePackage[pagestyles,nobottomtitles*]{titlesec}
\RequirePackage[pagestyles]{titlesec}

% Work around bug in titlesec version 2.10.1
\@ifpackagelater{titlesec}{2016/03/21}{}{\@ifpackagelater{titlesec}{2016/03/15}{%
    \def\ttlh@hang#1#2#3#4#5#6#7#8{%
    \gdef\ttl@makeline##1{\ttl@calc\hspace{#6}##1\ttl@calc\hspace{#7}}%
    \setlength\leftskip{#6}%
    \setlength\rightskip{#7}%
    \interlinepenalty\@M
    \ttl@changecentercr
    \ttl@beginlongest
    #1{\ifhmode\ttl@hmode@error\fi
         \ttl@glcmds
         \parindent\z@
         \begingroup
             \ifttl@label
                    \noindent
                    \sbox\z@{#2\strut\ttl@calc\hspace{#3}}%
                    \hangindent\wd\z@
                    \box\z@
             \fi
             #4{#8}%
             \kern\z@\strut\@@par
         \endgroup
         \nobreak\ttl@midlongest#5\@@par}%
    \ttl@endlongest}
}{}}

\ifthenelse{\boolean{plainunnumbered}}{
\renewpagestyle{plain}{%
    \sethead{}{}{}
    \setfoot{}{}{\thewatermark}
}
}{
\renewpagestyle{plain}{%
    \sethead{}{}{}
    \setfoot{}{\mypageheadfont\thepage}{\thewatermark}
}
}

% Pagestyle "fancy"
\newpagestyle{fancy}{%
\sethead*{
    \bfseries
    \toptitlemarks
    \mypageheadfont\bfseries
    \ifthechapter
        {
            \ifthesection
            {\firsttitlemarks\thesection~\sectiontitle}
            {\thechapter~\chaptertitle}
        }
        {\chaptertitle}
}
{}{\mypageheadfont\bfseries\thepage}
    \setfoot{}{}{\thewatermark}
    \headrule
}
\pagestyle{fancy}

% rename (sub)paragraph to (sub)subsubsubsection
\let\myparagraph\paragraph
\renewcommand{\paragraph}{\FIXME{in order to avoid confusion with hyperref, \\paragraph has been renamed to \\subsubsubsection}}
\let\subsubsubsection\myparagraph
\let\mysubparagraph\subparagraph
\renewcommand{\subparagraph}{\FIXME{in order to avoid confusion with hyperref, \\subparagraph has been renamed to \\subsubsubsubsection}}
\let\subsubsubsubsection\mysubparagraph

% heading styles
\titleformat{\chapter}[display]{\setlength\parskip{0pt}\myheadingfont\huge\bfseries\titlerule\vspace{0.25cm}}{\LARGE\chaptertitlename~\thechapter}{1em}{}[\vspace{0.25cm}\titlerule]
\titleformat{\section}{\myheadingfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\myheadingfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\myheadingfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\myheadingfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}{\myheadingfont\normalsize}{\thesubparagraph}{1em}{\labelitemi~}
\titlespacing*{\chapter}{0pt}{50pt}{40pt minus \parskip}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex - \parskip}{2.3ex plus .2ex - \parskip}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex - \parskip}{1.5ex plus .2ex - \parskip}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex - \parskip}{1.5ex plus .2ex - \parskip}
\titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex - \parskip}{1.5ex plus .2ex - \parskip}
\titlespacing*{\subparagraph}{0pt}{3.25ex plus 1ex minus .2ex - \parskip}{1.5ex plus .2ex - \parskip}
\ifthenelse{\boolean{earlydraft}}{
    \setcounter{tocdepth}{3}
    \setcounter{secnumdepth}{3}
}{
    \setcounter{tocdepth}{3}
    \setcounter{secnumdepth}{3}
}
% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% Commands for setting author, title, ...
% -----------------------------------------------------------------------------
\renewcommand{\author}[1]{\gdef\theauthor{#1}}
\renewcommand{\title}[1]{\gdef\thetitle{#1}}
\newcommand{\thesistype}[1]{\gdef\thethesistype{#1}}
\newcommand{\degreeprogram}[1]{\gdef\thedegreeprogram{#1}}
\newcommand{\birthday}[1]{\gdef\thebirthday{#1}}
\newcommand{\birthplace}[1]{\gdef\thebirthplace{#1}}
\newcommand{\advisors}[1]{\gdef\theadvisors{#1}}
\newcommand{\referees}[1]{\gdef\thereferees{#1}}
% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% Listings
% -----------------------------------------------------------------------------
\RequirePackage[savemem]{listings}
\ifthenelse{\boolean{germanthesis}}{
    \renewcommand{\lstlistlistingname}{Listingverzeichnis}
}{
    \renewcommand{\lstlistlistingname}{List of Listings}
}
\lstset{
    language=C,
    frame=lines,
    framesep=5pt,
    captionpos=b,
    abovecaptionskip=1em,
    numbers=left,
    xleftmargin=15pt,
    framexleftmargin=15pt,
    numberstyle=\tiny,
    numbersep=5pt,
    stepnumber=1,
    fontadjust,
    tabsize=2,
    showtabs=false,
    showspaces=false,
    showstringspaces=false,
    breaklines=true,
    breakatwhitespace=true,
    keywordstyle=\color{black},
    identifierstyle=\bfseries\color{blue},
    commentstyle=\color{red},
    prebreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\searrow}},
    stringstyle=\bfseries\color{blue},
    basicstyle=\ttfamily\bfseries\color{black}\footnotesize,
}
\lstdefinestyle{txt}{
    float,
    floatplacement=bp,
    language=C
}
\lstdefinestyle{xml}{
    float,
    floatplacement=bp,
    language=XML
}
% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% TOCs
% -----------------------------------------------------------------------------

% Include list-of-Xs in table of contents
\ifthenelse{\boolean{earlydraft}}{
    \RequirePackage[]{tocbibind}
    \renewcommand{\lstlistoflistings}{\begingroup\tocfile{\lstlistlistingname}{lol}\endgroup}
    \newcommand{\listofabbreviations}{\addcontentsline{toc}{chapter}{\glossarytitlename}\printacronyms}
    \newcommand{\mymaketodotocentry}{\todototoc}
}{
    \RequirePackage[nottoc,notlot,notlof]{tocbibind}
    \newcommand{\listofabbreviations}{\printacronyms}
    \newcommand{\mymaketodotocentry}{}
}

% -----------------------------------------------------------------------------

% -----------------------------------------------------------------------------
% Visible TODO and FIXME markers
% -----------------------------------------------------------------------------
\ifthenelse{\boolean{germanthesis}}{
    \@ifpackagelater{siunitx}{2021/06/04}{
        \RequirePackage[loadshadowlibrary,colorinlistoftodos, textwidth=3.75cm, shadow, ngerman]{todonotes}
    }{
        \RequirePackage[colorinlistoftodos, textwidth=3.75cm, shadow, ngerman]{todonotes}
    }
    \@todonotes@SetTodoListName{Offene Punkte}
}{
    \@ifpackagelater{siunitx}{2021/06/04}{
        \RequirePackage[loadshadowlibrary,colorinlistoftodos, textwidth=3.75cm, shadow]{todonotes}
    }{
        \RequirePackage[colorinlistoftodos, textwidth=3.75cm, shadow]{todonotes}
    }
}
\newcounter{TODOCOUNT}
\newcommand{\TODO}[1]{\vspace{0.5em}\todo[inline, color=orange]{#1}\stepcounter{TODOCOUNT}}
\newcommand{\FIXME}[1]{\todo[size=\small, color=red]{#1}\stepcounter{TODOCOUNT}}
\AtEndDocument{
    \ifnum\value{TODOCOUNT}>0
        %\cleardoublepage
        \mymaketodotocentry\listoftodos
    \fi
}
% -----------------------------------------------------------------------------

\usepackage{newfile}
\newoutputstream{nsm@xmpdata}

% -----------------------------------------------------------------------------
% Title page
% -----------------------------------------------------------------------------
\newcommand{\coverpagetextsmall}[1]{%
    \@nsmgroupcoverpage@smalltextsize%
    #1%
    \vspace{0.5cm}\\%
}

\newcommand{\coverpagetextlarge}[1]{%
    \vspace{0.25cm}%
    \@nsmgroupcoverpage@largetextsize%
    #1%
    \@nsmgroupcoverpage@smalltextsize%
    \vspace{0.5cm}\\%
}
\renewcommand{\maketitle}{%

% Do some stuff we had to postpone until after, e.g., \thetitle was set
\ifthenelse{\boolean{phdthesis}}{%
\openoutputfile{\jobname.xmpdata}{nsm@xmpdata}
\addtostream{nsm@xmpdata}{\string\Title{\thetitle}}%
\addtostream{nsm@xmpdata}{\string\Author{\theauthor}}%
\addtostream{nsm@xmpdata}{\string\Subject{PhD thesis}}%
}{%
\openoutputfile{\jobname.xmpdata}{nsm@xmpdata}
\addtostream{nsm@xmpdata}{\string\Title{\thetitle}}%
\addtostream{nsm@xmpdata}{\string\Author{\theauthor}}%
\addtostream{nsm@xmpdata}{\string\Subject{\thethesistype\ in \thedegreeprogram}}%
}

\hypersetup{%
  pdfborder=0 0 0
}

% Count authors
\newcounter{@nsmauthorcount}%
\foreach \n [count=\ni] in \theauthor {%
    \stepcounter{@nsmauthorcount}%
}%

% Count advisors
\newcounter{@nsmadvisorcount}%
\ifdef\theadvisors{%
\foreach \n [count=\ni] in \theadvisors {%
    \stepcounter{@nsmadvisorcount}%
}%
}%

% Count referees
\newcounter{@nsmrefereecount}%
\foreach \n [count=\ni] in \thereferees {%
    \stepcounter{@nsmrefereecount}%
}%

\pagenumbering{alph}

% Output cover page
\ifthenelse{\boolean{cutmargins}}{
    % no cover page if cutmargins is set
}
{%

\tikzoption{text @nsmgroupcoverpage@ badly raggedleft}[]{\def\tikz@text@action{\raggedleft\relax}}

\begingroup
\pagestyle{empty}
\setcounter{page}\@ne

\def\@nsmgroupcoverpage@titlesize{\@setfontsize{\@nsmgroupcoverpage@titlesize}{20}{24pt}}
\def\@nsmgroupcoverpage@subtitlesize{\@setfontsize{\@nsmgroupcoverpage@subtitlesize}{14}{17pt}}
\def\@nsmgroupcoverpage@citeassize{\@setfontsize{\@nsmgroupcoverpage@citeassize}{8}{9pt}}
\def\@nsmgroupcoverpage@addressize{\@setfontsize{\@nsmgroupcoverpage@addressize}{8}{9pt}}
\def\@nsmgroupcoverpage@smalltextsize{\@setfontsize{\@nsmgroupcoverpage@smalltextsize}{14}{17pt}}
\def\@nsmgroupcoverpage@largetextsize{\@setfontsize{\@nsmgroupcoverpage@largetextsize}{20}{24pt}}

\def\@nsmgroupcoverpage@verysmalltextsize{\@setfontsize{\@nsmgroupcoverpage@verysmalltextsize}{9}{10pt}}
\def\@nsmgroupcoverpage@verylargetextsize{\@setfontsize{\@nsmgroupcoverpage@verylargetextsize}{25}{30pt}}
\def\@nsmgroupcoverpage@verymidtextsize{\@setfontsize{\@nsmgroupcoverpage@verymidtextsize}{14.5}{14pt}}
\def\@nsmgroupcoverpage@verysometextsize{\@setfontsize{\@nsmgroupcoverpage@verysometextsize}{12}{14pt}}
\def\@nsmgroupcoverpage@verybiggersometextsize{\@setfontsize{\@nsmgroupcoverpage@verybiggersometextsize}{17.25}{22pt}}



\renewcommand{\baselinestretch}{1.00}

\begin{tikzpicture}[remember picture,overlay] \node[xshift=0cm,yshift=0cm] at (current page.north west) { \begin{tikzpicture}[remember picture, overlay]

    \definecolor{tudblue}{HTML}{00305d}
    \definecolor{tudgray}{HTML}{717776}

    % TUD Logo
    \draw[xshift=2.83cm+0.03cm,yshift=-1.232cm-1.25cm] node [anchor=north west] {%
        \includegraphics[height=1.653cm]{nsm-thesis-logo-tud}%
    };

    % TUD Header
    \draw[xshift=2.83cm,yshift=-3.85cm-1.25cm] node [anchor=base west, text width=15.7cm] {%
        \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysmalltextsize%
        \color{tudgray}%
        Faculty of Computer Science%
        \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysmalltextsize%
        , %
        Chair of Compiler Construction%
    };

    \draw[xshift=2.83cm,yshift=-6.45cm] node [anchor=north west] {%
        \begin{minipage}[t][20.10cm][t]{15.75cm}
            \raggedright%

            \ifthenelse{\boolean{phdthesis}}
            % PhD Thesis cover page
            {
                \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verylargetextsize%
                \noprotrusion\thetitle{}

                \vspace{0.75cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \theauthor {%
                    \ifnum\ni=1%
                    \else
                        \ifnum\ni=\the@nsmauthorcount%
                            ~und~%
                        \else%
                            ,~%
                        \fi%
                    \fi%
                    \n
                }%

                \vspace{0.23cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                Geboren am: \thebirthday{} in \thebirthplace{}

                \vfill

                \vspace{0.40cm}
                \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verybiggersometextsize%
                Dissertation

                \vspace{0.52cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                zur Erlangung des akademischen Grades

                \vspace{0.58cm}
                \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verybiggersometextsize%
                Doktor der Ingenieurwissenschaften (Dr.-Ing.)

                \vfill
                \vfill

                \vspace{0.40cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                Betreuer

                \vspace{0.15cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \theadvisors {%
                    \ifnum\ni=1%
                    \else%
                        \vspace{0.15cm}%
                        \linebreak%
                    \fi%
                    \n%
                }%

                \vspace{0.27cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                Gutachter

                \vspace{0.15cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \thereferees {%
                    \ifnum\ni=1%
                    \else%
                        \vspace{0.15cm}%
                        \linebreak%
                    \fi%
                    \n%
                }%

                \vspace{0.43cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                Eingereicht am: \germandateformat\today

                \vspace{0.0cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                Verteidigt am: \germandateformat\today
            }
            % else: Bachelor/Master/Diploma Thesis cover page
            {
                \vspace{1.00cm}
                \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verylargetextsize%
                \noprotrusion\thetitle{}

                \vspace{0.75cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \theauthor {%
                    \ifnum\ni=1%
                    \else
                        \ifnum\ni=\the@nsmauthorcount%
                            ~und~%
                        \else%
                            ,~%
                        \fi%
                    \fi%
                    \n
                }%

                \vspace{0.23cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                \ifthenelse{\boolean{germanthesis}}{%
                    Geboren am \thebirthday{} in \thebirthplace{}
                }{%
                    Born on \thebirthday{} in \thebirthplace{}
                }%

                \vfill

                \vspace{0.40cm}
                \fontfamily{\opensansfamily}\fontseries{sb}\fontshape{n}\selectfont\@nsmgroupcoverpage@verybiggersometextsize%
                \ifthenelse{\boolean{germanthesis}}{%
                    \thethesistype{} im Studiengang \thedegreeprogram{}
                }{%
                    \thethesistype{} in \thedegreeprogram{}
                }%

                \vspace{0.43cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                \ifthenelse{\boolean{germanthesis}}{%
                    \germandateformat\today
                }{%
                    \americandateformat\today
                }%

                \vfill
                \vfill

                \ifdef\theadvisors{%
                \vspace{0.40cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                \ifthenelse{\boolean{germanthesis}}{%
                    Betreuer
                }{%
                    Advisor\ifthenelse{\the@nsmadvisorcount>1}{s}{}%
                }%

                \vspace{0.15cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \theadvisors {%
                    \ifnum\ni=1%
                    \else%
                        \vspace{0.15cm}%
                        \linebreak%
                    \fi%
                    \n%
                }%
                }%

                \par
                \vspace{0.27cm}
                \fontfamily{\opensansfamily}\fontseries{l}\fontshape{n}\selectfont\@nsmgroupcoverpage@verysometextsize%
                \ifthenelse{\boolean{germanthesis}}{%
                    Gutachter
                }{%
                    Referee\ifthenelse{\the@nsmrefereecount>1}{s}{}%
                }%

                \vspace{0.15cm}
                \fontfamily{\opensansfamily}\fontseries{m}\fontshape{n}\selectfont\@nsmgroupcoverpage@verymidtextsize%
                \foreach \n [count=\ni] in \thereferees {%
                    \ifnum\ni=1%
                    \else%
                        \vspace{0.15cm}%
                        \linebreak%
                    \fi%
                    \n%
                }%
            }
        \end{minipage}
    };

\end{tikzpicture} }; \end{tikzpicture}

\cleardoublepage
\setcounter{page}\@ne
\endgroup
}

\pagenumbering{roman}

%
% The delaration comes here
%

\ifthenelse{\boolean{phdthesis}}{}
{
\thispagestyle{empty}

\begin{otherlanguage*}{ngerman}
{\Large\noindent%
Erklärung \newline}

\noindent\nohyphens{%
Ich versichere, dass ich alle bewertungsrelevanten Beiträge dieser Arbeit ohne Hilfe anderer Personen und Werkzeuge erbracht habe oder diese Beiträge klar und unmissverständlich im Text gekennzeichnet habe (etwa durch Zitate).
Diese Arbeit wurde in gleicher oder ähnlicher Form keiner anderen Prüfungsbehörde vorgelegt.
Sollte ich mehrere Kopien dieser Arbeit zur Bewertung abgeben, so ist deren Inhalt identisch.
}\end{otherlanguage*}


\vspace{2cm}


\begin{otherlanguage*}{american}
{\Large\noindent%
Declaration \newline}

\noindent\nohyphens{%
I declare that I have achieved all grading-relevant contributions to this work without the help of other persons or tools, or that I have clearly and unmistakably identified such contributions in the text (e.g., by citations).
This work has not been submitted in the same or a similar form to any other examination body.
Should I submit multiple copies of this work for grading, their content is identical.
}\end{otherlanguage*}


\vspace{2cm}

\foreach \n [count=\ni] in \theauthor {%
    \noindent%
    \vspace{1cm}\\
    (\n)\\
    \ifnum\ni=\the@nsmauthorcount%
        \ifthenelse{\boolean{germanthesis}}{%
            Dresden, \germandateformat\today
        }{%
            Dresden, \americandateformat\today
        }%
    \fi
}%



\cleardoublepage
}

\pagestyle{fancy}

}

\usepackage{silence}

% #region (nsm-thesis-logo-tud.eps)
\WarningFilter{latex}{File `./nsm-thesis-logo-tud.eps' already in current directory.}
\begin{filecontents}[noheader,nosearch]{nsm-thesis-logo-tud.eps}
%!PS-Adobe-3.0 EPSF-3.0
%%Creator: cairo 1.18.0 (https://cairographics.org)
%%CreationDate: Thu Aug  7 13:38:11 2025
%%Pages: 1
%%DocumentData: Clean7Bit
%%LanguageLevel: 2
%%BoundingBox: 0 0 170 57
%%EndComments
%%BeginProlog
50 dict begin
/q { gsave } bind def
/Q { grestore } bind def
/cm { 6 array astore concat } bind def
/w { setlinewidth } bind def
/J { setlinecap } bind def
/j { setlinejoin } bind def
/M { setmiterlimit } bind def
/d { setdash } bind def
/m { moveto } bind def
/l { lineto } bind def
/c { curveto } bind def
/h { closepath } bind def
/re { exch dup neg 3 1 roll 5 3 roll moveto 0 rlineto
0 exch rlineto 0 rlineto closepath } bind def
/S { stroke } bind def
/f { fill } bind def
/f* { eofill } bind def
/n { newpath } bind def
/W { clip } bind def
/W* { eoclip } bind def
/BT { } bind def
/ET { } bind def
/BDC { mark 3 1 roll /BDC pdfmark } bind def
/EMC { mark /EMC pdfmark } bind def
/cairo_store_point { /cairo_point_y exch def /cairo_point_x exch def } def
/Tj { show currentpoint cairo_store_point } bind def
/TJ {
{
        dup
        type /stringtype eq
            { show } { -0.001 mul 0 cairo_font_matrix dtransform rmoveto } ifelse
    } forall
currentpoint cairo_store_point
} bind def
/cairo_selectfont { cairo_font_matrix aload pop pop pop 0 0 6 array astore
cairo_font exch selectfont cairo_point_x cairo_point_y moveto } bind def
/Tf { pop /cairo_font exch def /cairo_font_matrix where
    { pop cairo_selectfont } if } bind def
/Td { matrix translate cairo_font_matrix matrix concatmatrix dup
/cairo_font_matrix exch def dup 4 get exch 5 get cairo_store_point
/cairo_font where { pop cairo_selectfont } if } bind def
/Tm { 2 copy 8 2 roll 6 array astore /cairo_font_matrix exch def
cairo_store_point /cairo_font where { pop cairo_selectfont } if } bind def
/g { setgray } bind def
/rg { setrgbcolor } bind def
/d1 { setcachedevice } bind def
/cairo_data_source {
CairoDataIndex CairoData length lt
    { CairoData CairoDataIndex get /CairoDataIndex CairoDataIndex 1 add def }
    { () } ifelse
} def
/cairo_flush_ascii85_file { cairo_ascii85_file status { cairo_ascii85_file flushfile } if } def
/cairo_image { image cairo_flush_ascii85_file } def
/cairo_imagemask { imagemask cairo_flush_ascii85_file } def
%%EndProlog
%%BeginSetup
%%EndSetup
%%Page: 1 1
%%BeginPageSetup
%%PageBoundingBox: 0 0 170 57
%%EndPageSetup
q 0 0 170 57 rectclip
1 0 0 -1 0 57 cm q
0 0 0.54902 rg
56.695 33.688 m 37.137 37.137 l 37.137 19.559 l 17.574 0 l 40.09 0 l 56.695
16.605 l 56.695 33.688 l f
0 23.008 m 19.559 19.559 l 19.559 37.137 l 39.121 56.695 l 16.605 56.695
l 0 40.09 l 0 23.008 l f
87.219 24.988 m 88.418 24.988 89.348 25.293 90.012 25.906 c 90.676 26.52
91.012 27.508 91.012 28.879 c 91.012 35.777 l 88.547 35.777 l 88.547 29.387
l 88.547 28.578 88.387 27.977 88.066 27.578 c 87.75 27.18 87.258 26.98
86.59 26.98 c 85.602 26.98 84.922 27.293 84.559 27.918 c 84.191 28.547 84.012
29.445 84.012 30.617 c 84.012 35.777 l 81.527 35.777 l 81.527 25.184 l
83.441 25.184 l 83.797 26.609 l 83.914 26.609 l 84.148 26.246 84.434 25.941
84.773 25.699 c 85.113 25.461 85.484 25.281 85.898 25.164 c 86.309 25.047
86.75 24.988 87.219 24.988 c f
95.965 25.184 m 95.965 35.777 l 93.48 35.777 l 93.48 25.184 l h
94.754 21.078 m 95.117 21.078 95.438 21.176 95.711 21.371 c 95.984 21.566
96.121 21.906 96.121 22.387 c 96.121 22.855 95.984 23.191 95.711 23.395
c 95.438 23.598 95.117 23.695 94.754 23.695 c 94.359 23.695 94.031 23.598
93.766 23.395 c 93.5 23.191 93.363 22.855 93.363 22.387 c 93.363 21.906
93.5 21.566 93.766 21.371 c 94.031 21.176 94.359 21.078 94.754 21.078 c
f
140.91 25.184 m 140.91 35.777 l 138.43 35.777 l 138.43 25.184 l h
139.699 21.078 m 140.062 21.078 140.383 21.176 140.656 21.371 c 140.93
21.566 141.066 21.906 141.066 22.387 c 141.066 22.855 140.93 23.191 140.656
23.395 c 140.383 23.598 140.062 23.695 139.699 23.695 c 139.309 23.695
138.98 23.598 138.711 23.395 c 138.445 23.191 138.312 22.855 138.312 22.387
c 138.312 21.906 138.445 21.566 138.711 21.371 c 138.98 21.176 139.309
21.078 139.699 21.078 c f
148.219 34 m 148.531 34 148.832 33.969 149.117 33.91 c 149.402 33.852 149.672
33.785 149.918 33.707 c 149.918 35.543 l 149.656 35.66 149.316 35.762 148.902
35.848 c 148.484 35.934 148.047 35.973 147.594 35.973 c 146.992 35.973
146.449 35.875 145.961 35.672 c 145.473 35.469 145.082 35.121 144.785 34.625
c 144.492 34.129 144.348 33.441 144.348 32.555 c 144.348 27.039 l 142.918
27.039 l 142.918 25.965 l 144.484 25.105 l 145.266 22.855 l 146.809 22.855
l 146.809 25.184 l 149.82 25.184 l 149.82 27.039 l 146.809 27.039 l 146.809
32.535 l 146.809 33.027 146.938 33.398 147.203 33.637 c 147.461 33.879
147.801 34 148.219 34 c f
167.355 34 m 167.668 34 167.969 33.969 168.254 33.91 c 168.539 33.852 168.809
33.785 169.055 33.707 c 169.055 35.543 l 168.793 35.66 168.457 35.762 168.039
35.848 c 167.621 35.934 167.184 35.973 166.73 35.973 c 166.129 35.973 165.586
35.875 165.098 35.672 c 164.605 35.469 164.219 35.121 163.922 34.625 c
163.629 34.129 163.484 33.441 163.484 32.555 c 163.484 27.039 l 162.055
27.039 l 162.055 25.965 l 163.621 25.105 l 164.402 22.855 l 165.945 22.855
l 165.945 25.184 l 168.957 25.184 l 168.957 27.039 l 165.945 27.039 l 165.945
32.535 l 165.945 33.027 166.078 33.398 166.34 33.637 c 166.598 33.879 166.938
34 167.355 34 c f
156.996 22.406 m 156.996 21.988 157.109 21.691 157.34 21.508 c 157.566
21.324 157.848 21.234 158.188 21.234 c 158.5 21.234 158.777 21.324 159.02
21.508 c 159.262 21.691 159.383 21.988 159.383 22.406 c 159.383 22.797
159.262 23.086 159.02 23.277 c 158.777 23.465 158.5 23.559 158.188 23.559
c 157.848 23.559 157.566 23.465 157.34 23.277 c 157.109 23.086 156.996
22.797 156.996 22.406 c h
156.664 30.812 m 155.594 30.867 154.852 31.043 154.434 31.352 c 154.02
31.656 153.809 32.09 153.809 32.652 c 153.809 33.145 153.961 33.516 154.258
33.754 c 154.559 33.996 154.941 34.117 155.414 34.117 c 156.129 34.117
156.73 33.91 157.223 33.492 c 157.711 33.074 157.953 32.469 157.953 31.672
c 157.953 30.773 l h
152.988 22.406 m 152.988 21.988 153.102 21.691 153.332 21.508 c 153.559
21.324 153.836 21.234 154.16 21.234 c 154.484 21.234 154.77 21.324 155.012
21.508 c 155.254 21.691 155.375 21.988 155.375 22.406 c 155.375 22.797
155.254 23.086 155.012 23.277 c 154.77 23.465 154.484 23.559 154.16 23.559
c 153.836 23.559 153.559 23.465 153.332 23.277 c 153.102 23.086 152.988
22.797 152.988 22.406 c h
156.43 24.988 m 157.746 24.988 158.738 25.289 159.41 25.895 c 160.082 26.504
160.418 27.426 160.418 28.664 c 160.418 35.777 l 158.656 35.777 l 158.188
34.312 l 158.109 34.312 l 157.809 34.691 157.5 35.004 157.184 35.25 c 156.859
35.5 156.496 35.68 156.078 35.797 c 155.66 35.914 155.156 35.973 154.57
35.973 c 153.945 35.973 153.383 35.855 152.879 35.621 c 152.379 35.387
151.984 35.031 151.695 34.547 c 151.41 34.066 151.27 33.453 151.27 32.711
c 151.27 31.629 151.676 30.805 152.488 30.238 c 153.305 29.668 154.531
29.359 156.176 29.309 c 157.953 29.25 l 157.953 28.801 l 157.953 28.082
157.789 27.578 157.465 27.285 c 157.141 26.992 156.688 26.844 156.117 26.844
c 155.605 26.844 155.102 26.926 154.602 27.09 c 154.098 27.254 153.613
27.438 153.145 27.645 c 152.402 25.926 l 152.922 25.641 153.527 25.41 154.219
25.242 c 154.91 25.07 155.648 24.988 156.43 24.988 c f
101.5 35.777 m 97.473 25.184 l 100.094 25.184 l 102.168 31.438 l 102.246
31.621 102.32 31.848 102.398 32.113 c 102.48 32.379 102.555 32.641 102.625
32.895 c 102.695 33.148 102.738 33.375 102.754 33.57 c 102.832 33.57 l
102.855 33.375 102.906 33.148 102.977 32.895 c 103.051 32.641 103.129 32.383
103.223 32.121 c 103.312 31.863 103.383 31.633 103.438 31.438 c 105.547
25.184 l 108.168 25.184 l 104.121 35.777 l 101.5 35.777 l f
113.82 26.824 m 113.145 26.824 112.602 27.039 112.188 27.469 c 111.777
27.898 111.543 28.52 111.477 29.328 c 115.992 29.328 l 115.992 28.832 115.914
28.398 115.758 28.027 c 115.602 27.656 115.363 27.363 115.043 27.148 c
114.727 26.934 114.316 26.824 113.82 26.824 c h
113.781 24.988 m 114.734 24.988 115.555 25.176 116.246 25.555 c 116.938
25.934 117.469 26.48 117.84 27.195 c 118.211 27.914 118.398 28.781 118.398
29.797 c 118.398 31.066 l 111.418 31.066 l 111.441 32.02 111.711 32.754
112.219 33.277 c 112.727 33.797 113.449 34.059 114.391 34.059 c 115.055
34.059 115.652 33.992 116.188 33.863 c 116.723 33.734 117.27 33.543 117.832
33.297 c 117.832 35.25 l 117.309 35.5 116.77 35.68 116.207 35.797 c 115.648
35.914 114.969 35.973 114.176 35.973 c 113.145 35.973 112.23 35.777 111.426
35.379 c 110.625 34.98 110 34.379 109.551 33.57 c 109.102 32.762 108.875
31.758 108.875 30.559 c 108.875 29.348 109.082 28.328 109.492 27.5 c 109.902
26.672 110.477 26.047 111.211 25.621 c 111.949 25.199 112.805 24.988 113.781
24.988 c f
125.934 24.988 m 126.129 24.988 126.34 24.996 126.57 25.016 c 126.797 25.035
126.98 25.066 127.125 25.105 c 126.871 27.41 l 126.715 27.387 126.535 27.359
126.336 27.332 c 126.133 27.309 125.914 27.293 125.68 27.293 c 125.34 27.293
125.008 27.352 124.684 27.469 c 124.355 27.586 124.059 27.77 123.781 28.016
c 123.512 28.266 123.293 28.574 123.137 28.945 c 122.98 29.316 122.902
29.766 122.902 30.285 c 122.902 35.777 l 120.422 35.777 l 120.422 25.184
l 122.336 25.184 l 122.688 27.02 l 122.805 27.02 l 123.016 26.641 123.273
26.297 123.59 25.984 c 123.898 25.672 124.254 25.426 124.652 25.25 c 125.051
25.074 125.477 24.988 125.934 24.988 c f
136.027 32.73 m 136.027 33.406 135.863 33.988 135.539 34.469 c 135.211
34.953 134.73 35.324 134.09 35.582 c 133.453 35.844 132.656 35.973 131.707
35.973 c 130.965 35.973 130.312 35.922 129.75 35.816 c 129.188 35.715 128.668
35.551 128.188 35.328 c 128.188 33.219 l 128.707 33.465 129.285 33.672
129.918 33.832 c 130.551 33.996 131.133 34.078 131.668 34.078 c 132.371
34.078 132.879 33.973 133.191 33.766 c 133.504 33.559 133.66 33.277 133.66
32.926 c 133.66 32.703 133.594 32.504 133.457 32.328 c 133.316 32.152 133.07
31.973 132.711 31.789 c 132.355 31.609 131.848 31.387 131.195 31.125 c
130.547 30.867 129.996 30.602 129.547 30.336 c 129.098 30.066 128.754 29.742
128.52 29.355 c 128.285 28.973 128.168 28.492 128.168 27.918 c 128.168
26.969 128.547 26.242 129.301 25.738 c 130.059 25.238 131.055 24.988 132.293
24.988 c 132.957 24.988 133.578 25.051 134.16 25.184 c 134.738 25.312 135.309
25.508 135.871 25.77 c 135.129 27.527 l 134.645 27.32 134.148 27.148 133.641
27.012 c 133.133 26.875 132.664 26.805 132.234 26.805 c 131.688 26.805
131.266 26.891 130.973 27.059 c 130.68 27.23 130.531 27.465 130.531 27.762
c 130.531 27.996 130.605 28.195 130.746 28.359 c 130.891 28.523 131.145
28.688 131.512 28.859 c 131.875 29.027 132.383 29.234 133.035 29.484 c
133.672 29.73 134.219 29.992 134.668 30.266 c 135.117 30.539 135.457 30.867
135.684 31.254 c 135.914 31.637 136.027 32.129 136.027 32.73 c f
79.055 30.852 m 79.055 31.816 78.848 32.688 78.438 33.461 c 78.027 34.238
77.406 34.852 76.57 35.301 c 75.738 35.75 74.684 35.973 73.406 35.973 c
71.594 35.973 70.219 35.504 69.281 34.559 c 68.34 33.613 67.871 32.363
67.871 30.812 c 67.871 21.82 l 70.375 21.82 l 70.375 30.559 l 70.375 31.691
70.637 32.523 71.156 33.051 c 71.68 33.578 72.453 33.844 73.484 33.844
c 74.211 33.844 74.801 33.719 75.254 33.473 c 75.703 33.223 76.035 32.852
76.25 32.348 c 76.465 31.848 76.57 31.242 76.57 30.539 c 76.57 21.82 l
79.055 21.82 l 79.055 30.852 l f
76.676 49.598 m 76.676 48.516 76.504 47.621 76.168 46.918 c 75.828 46.215
75.328 45.691 74.672 45.344 c 74.012 45 73.203 44.824 72.238 44.824 c 70.418
44.824 l 70.418 54.582 l 71.906 54.582 l 73.508 54.582 74.703 54.168 75.492
53.34 c 76.281 52.512 76.676 51.266 76.676 49.598 c h
79.312 49.52 m 79.312 51.094 79.02 52.418 78.434 53.488 c 77.848 54.555
77.012 55.355 75.922 55.891 c 74.832 56.426 73.535 56.691 72.023 56.691
c 67.879 56.691 l 67.879 42.734 l 72.395 42.734 l 73.828 42.734 75.062
42.996 76.098 43.516 c 77.133 44.039 77.93 44.797 78.484 45.793 c 79.035
46.789 79.312 48.031 79.312 49.52 c f
87.055 45.902 m 87.25 45.902 87.461 45.91 87.688 45.93 c 87.918 45.949
88.102 45.98 88.246 46.02 c 87.992 48.324 l 87.836 48.301 87.656 48.273
87.453 48.246 c 87.25 48.223 87.035 48.207 86.801 48.207 c 86.461 48.207
86.129 48.266 85.801 48.383 c 85.477 48.5 85.176 48.684 84.902 48.93 c
84.629 49.18 84.414 49.488 84.258 49.859 c 84.102 50.23 84.023 50.68 84.023
51.199 c 84.023 56.691 l 81.539 56.691 l 81.539 46.098 l 83.457 46.098
l 83.809 47.934 l 83.926 47.934 l 84.133 47.555 84.395 47.211 84.707 46.898
c 85.02 46.586 85.375 46.34 85.773 46.164 c 86.172 45.988 86.598 45.902
87.055 45.902 c f
93.926 47.738 m 93.246 47.738 92.703 47.953 92.293 48.383 c 91.883 48.812
91.645 49.434 91.578 50.242 c 96.094 50.242 l 96.094 49.746 96.016 49.312
95.859 48.941 c 95.703 48.57 95.465 48.277 95.145 48.062 c 94.828 47.848
94.418 47.738 93.926 47.738 c h
93.887 45.902 m 94.836 45.902 95.656 46.09 96.348 46.469 c 97.039 46.848
97.57 47.395 97.941 48.109 c 98.312 48.828 98.5 49.695 98.5 50.711 c 98.5
51.98 l 91.52 51.98 l 91.547 52.934 91.812 53.668 92.32 54.191 c 92.828
54.711 93.551 54.973 94.488 54.973 c 95.156 54.973 95.754 54.906 96.289
54.777 c 96.824 54.648 97.371 54.457 97.934 54.211 c 97.934 56.164 l 97.41
56.414 96.871 56.594 96.309 56.711 c 95.75 56.828 95.07 56.887 94.273 56.887
c 93.246 56.887 92.332 56.691 91.527 56.293 c 90.727 55.895 90.102 55.293
89.652 54.484 c 89.203 53.676 88.977 52.672 88.977 51.473 c 88.977 50.262
89.184 49.242 89.594 48.414 c 90.004 47.586 90.578 46.961 91.312 46.535
c 92.051 46.113 92.906 45.902 93.887 45.902 c f
108.207 53.645 m 108.207 54.32 108.047 54.902 107.719 55.383 c 107.395
55.867 106.91 56.238 106.273 56.496 c 105.633 56.758 104.84 56.887 103.887
56.887 c 103.145 56.887 102.492 56.836 101.934 56.73 c 101.371 56.629 100.852
56.465 100.367 56.242 c 100.367 54.133 l 100.891 54.379 101.465 54.586
102.098 54.746 c 102.73 54.91 103.312 54.992 103.848 54.992 c 104.551 54.992
105.062 54.887 105.375 54.68 c 105.688 54.473 105.844 54.191 105.844 53.84
c 105.844 53.617 105.773 53.418 105.637 53.242 c 105.5 53.066 105.254 52.887
104.895 52.703 c 104.535 52.523 104.031 52.301 103.379 52.039 c 102.727
51.781 102.176 51.516 101.727 51.25 c 101.277 50.98 100.934 50.656 100.699
50.27 c 100.465 49.887 100.348 49.406 100.348 48.832 c 100.348 47.883 100.727
47.156 101.48 46.652 c 102.238 46.152 103.234 45.902 104.473 45.902 c 105.141
45.902 105.762 45.965 106.34 46.098 c 106.922 46.227 107.488 46.422 108.051
46.684 c 107.309 48.441 l 106.828 48.234 106.332 48.062 105.82 47.926 c
105.312 47.789 104.844 47.719 104.414 47.719 c 103.867 47.719 103.445 47.805
103.152 47.973 c 102.859 48.145 102.715 48.379 102.715 48.676 c 102.715
48.91 102.785 49.109 102.93 49.273 c 103.07 49.438 103.328 49.602 103.691
49.773 c 104.059 49.941 104.562 50.148 105.219 50.398 c 105.855 50.645
106.398 50.906 106.848 51.18 c 107.301 51.453 107.637 51.781 107.863 52.168
c 108.094 52.551 108.207 53.043 108.207 53.645 c f
114.645 54.875 m 115.555 54.875 116.199 54.617 116.578 54.102 c 116.957
53.586 117.145 52.801 117.145 51.746 c 117.145 51.434 l 117.145 50.301
116.969 49.43 116.609 48.824 c 116.25 48.219 115.59 47.914 114.625 47.914
c 113.883 47.914 113.312 48.227 112.914 48.844 c 112.516 49.461 112.316
50.332 112.316 51.453 c 112.316 52.574 112.516 53.426 112.914 54.004 c
113.312 54.586 113.887 54.875 114.645 54.875 c h
113.898 56.887 m 112.676 56.887 111.684 56.426 110.918 55.5 c 110.156 54.574
109.773 53.215 109.773 51.414 c 109.773 49.59 110.16 48.215 110.93 47.289
c 111.695 46.363 112.707 45.902 113.961 45.902 c 114.48 45.902 114.934
45.969 115.316 46.105 c 115.703 46.242 116.039 46.43 116.324 46.664 c 116.609
46.898 116.852 47.16 117.047 47.445 c 117.145 47.445 l 117.121 47.238 117.09
46.941 117.059 46.555 c 117.023 46.172 117.008 45.828 117.008 45.531 c
117.008 41.836 l 119.512 41.836 l 119.512 56.691 l 117.578 56.691 l 117.105
55.305 l 117.008 55.305 l 116.812 55.59 116.574 55.855 116.297 56.098 c
116.016 56.34 115.676 56.531 115.277 56.672 c 114.883 56.816 114.422 56.887
113.898 56.887 c f
138.77 45.898 m 139.969 45.898 140.898 46.207 141.562 46.82 c 142.23 47.434
142.562 48.422 142.562 49.789 c 142.562 56.691 l 140.098 56.691 l 140.098
50.301 l 140.098 49.492 139.938 48.887 139.621 48.492 c 139.301 48.094
138.809 47.895 138.145 47.895 c 137.152 47.895 136.477 48.207 136.109 48.832
c 135.746 49.457 135.562 50.359 135.562 51.531 c 135.562 56.691 l 133.078
56.691 l 133.078 46.098 l 134.996 46.098 l 135.348 47.523 l 135.465 47.523
l 135.699 47.16 135.984 46.855 136.324 46.613 c 136.664 46.371 137.039
46.195 137.449 46.078 c 137.859 45.957 138.301 45.898 138.77 45.898 c f
126.48 47.738 m 125.801 47.738 125.258 47.953 124.848 48.383 c 124.438
48.812 124.195 49.434 124.133 50.242 c 128.648 50.242 l 128.648 49.746 128.57
49.312 128.414 48.941 c 128.258 48.57 128.02 48.277 127.699 48.062 c 127.383
47.848 126.973 47.738 126.48 47.738 c h
126.438 45.902 m 127.391 45.902 128.211 46.09 128.902 46.469 c 129.594
46.848 130.125 47.395 130.496 48.109 c 130.867 48.828 131.055 49.695 131.055
50.711 c 131.055 51.98 l 124.074 51.98 l 124.102 52.934 124.367 53.668
124.875 54.191 c 125.383 54.711 126.105 54.973 127.047 54.973 c 127.711
54.973 128.309 54.906 128.844 54.777 c 129.379 54.648 129.926 54.457 130.484
54.211 c 130.484 56.164 l 129.965 56.414 129.426 56.594 128.863 56.711
c 128.305 56.828 127.625 56.887 126.832 56.887 c 125.801 56.887 124.887
56.691 124.082 56.293 c 123.281 55.895 122.656 55.293 122.207 54.484 c 121.758
53.676 121.531 52.672 121.531 51.473 c 121.531 50.262 121.738 49.242 122.148
48.414 c 122.559 47.586 123.133 46.961 123.867 46.535 c 124.605 46.113
125.461 45.902 126.438 45.902 c f
117.656 4.066 m 118.855 4.066 119.789 4.371 120.453 4.984 c 121.117 5.598
121.453 6.586 121.453 7.957 c 121.453 14.855 l 118.988 14.855 l 118.988
8.465 l 118.988 7.656 118.828 7.055 118.508 6.656 c 118.188 6.258 117.695
6.059 117.031 6.059 c 116.043 6.059 115.363 6.371 115 6.996 c 114.633 7.625
114.453 8.523 114.453 9.695 c 114.453 14.855 l 111.969 14.855 l 111.969
4.262 l 113.883 4.262 l 114.238 5.688 l 114.355 5.688 l 114.59 5.324 114.875
5.02 115.215 4.777 c 115.555 4.539 115.926 4.359 116.34 4.242 c 116.75
4.125 117.188 4.066 117.656 4.066 c f
83.445 5.91 m 82.77 5.91 82.227 6.125 81.812 6.555 c 81.406 6.984 81.164
7.605 81.102 8.414 c 85.617 8.414 l 85.617 7.918 85.539 7.484 85.383 7.113
c 85.227 6.742 84.988 6.449 84.668 6.234 c 84.348 6.016 83.941 5.91 83.445
5.91 c h
83.406 4.07 m 84.359 4.07 85.18 4.262 85.871 4.641 c 86.562 5.016 87.094
5.566 87.465 6.281 c 87.836 7 88.02 7.863 88.02 8.883 c 88.02 10.152 l
81.043 10.152 l 81.066 11.105 81.336 11.84 81.844 12.363 c 82.352 12.883
83.074 13.145 84.012 13.145 c 84.68 13.145 85.277 13.078 85.812 12.949
c 86.348 12.816 86.895 12.629 87.457 12.383 c 87.457 14.336 l 86.934 14.582
86.391 14.766 85.832 14.883 c 85.27 15 84.594 15.059 83.797 15.059 c 82.77
15.059 81.852 14.859 81.051 14.465 c 80.25 14.066 79.625 13.461 79.176
12.656 c 78.727 11.848 78.5 10.844 78.5 9.645 c 78.5 8.434 78.707 7.414
79.117 6.586 c 79.527 5.758 80.102 5.133 80.836 4.707 c 81.574 4.285 82.43
4.07 83.406 4.07 c f
94.773 15.059 m 93.781 15.059 92.91 14.867 92.152 14.484 c 91.398 14.098
90.809 13.504 90.387 12.703 c 89.961 11.902 89.75 10.875 89.75 9.625 c
89.75 8.32 89.977 7.262 90.434 6.449 c 90.891 5.633 91.508 5.035 92.293
4.648 c 93.074 4.266 93.961 4.07 94.949 4.07 c 95.539 4.07 96.098 4.129
96.633 4.25 c 97.168 4.367 97.621 4.523 98 4.719 c 97.258 6.652 l 96.906
6.508 96.527 6.383 96.125 6.273 c 95.719 6.16 95.32 6.105 94.93 6.105 c
94.355 6.105 93.871 6.234 93.473 6.496 c 93.078 6.758 92.781 7.145 92.586
7.66 c 92.391 8.176 92.293 8.824 92.293 9.605 c 92.293 10.348 92.391 10.973
92.594 11.48 c 92.797 11.988 93.09 12.371 93.473 12.625 c 93.859 12.879
94.324 13.008 94.871 13.008 c 95.434 13.008 95.949 12.938 96.426 12.801
c 96.902 12.664 97.348 12.484 97.766 12.262 c 97.766 14.336 l 97.375 14.559
96.941 14.734 96.465 14.863 c 95.988 14.992 95.426 15.059 94.773 15.059
c f
102.5 3.504 m 102.5 3.961 102.488 4.375 102.461 4.746 c 102.434 5.117 102.41
5.422 102.383 5.656 c 102.52 5.656 l 102.742 5.289 103.016 4.996 103.34
4.766 c 103.668 4.539 104.027 4.367 104.426 4.25 c 104.824 4.129 105.238
4.07 105.668 4.07 c 106.465 4.07 107.148 4.211 107.719 4.484 c 108.293
4.758 108.734 5.176 109.039 5.742 c 109.348 6.312 109.5 7.051 109.5 7.961
c 109.5 14.863 l 107.016 14.863 l 107.016 8.473 l 107.016 7.664 106.859
7.059 106.547 6.664 c 106.234 6.266 105.746 6.066 105.082 6.066 c 104.43
6.066 103.914 6.211 103.539 6.496 c 103.16 6.785 102.891 7.195 102.734
7.727 c 102.578 8.262 102.5 8.922 102.5 9.703 c 102.5 14.863 l 100.016 14.863
l 100.016 0.004 l 102.5 0.004 l 102.5 3.504 l f
142.906 15.059 m 141.914 15.059 141.043 14.867 140.285 14.484 c 139.531
14.098 138.941 13.504 138.516 12.703 c 138.094 11.902 137.883 10.875 137.883
9.625 c 137.883 8.32 138.109 7.262 138.566 6.449 c 139.023 5.633 139.641
5.035 140.422 4.648 c 141.207 4.266 142.09 4.07 143.082 4.07 c 143.668
4.07 144.227 4.129 144.762 4.25 c 145.297 4.367 145.754 4.523 146.133 4.719
c 145.387 6.652 l 145.039 6.508 144.66 6.383 144.254 6.273 c 143.852 6.16
143.453 6.105 143.062 6.105 c 142.488 6.105 142.004 6.234 141.605 6.496
c 141.207 6.758 140.914 7.145 140.715 7.66 c 140.52 8.176 140.422 8.824
140.422 9.605 c 140.422 10.348 140.523 10.973 140.727 11.48 c 140.93 11.988
141.223 12.371 141.605 12.625 c 141.988 12.879 142.457 13.008 143.004 13.008
c 143.562 13.008 144.082 12.938 144.559 12.801 c 145.035 12.664 145.48
12.484 145.898 12.262 c 145.898 14.336 l 145.508 14.559 145.074 14.734 144.598
14.863 c 144.121 14.992 143.559 15.059 142.906 15.059 c f
136.566 11.812 m 136.566 12.492 136.402 13.07 136.078 13.555 c 135.754
14.035 135.27 14.406 134.633 14.668 c 133.992 14.93 133.195 15.059 132.246
15.059 c 131.504 15.059 130.852 15.008 130.293 14.902 c 129.73 14.797 129.211
14.637 128.727 14.414 c 128.727 12.301 l 129.25 12.551 129.824 12.754 130.457
12.918 c 131.09 13.082 131.672 13.164 132.207 13.164 c 132.91 13.164 133.422
13.059 133.73 12.852 c 134.047 12.641 134.203 12.363 134.203 12.008 c 134.203
11.789 134.133 11.59 133.996 11.414 c 133.859 11.238 133.609 11.059 133.254
10.875 c 132.895 10.691 132.391 10.473 131.738 10.211 c 131.086 9.949 130.535
9.688 130.086 9.418 c 129.637 9.152 129.293 8.828 129.059 8.441 c 128.824
8.059 128.707 7.578 128.707 7.004 c 128.707 6.055 129.086 5.328 129.84
4.824 c 130.598 4.324 131.594 4.07 132.832 4.07 c 133.5 4.07 134.121 4.137
134.699 4.27 c 135.281 4.398 135.848 4.594 136.41 4.855 c 135.668 6.613
l 135.184 6.406 134.691 6.234 134.18 6.094 c 133.672 5.957 133.203 5.891
132.773 5.891 c 132.227 5.891 131.805 5.977 131.512 6.145 c 131.219 6.312
131.074 6.547 131.074 6.848 c 131.074 7.082 131.145 7.281 131.289 7.445
c 131.43 7.609 131.684 7.773 132.051 7.941 c 132.418 8.113 132.922 8.32
133.578 8.57 c 134.215 8.816 134.758 9.078 135.207 9.352 c 135.656 9.625
135.996 9.953 136.223 10.34 c 136.453 10.723 136.566 11.215 136.566 11.812
c f
150.633 3.504 m 150.633 3.961 150.621 4.375 150.594 4.746 c 150.566 5.117
150.543 5.422 150.516 5.656 c 150.652 5.656 l 150.875 5.289 151.148 4.996
151.473 4.766 c 151.801 4.539 152.164 4.367 152.559 4.25 c 152.957 4.129
153.371 4.07 153.801 4.07 c 154.594 4.07 155.281 4.211 155.852 4.484 c
156.426 4.758 156.867 5.176 157.172 5.742 c 157.48 6.312 157.633 7.051 157.633
7.961 c 157.633 14.863 l 155.148 14.863 l 155.148 8.473 l 155.148 7.664
154.992 7.059 154.68 6.664 c 154.367 6.266 153.879 6.066 153.215 6.066
c 152.562 6.066 152.047 6.211 151.672 6.496 c 151.293 6.785 151.023 7.195
150.867 7.727 c 150.711 8.262 150.633 8.922 150.633 9.703 c 150.633 14.863
l 148.148 14.863 l 148.148 0.004 l 150.633 0.004 l 150.633 3.504 l f
164.605 5.91 m 163.926 5.91 163.383 6.125 162.973 6.555 c 162.562 6.984
162.324 7.605 162.258 8.414 c 166.773 8.414 l 166.773 7.918 166.695 7.484
166.543 7.113 c 166.383 6.742 166.145 6.449 165.828 6.234 c 165.508 6.016
165.102 5.91 164.605 5.91 c h
164.566 4.07 m 165.516 4.07 166.34 4.262 167.027 4.641 c 167.719 5.016
168.25 5.566 168.625 6.281 c 168.996 7 169.18 7.863 169.18 8.883 c 169.18
10.152 l 162.199 10.152 l 162.227 11.105 162.496 11.84 163.004 12.363 c
163.512 12.883 164.234 13.145 165.172 13.145 c 165.836 13.145 166.438 13.078
166.969 12.949 c 167.504 12.816 168.051 12.629 168.613 12.383 c 168.613
14.336 l 168.09 14.582 167.551 14.766 166.988 14.883 c 166.43 15 165.754
15.059 164.957 15.059 c 163.926 15.059 163.012 14.859 162.211 14.465 c
161.41 14.066 160.781 13.461 160.336 12.656 c 159.883 11.848 159.66 10.844
159.66 9.645 c 159.66 8.434 159.863 7.414 160.273 6.586 c 160.684 5.758
161.258 5.133 161.996 4.707 c 162.73 4.285 163.59 4.07 164.566 4.07 c f
74.738 14.863 m 72.215 14.863 l 72.215 3.035 l 67.879 3.035 l 67.879 0.906
l 79.07 0.906 l 79.07 3.035 l 74.738 3.035 l 74.738 14.863 l f
126.406 4.262 m 126.406 14.855 l 123.922 14.855 l 123.922 4.262 l h
125.195 0.156 m 125.559 0.156 125.879 0.254 126.152 0.449 c 126.426 0.645
126.562 0.984 126.562 1.465 c 126.562 1.934 126.426 2.27 126.152 2.473
c 125.879 2.676 125.559 2.773 125.195 2.773 c 124.805 2.773 124.473 2.676
124.207 2.473 c 123.941 2.27 123.805 1.934 123.805 1.465 c 123.805 0.984
123.941 0.645 124.207 0.449 c 124.473 0.254 124.805 0.156 125.195 0.156
c f
Q Q
showpage
%%Trailer
end
%%EOF
\end{filecontents}
% #endregion

% -----------------------------------------------------------------------------


