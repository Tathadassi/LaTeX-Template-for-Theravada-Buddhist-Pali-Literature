# Abhidhammāvatāra LaTeX Template

A professional academic typesetting template specifically designed for Theravada Buddhist Abhidhamma literature research, translation, and commentary. Supports multilingual typesetting (English, Pali, Burmese, Chinese) with specialized features for Buddhist textual studies.

## Features

- **Multilingual Support**: Full support for English, Pali (Romanized), Burmese, and Chinese text
- **Academic Annotation System**: Comprehensive note systems (inline, footnotes, endnotes, margin notes)
- **Terminology Management**: Built-in glossary system for consistent terminology usage
- **Professional Typesetting**: Optimized for academic publications on Buddhist texts
- **Source Identification**: Specialized commands for canonical texts, commentaries, and subcommentaries

## Compilation Requirements

- **Engine**: LuaLaTeX (required for Burmese script support)
- **Fonts**: 
  - Padauk (for Burmese script)
  - Times New Roman (for Latin/Pali text)
  - Noto Serif SC (for Chinese text, optional)
- **TeX Distribution**: TeX Live 2023 or later recommended

## Installation

1. Clone or download this template
2. Ensure required fonts are installed on your system
3. Compile with LuaLaTeX:

```bash
lualatex main.tex
biber main.bcf
lualatex main.tex
lualatex main.tex
```

Project Structure

```
Abhidhammāvatāra/
├── main.tex              # Main document file
├── abhidhammavatara.cls  # Document class file
├── text/
│   ├── cover.tex         # Cover page design
│   ├── 000.tex          # Editorial conventions
│   ├── 01-24.tex        # Chapter contents
│   └── term.tex         # Terminology definitions
├── references_Manual.bib # Bibliography database
└── README.md           # This file
```

Usage

Basic Document Structure

```latex
\documentclass{Abhidhammāvatāra}

% Bibliography setup
\addbibresource{references_Manual.bib}

\begin{document}
\include{text/cover}
\frontmatter
\tableofcontents
\include{text/000}
\mainmatter
\include{text/01}
% ... additional chapters
\backmatter
\printbibliography
\end{document}
```

Terminology Management

Define terms in text/term.tex:

```latex
\newterm{\citta}{စိတ္တံ}{consciousness}[The fundamental element of cognition]
\newterm{\nibbana}{နိဗ္ဗာနံ}{Nibbāna}
```

Use in document:

```latex
The concept of \termdisplay{citta} is fundamental to understanding consciousness.
```

Citation Commands

```latex
\citebur{dhammasangani_pali}      % Burmese source citation
\citechn{mulapannasa_atthakatha_1} % Chinese source citation
```

Annotation Systems

```latex
\begin{pali}
Nibbānaṃ paramaṃ sukhaṃ. \emph{This appears in normal font}
\end{pali}

\inlinenote{Inline note}          % Short inline annotation
\endnote{Detailed commentary}     % End-of-chapter notes
\footnotealt{Brief explanation}   % Footnotes
\marginnotealt{Margin reference}  % Margin notes
```

Customization

Font Configuration

The template uses Times New Roman as the main font but can be customized:

```latex
% In the class file or preamble
\setmainfont{YourPreferredFont}[
    ItalicFont = YourPreferredFont,    % Normal font for italics
    BoldItalicFont = YourPreferredFont Bold
]
```

Page Layout

Modify geometry settings in the class file:

```latex
\usepackage[paperheight=260mm, paperwidth=185mm,
            top=3cm, bottom=3cm,
            outer=3cm, inner=3cm]{geometry}
```

Recommended Workflow

1. Terminology Setup: Define all technical terms in text/term.tex
2. Chapter Development: Write each chapter in separate files
3. Citation Management: Use BibLaTeX for references
4. Compilation: Always use LuaLaTeX for proper rendering
5. Review: Use the built-in annotation systems for scholarly notes

Bibliography Management

The template uses BibLaTeX. Add entries to references_Manual.bib:

```bibtex
@book{dhammasangani_pali,
    title = {Dhammasaṅgaṇī Pāḷi},
    shorttitle = {Vibh. 1},
}
```

Troubleshooting

Common Issues

1. Burmese text not rendering: Ensure Padauk font is installed and LuaLaTeX is used
2. Pali diacritics issues: The template automatically handles italic font issues
3. Compilation errors: Check that all required packages are installed

Font Installation

· Windows: Download and install Padauk font from Google Fonts
· macOS: Use Font Book to install required fonts
· Linux: Install fonts through package manager:
  ```bash
  sudo apt install fonts-noto fonts-sil-charis
  ```

License

Dhamma Dana (Dhamma Gift) - Free for academic and personal use

Contributing

This template is maintained for academic use. Suggestions and improvements are welcome, particularly for:

· Additional multilingual support
· Improved citation styles
· Enhanced terminology management

Support

For technical issues or questions about Buddhist text typesetting, please refer to the documentation or consult with experienced LaTeX users familiar with multilingual typesetting.

Acknowledgments

· Based on traditional Theravada commentarial traditions
· Inspired by classical Pali text formatting standards
· Developed for modern academic publishing requirements

---

May this template be of benefit to all students of the Dhamma.

```

This README provides comprehensive documentation for the template, including installation instructions, usage examples, customization options, and troubleshooting tips. It's written in clear academic English suitable for international scholars working with Buddhist texts.
```
