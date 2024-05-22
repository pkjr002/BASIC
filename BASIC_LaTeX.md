# Font 

Bold `\textbf{}`  
Italics `\textit{text}` OR `\emph{}`  

##### Underline
Underline `\underline{}`  
double-Underline `\uuline{}`  
Wave-Underline `\uwave{}`  
Dash-Underline `\dashuline{}`    
Dot-Underline `\dotuline{}`

##### Other
typewriter (monospaced) `\texttt{}`  
Small Caps `\textsc{\}`

### Color
\usepackage{xcolor}
\textcolor{red}{This text is red.}


### Standard size commands
```
\tiny        
\scriptsize        
\footnotesize        
\small        
\normalsize        
\large        
\Large        
\LARGE        
\huge        
\Huge        
```

## Titles  
`titlesec` customize appearance and formatting of section titles (e.g., chapters, sections, subsections, ...)  
```
\usepackage{titlesec}

% Customizing the section title format
\titleformat{\section}
  {\normalfont\Large\bfseries\color{red}\fontsize{14}{16}\itshape}   
  {\normalfont\Large\bfseries\raggedright}      % Left-justified
  {\thesection}   % Format applied to the section number
  {1em}           % Space between the number and the title
  {}              % Code before the title
  [\color{blue}\titlerule]  % Optional: Add a blue horizontal line under the title

% Customizing the spacing before and after section titles
\titlespacing*{\section}
  {0pt}  % Left margin
  {2ex plus 1ex minus .2ex}  % Space before the title
  {1ex plus .2ex}  % Space after the title

\begin{document}
```

### Paragraph
```
\setlength{\parindent}{0pt}  % No indentation for paragraphs
\setlength{\parskip}{10pt}  % Space between paragraphs
\begin{document}
\raggedright
```


## List
#### Itemized 
```
\begin{itemize}
    \item 
\end{itemize}
```
#### Enumerated
```
\begin{enumerate}
    \item 
\end{enumerate}
```

## Hyperlinks
```
\usepackage{hyperref}
\href{http://example.com}{Example-Link}
```


## Tables
#### Simple
```
\begin{tabular}{|c|c|}
\hline
Column 1 & Column 2 \\
\hline
Item 1 & Item 2 \\
\hline
\end{tabular}
```
 
##### automatic width
```
\usepackage{tabularx}
\begin{tabularx}{\textwidth}{|X|X|}
\hline
Column 1 & Column 2 \\
\hline
Item 1 & Item 2 \\
\hline
\end{tabularx}

```

## Figure
```
\usepackage{graphicx}
\begin{figure}[h]
    \centering
    \includegraphics[width=0.5\textwidth]{image.png}
    \caption{Caption text}
    \label{fig:label}
\end{figure}
```



## Define a new command using `\newcommand`  
```
\newcommand{\commandname}[number of arguments]{definition}
```

##### Custom command for vertical spacing
```
\newcommand{\vspacecustom}{\vspace{1em}} 
```


### `Margins`
---
```
\RequirePackage[left=1.5cm, right=1cm, top=0.5cm, bottom=0.5cm, footskip=0.5cm, headheight=0.5cm]{geometry}
```

## Document Structure
```
\section{Section Title}
\subsection{Subsection Title}
\subsubsection{Subsubsection Title}
```

### Headers and Footers
```
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[L]{Left Header}
\fancyhead[C]{Center Header}
\fancyhead[R]{Right Header}
\fancyfoot[L]{Left Footer}
\fancyfoot[C]{Center Footer}
\fancyfoot[R]{\thepage}
```

## Draw a line across the entire width
```
\begin{tikzpicture}
  \draw[line width=1pt, draw=black] (0,0) -- (\dimexpr\textwidth-1pt,0);
\end{tikzpicture}
```

## Page Layout
- In a LaTeX document, the page is divided into several areas: the header, the main text area, and the footer.
- The "bottom of the text area" refers to the lower boundary of the main content of your page. This is where the main body of your text ends.
- The "top of the footer" refers to the upper boundary of the footer area. The footer typically contains elements like page numbers or footnotes.
```
The footskip parameter in LaTeX determines the distance between these two points: the bottom of the main text area and the top of the footer. This is the vertical space reserved for the footer content.
So, when you set footskip=.5cm, you're specifying that there should be a .5cm gap between the end of your main text and the beginning of your footer content.
```