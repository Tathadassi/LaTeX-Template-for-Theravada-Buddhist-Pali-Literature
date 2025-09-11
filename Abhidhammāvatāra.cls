% Abhidhammāvatāra Class Document
% Professional Typesetting Template for Theravada Buddhist Abhidhamma Literature Translation and Commentary

% Version: 1.0 (2025)
% Author: Gunodaya Bhikkhu
% Description: A professional typesetting template for Theravada Abhidhamma literature translation and commentary.
% Features: Supports multilingual typesetting (Pali, Burmese, Chinese), academic annotation systems, terminology management.

% IMPORTANT COMPILATION NOTE: MUST be compiled with LuaLaTeX (due to complex scripts).
% File Encoding: UTF-8
% !Mode:: "TeX:UTF-8"

\NeedsTeXFormat{LaTeX2e} % Declare required LaTeX version
\ProvidesClass{Abhidhammāvatāra} % Define class name: Abhidhammāvatāra
\LoadClass[12pt]{book} % Based on book class, 12pt font size

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of Contents (for this preamble)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. PDF Metadata & Hyperlink Setup
% 2. Document Structure & Hierarchy Setup
% 3. Page Layout & Formatting
% 4. Fonts & Multilingual Support
% 5. Essential Package Loading
% 6. Academic Annotation System
%   6.1 Annotation System Overview
%   6.2 Source Identification Commands
%   6.3 Grammatical Analysis Commands
%   6.4 Inline Notes
%   6.5 End Notes (Commentary)
%   6.6 Footnotes
%   6.7 Margin Notes
% 7. Terminology Management System
% 8. Other Custom Settings
% 9. Alternative / Backup Settings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. PDF Metadata & Hyperlink Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{hyperref} % Load hyperref package for PDF bookmarks and cross-referencing links

