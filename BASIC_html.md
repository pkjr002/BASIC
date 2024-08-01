# General

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

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


<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

### Highlighting 
```
<span style="background-color: yellow;"> dum </span>
<span style="font-size: 14pt; color: blue; font-family: 'Times New Roman'; background-color: yellow;">   dum   </span>
```


<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

### Hyperlink
```
<a href="https://www.eg.com">LINK</a>
```
shorthand `<span style="font-size: 12pt; font-family: 'Times New Roman'; color: black; ">. <a href="https://www.eg.com">eg.com</a> </span>` 



<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

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

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

### List
```
<ol>
    <li>Item 1</li>
    <li>Item 2</li>
</ol>
```

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

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
<hr style="border: none; height: 2px; background-color: yellow; border-style: dotted;">
```

### Half-line (left)
```
<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: yellow; border-style: dotted;">
```

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;">  <br>

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

# Pictures  
Grid Layout (2 Rows and 3 Columns)  
```
<div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px;">
  <img src="image1.jpg" alt="Image 1" style="width: 100%;">
  <img src="image2.jpg" alt="Image 2" style="width: 100%;">
  <img src="image3.jpg" alt="Image 3" style="width: 100%;">
  <img src="image4.jpg" alt="Image 4" style="width: 100%;">
  <img src="image5.jpg" alt="Image 5" style="width: 100%;">
</div>  
```

Vertical Layout
```
<div>
  <img src="image1.jpg" alt="Image 1" style="width: 100%; margin-bottom: 10px;">
</div>
```  

Single Row (Horizontal Layout)  
```
<div style="display: flex; justify-content: space-between;">
  <img src="image1.jpg" alt="Image 1" style="width: 18%;">
</div>
```


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

## TOP Notebook Title
```
<span style="font-size:24pt; color:blue; font-family: 'Times New Roman'">Notebook:: 
    <span style="color:green;"> Title goes here </span>
</span>
<br>
<span style="font-size:12pt; color:black; font-family:Georgia, serif;font-style:italic">by Jean Doe </span>
<br>
```

#### Background/Research question
```
<br><br>  
<span style="font-family:'Courier New', monospace; font-size:14pt; color:black"> <b>Broad Research Question::</b> <br>  
Write here what the research question is.
</span>
<br>
<span style="font-family:'Courier New', monospace; font-size:14pt; color:black"> <b>Background::</b> <br>
 Write here what the Background is
</span>
```