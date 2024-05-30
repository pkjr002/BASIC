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
```
\usepackage{xcolor}  
\textcolor{red}{This text is red.}
```

### Highlighting
```
\usepackage{soul}   
\hl{highlight}
```

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

## Hyperlinks and Icons
```
\usepackage[colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue]{hyperref}
\href{http://example.com}{\texttt{Example-Link}}
```

#### List of some common used icons
```
\documentclass{article}
\usepackage[colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue]{hyperref}
\usepackage{fontawesome}

\begin{document}

\begin{itemize}
  \item \faGithub\ GitHub: \href{https://github.com/radical-collaboration/facts}{\texttt{github.com/radical-collaboration/facts}}
  \item \faMapMarker\ Location: \href{https://maps.google.com}{Google Maps}
  \item \faPhone\ Phone: +123-456-7890
  \item \faEnvelope\ Email: \href{mailto:someone@example.com}{someone@example.com}
  \item \faCloud\ Weather: \href{https://weather.com}{Weather.com}
  \item \faLinkedin\ LinkedIn: \href{https://linkedin.com}{LinkedIn Profile}
  \item \faFacebook\ Facebook: \href{https://facebook.com}{Facebook Page}
  \item \faTwitter\ Twitter: \href{https://twitter.com}{Twitter Profile}
  \item \faInstagram\ Instagram: \href{https://instagram.com}{Instagram Profile}
  \item \faHome\ Home: \href{https://example.com}{Home Page}
  \item \faCalendar\ Calendar: \href{https://calendar.google.com}{Google Calendar}
  \item \faUser\ User: \href{https://example.com/user}{User Profile}
  \item \faLock\ Security: \href{https://example.com/security}{Security Settings}
  \item \faCamera\ Photography: \href{https://example.com/photography}{Photography Portfolio}
  \item \faCoffee\ Cafe: \href{https://example.com/cafe}{Favorite Cafe}
  \item \faCar\ Transport: \href{https://example.com/transport}{Transport Services}
  \item \faPlane\ Travel: \href{https://example.com/travel}{Travel Blog}
  \item \faTree\ Environment: \href{https://example.com/environment}{Environmental Initiatives}
  \item \faBook\ Library: \href{https://example.com/library}{Online Library}
  \item \faGraduationCap\ Education: \href{https://example.com/education}{Educational Resources}
\end{itemize}

\end{document}
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