% PDF document properties and hyperlink style configuration
\hypersetup{%
    bookmarksopen=true, % Expand bookmarks by default in PDF viewer
    bookmarksnumbered=true, % Show chapter numbers in bookmarks
    bookmarksopenlevel=1, % Expand to level 1 (Part) by default
    unicode=true, % Enable Unicode support for special characters
    % Link styling
    breaklinks=true, % Allow link text to break across lines
    colorlinks=true, % Use colored text for links instead of boxes
    citecolor=black, % Color for citation links: black
    linkcolor=red, % Color for internal cross-reference links: red
    % PDF metadata
    pdftitle={Abhidhammāvatāra}, % Document title
    pdfauthor={Gunodaya Bhikkhu}, % Author updated
    pdfkeywords={Pali Canon, Abhidhamma, Atthakatha, Tika, Translation, Commentary}, % Keywords
    pdfstartview=Fit, % Initial view mode: Fit Page
    pdfsubject={Theravada Buddhism}, % Document subject
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Document Structure & Hierarchy Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Chapter formatting setup
\newcommand{\chapterformat}{\Huge\bfseries\centering}
\newcommand{\sectionformat}{\Large\bfseries\centering}
\newcommand{\subsectionformat}{\large\bfseries}
\newcommand{\subsubsectionformat}{\large\bfseries}
\newcommand{\paragraphformat}{\normalsize\bfseries}
\newcommand{\subparagraphformat}{\normalsize\bfseries}

% Renew chapter commands for consistent formatting
\renewcommand{\chaptername}{Chapter}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

% Set title numbering depth: down to subsection level (1.1.1)
\setcounter{secnumdepth}{2}

% Header setup
\renewcommand{\sectionmark}[1]{\markright{\thesection\quad #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Page Layout & Formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3.1 Page Layout - Standard 16mo book size
\usepackage[paperheight=260mm, paperwidth=185mm, % Page size: 260mm × 185mm
            top=3cm, bottom=3cm, % Top/Bottom margins: 3cm
            outer=3cm, inner=3cm, % Outer/Inner margins: 3cm (symmetric layout)
            heightrounded, marginparsep=1cm]{geometry} % Round height, marginpar separation 1cm

% 3.2 Typesetting micro-adjustments
\sloppy % Enable relaxed alignment to avoid overfull hboxes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Fonts & Multilingual Support
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.1 Multilingual Support
\usepackage{babel} % Load babel package for language-specific hyphenation and rules
\usepackage{fontspec} % Load fontspec for OpenType/TrueType font management

% Set main Latin font
\setmainfont{Times New Roman}
\babelfont[latin]{rm}{Times New Roman}

% Redefine the entire font family to use regular font for italics
\setmainfont{Times New Roman}[
    ItalicFont = Times New Roman,    % Use regular font for italic
    BoldItalicFont = Times New Roman Bold, % Use bold font for bold italic
    SlantedFont = Times New Roman,   % Use regular font for slanted
    BoldSlantedFont = Times New Roman Bold % Use bold font for bold slanted
]

% Optional: Set different color for emphasized text instead of italics
\renewcommand{\emph}[1]{\textcolor{blue}{#1}}

% Set Burmese font
\babelfont[burmese]{rm}[Renderer=Harfbuzz]{Padauk}

% Define automatic language switching rules
\babelprovide[import, onchar=ids fonts]{burmese}
\babelprovide[import, onchar=ids fonts]{latin}

% Chinese language support
\babelprovide[import, language=Chinese, onchar=ids fonts]{chinese}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Essential Package Loading
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5.1 Basic Functionality
\usepackage{pdfpages} % Insert external PDF pages
\usepackage[rgb]{xcolor} % Color support using RGB model
\usepackage{amsmath} % Enhanced math typesetting
\usepackage{verbatim} % Comment environment for ignoring LaTeX code
\usepackage{xspace} % Smart space handling after commands
\usepackage{makeidx} % Index generation support
\usepackage{fancyhdr} % Custom headers and footers
\usepackage{emptypage} % Blank pages have no headers/footers

% 5.2 Table-related packages
\usepackage{diagbox} % Diagonal lines in table cells
\usepackage{multirow} % Multi-row cells in tables
\usepackage{makecell} % Line breaks and formatting within table cells
\usepackage{booktabs} % Professional quality table rules
\usepackage{arydshln} % Dashed lines in tables and arrays

% 5.3 List & Enumeration packages
\usepackage{enumitem} % Enhanced list environments and spacing

% 5.4 Annotation packages
\usepackage{marginnote} % Margin notes
\usepackage{postnotes} % End notes (collected at chapter end)

% 5.5 Drawing packages
\usepackage{tikz} % Vector graphics creation
\usetikzlibrary{graphs} % Graph drawing library
\usetikzlibrary{quotes} % Labeled quotes for graphs

% 5.6 Bibliography & Citation packages
% Using standard author-title citation style
\usepackage[backend=biber,
            style=authortitle,
            sorting=nyt]{biblatex}

% 5.7 Cross-referencing packages
\usepackage{nameref} % Reference by name/label, not just number

% 5.8 Multi-file compilation packages
\usepackage{subfiles} % Support for splitting document into subfiles
\usepackage[subpreambles=true]{standalone} % Allow subfiles to be compiled independently
\usepackage{import} % Support for importing external files and code

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Academic Annotation System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6.1 Annotation System Overview
% Four content levels:
% - Canon: Original text and translation of the Tipitaka (Canonical Texts)
% - Commentary: Original text and translation of the Atthakatha (Commentaries)
% - Subcommentary: Original text and translation of the Tika (Subcommentaries)
% - Other: Original text and translation of other non-commentarial literature
%
% Four positional types:
% - Inline Notes: Short notes within the line
% - End Notes: Detailed notes at chapter end (Annotations/Exegesis)
% - Footnotes: Brief notes at page bottom
% - Margin Notes: Short notes in the page margin

% 6.2 Source Identification Commands
% Canon command: Tipitaka identification
\DeclareDocumentCommand\canon{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{Canon}}% % Just display "Canon" (emphatic use)
    {\textbf{Canon: }\sacredtext{#2}}% % Display "Canon: " + Sacred text/translation
}

% Commentary command: Atthakatha identification
\DeclareDocumentCommand\commentary{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{Commentary}}% % Just display "Commentary"
    {\textbf{Commentary: }< #2 >}% % Display "Commentary: " + 〈Commentary text/translation〉
}

% Subcommentary command: Tika identification
\DeclareDocumentCommand\subcommentary{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{Subcomm.}}% % Just display "Subcomm."
    {\textbf{Subcomm.: }\{#2\}}% % Display "Subcomm.: " + 〔Subcommentary text/translation〕
}

% Other command: Non-commentarial literature identification
\DeclareDocumentCommand\othertext{s m}
{%
    \IfBooleanTF{#1}
    {\textbf{Other}}% % Just display "Other"
    {\textbf{Other: }[#2]}% % Display "Other: " + ［Other text］
}

% Related commands
\newcommand{\sacredtext}[1]{\textbf{#1}} % Sacred text format: Bold
\newcommand{\conjmark}{\colorbox[gray]{0.85}{Conj.}\space} % Conjunction marker
\newcommand{\conjunction}[1]{\footnote{\conjmark #1}} % Conjunction note
\newcommand{\rulemark}{\colorbox[gray]{0.85}{Rule}\space} % Rule marker
\newcommand{\annotmark}{\colorbox[gray]{0.85}{\textbf{Annot.}}\space} % Annotation marker
\newcommand{\proofmark}{\colorbox[gray]{0.85}{\textbf{Proof}}\space} % Proof marker

% 6.3 Grammatical Analysis Commands
% Pali grammatical symbol command system

% Root command (dhatu - checkmark symbol)
\NewDocumentCommand\dhatu{m o}
{%
    \IfNoValueTF{#2}%
    {$\surd$#1}% % No note: Just √ symbol and text
    {$\surd$#1\inlinenote[]{#2}}% % With note: √ symbol, text, and blue note
}

% Stem/Noun base command (linga - triangle symbol)
\NewDocumentCommand\stem{m o}
{%
    \IfNoValueTF{#2}%
    {$\triangle$#1}% % No note: Just △ symbol and text
    {$\triangle$#1\inlinenote[]{#2}}% % With note: △ symbol, text, and blue note
}

% Suffix/affix command (paccaya - asterisk symbol)
\NewDocumentCommand\affix{m o}
{%
    \IfNoValueTF{#2}%
    {\textasteriskcentered #1}% % No note: Just * symbol and text
    {\textasteriskcentered #1\inlinenote[]{#2}}% % With note: * symbol, text, and blue note
}

% Inflection/ending command (vibhatti - @ symbol)
\NewDocumentCommand\ending{m o}
{%
    \IfNoValueTF{#2}%
    {$@$#1}% % No note: Just @ symbol and text
    {$@$#1\inlinenote[]{#2}}% % With note: @ symbol, text, and blue note
}

% Word form command (pada - circled dot symbol): Represents complete word form
\NewDocumentCommand\word{m o}
{%
    \IfNoValueTF{#2}%
    {$\odot$#1}% % No note: Just ⊙ symbol and text
    {$\odot$#1\inlinenote[]{#2}}% % With note: ⊙ symbol, text, and blue note
}

% ==================== Regular Word Formation Analysis ====================

% Basic kitabasic analysis: △Stem = √Root + *Affix
\NewDocumentCommand{\kitabasic}{m o m o m o}{%
    \stem{#1}% % Display stem symbol and text
    \IfValueT{#2}{\inlinenote{#2}}% % If stem note exists, show blue note
    \ =\ \root{#3}% % Equals sign followed by root symbol and text
    \IfValueT{#4}{\inlinenote{#4}}% % If root note exists, show blue note
    \ +\ \affix{#5}% % Plus sign followed by affix symbol and text
    \IfValueT{#6}{\inlinenote{#6}}% % If affix note exists, show blue note
}

% Full kitafull analysis
\NewDocumentCommand{\kitafull}{s m o m o m o m o}{%
    \stem{#2}% % Display result stem symbol and text
    \IfValueT{#3}{\inlinenote{#3}}% % If result stem note exists, show blue note
    \ =\ % % Display equals sign
    \IfBooleanTF{#1}
    {% Star mode: △ = √ + * + * (two affixes)
        \root{#4}% % Display root symbol and text
        \IfValueT{#5}{\inlinenote{#5}}% % If root note exists, show blue note
        \ +\ % % Display plus sign
        \affix{#6}% % Display secondary affix symbol and text
        \IfValueT{#7}{\inlinenote{#7}}% % If secondary affix note exists, show blue note
        \ +\ % % Display plus sign
        \affix{#8}% % Display primary affix symbol and text
        \IfValueT{#9}{\inlinenote{#9}}% % If primary affix note exists, show blue note
    }
    {% No star mode: △ = △ + √ + * (Stem + Root + Affix)
        \stem{#4}% % Display previous stem symbol and text
        \IfValueT{#5}{\inlinenote{#5}}% % If previous stem note exists, show blue note
        \ +\ \root{#6}% % Display root symbol and text
        \IfValueT{#7}{\inlinenote{#7}}% % If root note exists, show blue note
        \ +\ \affix{#8}% % Display affix symbol and text
        \IfValueT{#9}{\inlinenote{#9}}% % If affix note exists, show blue note
    }%
}

% Taddhita analysis
\NewDocumentCommand{\taddhita}{m o m o m o}{%
    \stem{#1}% % Display result stem symbol and text
    \IfValueT{#2}{\inlinenote{#2}}% % If result stem note exists, show blue note
    \ =\ \stem{#3}% % Equals sign followed by base stem symbol and text
    \IfValueT{#4}{\inlinenote{#4}}% % If base stem note exists, show blue note
    \ +\ \affix{#5}% % Plus sign followed by affix symbol and text
    \IfValueT{#6}{\inlinenote{#6}}% % If affix note exists, show blue note
}

% Samasa analysis
\NewDocumentCommand{\samasa}{m o m o m o}{%
    \stem{#1}% % Display compound stem symbol and text
    \IfValueT{#2}{\inlinenote{#2}}% % If compound stem note exists, show blue note
    \ =\ \stem{#3}% % Equals sign followed by stem1 symbol and text
    \IfValueT{#4}{\inlinenote{#4}}% % If stem1 note exists, show blue note
    \ +\ \stem{#5}% % Plus sign followed by stem2 symbol and text
    \IfValueT{#6}{\inlinenote{#6}}% % If stem2 note exists, show blue note
}

% ==================== Regular Inflected Word Analysis ====================

% Noun analysis: ⊙Noun = △Stem + @Ending
\NewDocumentCommand{\noun}{m o m o m o}{%
    \word{#1}% % Display noun symbol and text
    \IfValueT{#2}{\inlinenote{#2}}% % If noun note exists, show blue note
    \ =\ \stem{#3}% % Equals sign followed by stem symbol and text
    \IfValueT{#4}{\inlinenote{#4}}% % If stem note exists, show blue note
    \ +\ \ending{#5}% % Plus sign followed by ending symbol and text
    \IfValueT{#6}{\inlinenote{#6}}% % If ending note exists, show blue note
}

% Verb analysis: ⊙Verb = √Root + *Affix + @Ending
\NewDocumentCommand{\verbform}{m o m o m o m o}{%
    \word{#1}% % Display verb symbol and text
    \IfValueT{#2}{\inlinenote{#2}}% % If verb note exists, show blue note
    \ =\ \root{#3}% % Equals sign followed by root symbol and text
    \IfValueT{#4}{\inlinenote{#4}}% % If root note exists, show blue note
    \ +\ \affix{#5}% % Plus sign followed by affix symbol and text
    \IfValueT{#6}{\inlinenote{#6}}% % If affix note exists, show blue note
    \ +\ \ending{#7}% % Plus sign followed by ending symbol and text
    \IfValueT{#8}{\inlinenote{#8}}% % If ending note exists, show blue note
}

% 6.4 Inline Notes System - For short notes within the line
\NewDocumentCommand\inlinenote{s o m}
{%
    \IfBooleanTF{#1}
    {% Star mode
        \IfNoValueTF{#2}%
        {{\tiny\textcolor{blue}{〈#3〉}}\normalsize}% % 〈Commentary〉 format
        {{\tiny\textcolor{blue}{〔#3〕}}\normalsize}% % 〔Subcomm.〕 format
    }%
    {{\tiny\textcolor{blue}{［#3］}}\normalsize}% % ［Other］ format
}

% 6.5 End Notes System - For detailed notes at chapter end (Exegesis)
\newlist{postnotelist}{enumerate}{1}
\setlist[postnotelist,1]{%
    labelwidth = 2em,
    itemindent = 0pt,
    labelindent = 0pt,
    labelsep = 0pt,
    leftmargin = !,
    align = left
}

% End note format details
\postnotesetup{%
    listenv = postnotelist,
    postprintnote = (p.~\pnthepage),
    maketextmark = {#2\textbf{#1}~#3}
}

% End note header format
\postnotesetup{
    heading = {%
        \section*{\pntitle}
        \markboth{\mypnheaderleft}{\mypnheaderright}%
    },
}

% Left page header content
\ExplSyntaxOn
\NewDocumentCommand \mypnheaderleft {}
{
    \arabic{chapter}\quad \Chaptername
}
\ExplSyntaxOff

% Right page header content
\ExplSyntaxOn
\NewDocumentCommand \mypnheaderright {}
{
    \tl_if_eq:NNTF \pnhdpagefirst \pnhdpagelast
    {Commentary}
    {Commentary}
}
\ExplSyntaxOff

% End note numbering: Reset per chapter
\counterwithin*{postnote}{chapter}

% End note number format
\makeatletter
\renewcommand{\@makefnmark}{\makebox{\normalfont(\@thefnmark)\space}}
\makeatother
\renewcommand\thepostnote{[\arabic{postnote}]} % Changed to Arabic numerals

% End note title setup
\renewcommand*{\pntitle}{Commentary\addcontentsline{toc}{section}{Commentary}}

% End note command
\newcommand{\myendnote}[1]{\postnote{\footnotesize #1}}

% Commentary Table command
\newcommand{\commentarytable}{%
    \newpage
    \printpostnotes
    \newpage
    \section*{Table of Meanings}
    \markboth{\arabic{chapter}\quad\Chaptername}{Table of Meanings}
    \addcontentsline{toc}{section}{Table of Meanings}
}

% 6.6 Footnote System - For brief notes at page bottom
\makeatletter
\renewcommand{\@makefnmark}{\textsuperscript{\makebox{\normalfont(\@thefnmark)\space}}}
\makeatother
\renewcommand\thefootnote{\arabic{footnote}}
\newcommand{\footnotealt}[1]{\footnote{#1}}

% 6.7 Margin Note System - For short notes in the page margin
\newcommand{\marginnotealt}[1]{\marginnote{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Terminology Management System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[abbreviations, record=only]{glossaries-extra}

% Macro to store term information
\newcommand{\storeterm}[3]{%
  \expandafter\def\csname term@#1\endcsname{#2}%
  \expandafter\def\csname term@#1@expl\endcsname{#3}%
}

% Macro to retrieve term translation
\newcommand{\getterm}[1]{%
  \ifcsname term@#1\endcsname
    \csname term@#1\endcsname
  \else
    \empty
  \fi
}

% Macro to retrieve term explanation
\newcommand{\gettermexpl}[1]{%
  \ifcsname term@#1@expl\endcsname
    \csname term@#1@expl\endcsname
  \else
  \fi
}

% Macro to check if term exists
\newcommand{\iftermexists}[3]{%
  \ifcsname term@#1\endcsname
    #2
  \else
    #3
  \fi
}

% Main term definition command
\NewDocumentCommand{\newterm}{m m m o}{%
  \IfNoValueTF{#4}
    {\storeterm{#2}{#3}{}}
    {\storeterm{#2}{#3}{#4}}

  \NewDocumentCommand{#1}{s m}{%
    \IfBooleanTF{##1}
      {\textbf{\textcolor{blue}{#3}}}
      {#3}
  }%

  \IfNoValueTF{#4}
    {\expandafter\newglossaryentry\expandafter{term@\detokenize{#1}}{%
        name={#3},
        description={\unexpanded{\textcolor{gray}{\scriptsize\textbf{Original:}}#2}},
        text={#3}
      }
    }
    {\expandafter\newglossaryentry\expandafter{term@\detokenize{#1}}{%
        name={#3},
        description={\unexpanded{\textcolor{gray}{\scriptsize\textbf{Original:}}#2\quad\textcolor{gray}{\scriptsize\textbf{Expl.:}}#4}},
        text={#3}
      }
    }
  \glsadd{term@\detokenize{#1}}
}

\renewcommand{\glsnamefont}[1]{\textbf{#1}}

% Load terminology from external file
\input{text/term}

% Term display command
\NewDocumentCommand{\termdisplay}{s m o}{%
  \IfBooleanTF{#1}
    {% Star mode: Colored annotation display
      \IfNoValueTF{#3}
        {% No optional parameter
          \iftermexists{#2}
            {\getterm{#2}{\scriptsize\textcolor{blue}{\textbf{(#2)}}}}
            {#2}
        }
        {% Has optional parameter
          {#3}{\scriptsize\textcolor{blue}{\textbf{(#2)}}}
        }%
    }
    {% No star mode: Normal display
      \IfNoValueTF{#3}
        {% No optional parameter
          \iftermexists{#2}
            {\getterm{#2}}
            {{\small\textcolor{blue}{\textbf{#2}}}\normalsize}
        }
        {#3}
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8. Other Custom Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 8.1 Document Structure Commands
% Homage command
\newcommand{\homage}{%
    \begin{center}
        \Large \textbf{\em
%            န​မော တဿ ဘဂဝ​တော အရဟ​တော သမ္မာသမ္ဗုဒ္ဓဿ။
            Namo tassa bhagavato arahato sammāsambuddhassa.}
%            \\Homage to the Blessed One, the Worthy One, the Fully Enlightened One.}
        \vspace{5ex}
    \end{center}
}

% Start command
\newcommand{\starthere}{%
    \etocsetnexttocdepth{2}\localtableofcontents%
    \newpage\thispagestyle{plain}\homage
}

% 8.2 Citation Commands
% Burmese source citation command
\DeclareDocumentCommand\citemm{m o}
{%
    \IfNoValueTF{#2}%
    {\citetitle{#1}။}
    {\citetitle{#1}၊\space{#2}။}
}

% 8.3 Text Markup Commands
\newcommand{\peyyala}[1]{$\cdots\cdots$}

% 8.4 Custom Environments
% Sutta name environment
\newenvironment{suttaname}
{\begin{center}\LARGE}
{\vspace{2ex}\end{center}}

% Concluding words environment
\newenvironment{conclude}
{\begin{center}\mdseries\large}
{\end{center}}

% Verse environment
\newenvironment{myverse}
{\begin{quote}\begin{center}}
{\end{center}\end{quote}}

% 8.5 Chapter Name Retrieval System
\let\Chaptermark\chaptermark
\def\chaptermark#1{\def\Chaptername{#1}\Chaptermark{#1}}
\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}

% 8.6 Figure/Table Counter Format
\renewcommand{\tablename}{Table}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
\renewcommand{\figurename}{Figure}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}

% 8.7 Table of Contents Format Customization
\usepackage{tocloft}
\usepackage{etoc}
\renewcommand{\cfttoctitlefont}{\hfill\huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 9. Alternative / Backup Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 9.1 Counter settings
%\counterwithin{chapter}{part}
%\setcounter{tocdepth}{1}

% 9.2 Other font settings
% Fallback font settings if primary fonts are unavailable

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of Preamble / Document Class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
