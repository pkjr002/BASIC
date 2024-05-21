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
