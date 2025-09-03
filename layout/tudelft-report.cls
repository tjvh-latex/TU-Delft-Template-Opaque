% This class provides an unofficial alternative to the original TU Delft
% template for reports. It features a redesigned cover page and a
% rewritten class file for easier customization.
%
% Rewritten template by Daan Zwaneveld (dzwaneveld.github.io). Original
% template by TU Delft (https://www.tudelft.nl/huisstijl/downloads/).
%
% Rewritten again by Thomas van Haarst (github.com/tjvh-latex and github.com/TJVH0304).
% My edits provide extra functionality (such as minipages and listings), and fix loads of 
% errors (0 errors is easily possible now), resulting in faster compilation. Subfiles are also 
% supported for fast compilation.
%
% This template is available under CC BY-NC 4.0. For more information,
% see https://creativecommons.org/licenses/by-nc/4.0/. No attribution
% is required in reports created using this template.

%% Class is based on the default book class and options will be passed
%\ProvidesClass{layout/tudelft-aiaa}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/tudelft-report}[12-03-2023 v2.0 TU Delft Report Class]

\newif\ifnotitle
\DeclareOption{notitle}{\notitletrue}

\newif\ifmaxpagedisplay
\DeclareOption{maxpagedisplay}{\maxpagedisplaytrue}

