> **Author:** pkjr002@gmail.com  
> **Date:** 2024-03-02   
> **Needs:** NA

# General
### Font 
```
<span style="font-size: 12pt; font-family: 'Times New Roman'; color: blue; ">.      </span>  
<span style="font-size:14pt; font-family:Georgia, serif;color:black;  font-style:italic"> .</span>  
<span style="font-size:14pt; font-family:'Courier New', monospace; color:black"> <b>Background::</b> <br>
```
<br>

Italic `<span style="font-style: italic;">  </span>`  
Space `&nbsp`  
Linebreak `<br>`  
Bold `<b>`  
Red Arrow `<p style="font-size: 32px; color: red;">&#10145;</p>`  


### Highlighting 
```
<span style="background-color: yellow;"> dum </span>
```
```
<span style="font-size: 14pt; color: blue; font-family: 'Times New Roman'; background-color: yellow;">   dum   </span>
```  


### Hyperlink
```
<a href="https://www.eg.com">LINK</a>
```

### Boxed Hyperlink
```
<div style="border: 5px solid blue; padding: 20px;">
<span style="font-family: 'Arial';">
    <span style="color: 008000;"> TEXT_HERE  
	    <a href="https://www.eg.com">LINK</a> 
    </span>.
</span>
---
</div>
```

### List
```
<ol>
    <li>Item 1</li>
    <li>Item 2</li>
</ol>
```

<br>

# Horizontal Line
```
<hr style="border: none; height: 2px; background-color: none; border-style: dotted;">
```
### Line-Highlighting
```
<hr style="border: none; height: 4px; background-color: yellow; border-style: dotted;">
```

### Half-line (centered)
```
<div style="width: 50%; margin: auto;">
    <hr style="border: none; height: 2px; background-color: yellow; border-style: dotted;">
</div>
```

### Half-line (left)
```
<div style="position: relative; width: 100%;">
    <hr style="position: absolute; left: 0; width: 50%; border: none; height: 2px; background-color: yellow; border-style: dotted;">
</div>
```

<br>

# CSS styling
```
<style>
    .myPara     {font-size: 12pt; color: blue; font-family: 'Comic Sans MS';}
    .hl         {background-color: yellow;}
    .imp        {font-family: 'Times New Roman'; color:red; font-weight: bold; font-style: italic;}
    .boxed      {border: 2px solid black; padding: 5px;}
    .bulet li   {font-family: 'Times New Roman'; color:black; font-style: italic; font-size: 12pt;}
</style>
```
**use as**  
```
<p class="myPara"> This is a paragraph for 
    <span class="hl"> 
        highlighting </span> and change 
        <span class="imp">font-style</span> using css-style
</p>
```

<br>

# Template
```
<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
</head>
<body>
    Content goes here.
</body>
</html>
```

# Titles
<blockquote style="font-size: 18px; line-height: 2;">
  <strong>Title:</strong> Get, Xplore & plot <br>
  <strong>Author:</strong> Johane Doe <br>
  <strong>Date:</strong> 2024.04.~<br>
</blockquote>

##### Notebook Titles
```
<span style="font-size:24pt; color:blue; font-family: 'Times New Roman'">Notebook:: 
    <span style="color:green;"> Title goes here </span>
</span>
<br>
<span style="font-size:12pt; color:black; font-family:Georgia, serif;font-style:italic">by Jean Doe </span>
<br>
```