\newif\ifhidetodos
\DeclareOption{hidetodos}{\hidetodostrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[10pt,oneside]{book}

%% Main packages in the document
\RequirePackage{silence}
\WarningsOff[transparent]
\WarningsOff[typearea]
\WarningsOff[microtype]

\RequirePackage{amsmath}    % Mathematics
\RequirePackage{amssymb}    % Symbols
\RequirePackage{siunitx}    % Various functions, e.g. \num{}

\RequirePackage{tabularx}   % Additional functions to tables
\RequirePackage{booktabs}   % Adds more line functionality to tables
\RequirePackage{longtable}  % Lets tables break over page
\RequirePackage{multirow}   % Counterpart of multi columns
\RequirePackage{enumitem}   % Customise the list spacing

\RequirePackage{geometry}   % Document geometry
\RequirePackage{titlesec}   % Custom titles
\RequirePackage{titletoc}   % Custom table of contents
\RequirePackage{fancyhdr}   % Custom header/footer
\RequirePackage[pdfusetitle, colorlinks=true, citecolor=cyan, urlcolor=cyan, linkcolor=black]{hyperref} % Improved referencing/links
\RequirePackage{comment}
\RequirePackage{graphicx}   % Adding images
\RequirePackage{float}      % Additional float parameters
\RequirePackage[labelfont=bf,justification=centering,footnotesize]{caption} % Captions
\RequirePackage{subcaption} % Subfigures and subcaptions
\RequirePackage{xcolor}     % Using colours in documents
\RequirePackage{tikz}       % Create graphic elements
\RequirePackage{ragged2e}

% -> BibLaTeX moved to report.tex ->
\RequirePackage{datetime}   % Used in preface for monthname
\RequirePackage{microtype}  % Refinements towards typographical perfection
\RequirePackage[nottoc]{tocbibind} % Add the lists to the table of contents
\RequirePackage{xspace}     % Ensures correct spacing after macros like \deg
\RequirePackage{etoolbox}   % General toolbox (e.g. \ifdefvoid)

\RequirePackage{inputenc} % Standard, process non-ASCII input

% Removing biblatex
\RequirePackage[sorting=none, url=false, giveninits=true, doi=false]{biblatex} % Generate bibliography
\DeclareNameAlias{default}{family-given}
% --- after \usepackage[...]{biblatex} ---
\AtEveryBibitem{%
  \clearfield{language}%  remove the language field
  \clearlist{language}%   (for some styles, language is in a list)
}
\addbibresource{references.bib}
\addbibresource{references2.bib} % Set resource file
%\RequirePackage[sort&compress,numbers]{natbib}


%\setlength\bibitemsep{0pt} % Decrease space between items
\RequirePackage{float} % Floats
\RequirePackage{graphicx} % Images
\RequirePackage{hyperref} % Referencing
\graphicspath{ {./images/} } % Set images folder
\RequirePackage{amsmath} % Math
\RequirePackage[english]{babel} % Languages support
\RequirePackage{booktabs} % Table functionality
\RequirePackage{caption} % Captioning
\RequirePackage{nomencl} % Nomenclature commands
\makenomenclature
\RequirePackage{xurl} % URL's
\RequirePackage{parskip} % Removes indents on new paragraphs and adds a line spacing instead
\RequirePackage{pdfpages} % Input pdf's (e.g. for technical drawings)
\RequirePackage{fvextra}
\RequirePackage{csquotes} % Correct quotes with biblatex
\RequirePackage{mwe} % Adds minipage functionality
\ifhidetodos
    \RequirePackage[disable]{todonotes}
\else
    \RequirePackage[colorinlistoftodos]{todonotes} % Adds to-do notes
\fi
\RequirePackage{listings} % Adds listings
\RequirePackage{lipsum}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{minted}
\RequirePackage{longtable}
\RequirePackage{ltablex}
\RequirePackage{wrapfig}
\RequirePackage{array}
\RequirePackage{xltabular}
\RequirePackage{subfiles}
\RequirePackage{svg}
\RequirePackage{pdflscape}
\RequirePackage{comment}
\RequirePackage{afterpage}
\RequirePackage{typearea}

\RequirePackage{ifpdf}
\ifpdf
  \RequirePackage{transparent}
\fi

%%%%% 1. General Definitions for the Document and Bibliography %%%%%

%% Commands to define the title, author, etc
\renewcommand{\title}[1]{%
    \def\@title{#1}%
    \hypersetup{pdftitle=#1}} % Adding to metadata

\renewcommand*{\author}[2][]{%
    \def\@author{#2}%
    \def\@author@short{#1}%
    \hypersetup{pdfauthor=\ifdefvoid{\@author@short}{#2}{#1}}} % Adding to metadata

\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
% \newcommand*\coveraddition[1]{\def\@cover@addition{#1}}
\newcommand\subject[1]{\def\@subject{#1}}

%%TU Delft house style colours
\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-gray}{cmyk}{0,0,0,0.8}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-darkblue}{cmyk}{1.00,0.80,0.08,0.70}      % #0C2340
\definecolor{tudelft-turquoise}{cmyk}{0.72,0.00,0.24,0.00}     % #00B8C8
\definecolor{tudelft-royalblue}{cmyk}{0.98,0.40,0.00,0.00}     % #0076C2
\definecolor{tudelft-purple}{cmyk}{0.65,1.00,0.00,0.12}        % #6F1D77
\definecolor{tudelft-pink}{cmyk}{0.00,0.70,0.00,0.00}          % #EF60A3
\definecolor{tudelft-bordeaux}{cmyk}{0.05,1.00,0.48,0.30}      % #A50034
\definecolor{tudelft-red}{cmyk}{0.00,0.85,0.75,0.00}           % #E03C31
\definecolor{tudelft-orange}{cmyk}{0.00,0.70,0.75,0.00}        % #EC6842
\definecolor{tudelft-yellow}{cmyk}{0.00,0.31,0.98,0.00}        % #FFB81C
\definecolor{tudelft-green}{cmyk}{0.63,0.00,0.84,0.00}         % #6CC24A
\definecolor{tudelft-forestgreen}{cmyk}{1.00,0.00,0.68,0.04}   % #009B77
\definecolor{tudelft-darkgray}{cmyk}{0.00,0.00,0.00,0.80}      % #5C5C5C

\newcommand{\colorblock}[2][1em]{%
  \textcolor{#2}{\rule{#1}{#1}}%
}

%% Scaling the margins to be slightly smaller than default (.7)
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% Reducing white space in lists slightly (both enumerate and itemize)
\setlist{itemsep=-2pt}

%% Setting up \autoref to use uppercase
\def\sectionautorefname{Section}
\def\chapterautorefname{Chapter}
\let\subsectionautorefname\sectionautorefname
\let\subsubsectionautorefname\sectionautorefname

%%%%% 2. Loading all the Fonts (Supports pdfLaTeX, XeLaTeX and LuaLaTeX) %%%%%

\RequirePackage{iftex} % Adds if-else statements to support multiple compilers

\ifPDFTeX
    %% pdfLaTeX is only available for compatibility, but not recommended.
    \RequirePackage[T1]{fontenc} % Fixes possible encoding issues

    %% Defining commands to be used in layout
    \renewcommand{\rmdefault}{phv}
    \renewcommand{\sfdefault}{phv}
    \def\largetitlestyle{}
    \def\titlestyle{}

    %% Warning when using pdfLaTeX
    \@latex@warning@no@line{You are using pdfLaTeX as compiler. Consider changing the compiler to XeLaTeX or LuaLaTeX to adhere to the TU Delft house style}
\else
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the TU Delft house style fonts are used
    \RequirePackage{fontspec} % Custom fonts

    %% Adding the various fonts
    \setmainfont{Times New Roman}
    \setmathsf{Times New Roman}
    \setmathtt{Times New Roman}

    \newfontfamily\tudtitlefamily{Times New Roman}
    \newfontfamily\quotefont{Times New Roman}

    %% Defining commands to be used in layout
    \def\largetitlestyle{\tudtitlefamily}
    \def\titlestyle{\normalfont}

    %% Changing the quote environment to use Georgia
    \AtBeginEnvironment{quote}{\quotefont}
\fi

%%%%% 3. Adjusting the Titles in Text and Table of Contents %%%%%

%% Formatting chapter titles and spacing
\titleformat{\chapter}
    {\flushleft}
    {\fontsize{24}{24}\selectfont\largetitlestyle\bfseries\thechapter\;}
    {0pt}
    {\Huge\titlestyle\bfseries}
\titlespacing*{\chapter}{0pt}{0pt}{0pt}

%% Formatting section titles and spacing
\titleformat{\section}
    {\Large\titlestyle\bfseries}
    {\thesection.}
    {5pt}
    {}
\titlespacing*{\section}{0pt}{0.5\baselineskip}{0pt}

%% Formatting subsections titles and spacing
\titleformat{\subsection}
    {\large\titlestyle\bfseries}
    {\thesubsection.}
    {5pt}
    {}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0pt}

%% Formatting subsubsections titles and spacing
\titleformat{\subsubsection}
    {\titlestyle\bfseries}
    {}
    {0pt}
    {}
\titlespacing*{\subsubsection}{0pt}{0.5\bigskipamount}{0pt}

%% Changing font and spacing in the table of contents
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlestyle\bfseries}{1.5em}{0pc}
\dottedcontents{section}[3.8em]{\titlestyle}{2.3em} {8pt}
\dottedcontents{subsection}[7em]{\titlestyle}{3.2em}{8pt}

%% Changing table of contents depth
\setcounter{tocdepth}{1}


%%%%% 4. Adjusting the Header and Footer %%%%%

%% Adding a head rule to pages
\renewcommand*\headrule{%
    {\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth}

%% Page style for title pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \fancyfoot[C]{\thepage}}

%% Fancy style for the main matter, depends on oneside/twoside option
\if@twoside%
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Clears empty pages
\else%
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    % \fancyhead[C]{
    % \begin{minipage}{0.05\linewidth}
    %     \centering
    %     % \includegraphics[width=0.5cm]{figures/covers/H2GOMissionPatch.png}
    %     % \includegraphics[width=0.5cm]{figures/cats/cat.png}
    % \end{minipage}
    % }
    \fancyhead[L]{\titlestyle\nouppercase{\leftmark}}
\fi

\pagestyle{fancy} % Setting it to default

%%%%% 5. Cover Page %%%%%

\newcommand*\makecover{
    % Clearing the page and removing page number
    \clearpage
    \thispagestyle{empty}

    %% Use the Tikz library positioning
    \usetikzlibrary{positioning}

    % Defining where everything needs to go
    \begin{tikzpicture}[overlay,remember picture]

    \node[above=0,inner sep=0] at (current page.south) {\includegraphics[width=1.1\paperwidth]{\@cover@image}};

    \node[rotate=90,below right=4cm and .3cm] at (current page.west) {%
        \titlestyle\color{white} Delft University of Technology};

    \node[above right=0.2cm and 0.6cm] at (current page.south west) {%
        \includegraphics[width=0.35\linewidth]{layout/tudelft/logo-white.pdf}};

    \node[below=2cm,fill=tudelft-black,minimum width={\paperwidth},inner ysep=25pt,opacity=0.7,text opacity=1] at (current page.north) {%
        \begin{minipage}{0.9\paperwidth}
            \largetitlestyle\fontsize{50}{50}\selectfont\color{title}\@title \\[0.5ex]
            \ifdefvoid{\@subtitle}{}{\titlestyle\fontsize{22}{22}\selectfont\color{white}\@subtitle \\[2.5ex]}
            \ifdefvoid{\@subject}{}{\titlestyle\fontsize{22}{22}\selectfont\color{white}\@subject \\[0.5ex]}
            \largetitlestyle\fontsize{24}{24}\selectfont\color{white}\@author
        \end{minipage}};

    \end{tikzpicture}

    \pagebreak
    \begin{center}
    \topskip0pt
    \vspace*{\fill}
    This page is intentionally left blank
    \vspace*{\fill}
    \end{center}
    \pagebreak

    \ifnotitle
    \else
        \input{frontmatter/FM0_Title}
    \fi
    \newpage
}

% Used to give an error when we exceed the page limit
\RequirePackage{refcount}
\RequirePackage{zref-user,zref-abspage}
\newcounter{pagespancheck}

\newcommand{\markpage}[1]{%
  \zlabel{#1}%
}

\newcommand{\checkpagespan}[3]{% #1=start, #2=end, #3=max pages
  \setcounter{pagespancheck}{\zref@extractdefault{#2}{abspage}{0}}%
  \addtocounter{pagespancheck}{-\zref@extractdefault{#1}{abspage}{0}}%
  \addtocounter{pagespancheck}{1}%
  \typeout{DEBUG: Page span = \arabic{pagespancheck} pages.}%
  \ifnum\value{pagespancheck}>#3
    \PackageError{PageCheck}{FUCK YOU YOU WENT OVER THE PAGE LIMIT AAAAHHHHH}{you better fix it real quick}
  \fi
}

\ifmaxpagedisplay
    \newcommand{\maxpages}[1]{\textit{\textcolor{teal}{Maximum number of pages: #1}}\\}
\else
    \newcommand{\maxpages}[1]{}
\fi

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

\input{commands}
\input{layout/preamble}
\renewcommand{\deg}{\si{\degree}\xspace} % Correct spacing after degree sign
\allowdisplaybreaks

\AtBeginDocument{
    \justifying
    \setlength{\parindent}{0pt}
%    \raggedright
    \setuptodonotes{inline}
    \renewcommand\nomgroup[1]{%
  \item[\bfseries
  \ifstrequal{#1}{A}{Abbreviations}{%
  \ifstrequal{#1}{C}{Constants}{%
  \ifstrequal{#1}{R}{Roman Symbols}{%
  \ifstrequal{#1}{G}{Greek Symbols}{%
  \ifstrequal{#1}{S}{Subscripts}{
  \ifstrequal{#1}{O}{Other Symbols}{}}}}}}%
]}


%----------------------------------------------
\newcommand{\nomunit}[1]{%
\renewcommand{\nomentryend}{\hspace*{\fill}#1}}
%----------------------------------------------

\renewcommand{\nompreamble}{\begin{multicols}{2}}
\renewcommand{\nompostamble}{\end{multicols}}
\setlength{\columnsep}{3em}

\renewcommand{\thefootnote}{\textcolor{cyan}{\arabic{footnote}}}
\sisetup{group-separator={}}
\sisetup{parse-numbers=true}
\sisetup{round-mode=places,
round-precision=3,
retain-unity-mantissa=false,
zero-decimal-to-integer=true,
minimum-integer-digits=1,
round-pad=false
}   

\DeclareSIUnit\bar{bar}
\DeclareSIUnit{\g}{\ensuremath{g}}
\DeclareSIUnit{\rad}{rad}
\DeclareSIUnit{\usd}{US\$}
\DeclareSIUnit{\ton}{\tonne}
\DeclareSIUnit{\bit}{b}
\DeclareSIUnit{\kbps}{Kbps}
\DeclareSIUnit{\kgcotwoeq}{\kilogram CO\textsubscript{2}e}
\DeclareSIUnit{\euro}{€}
}
