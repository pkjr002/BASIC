
# Pythia [Foundations](https://foundations.projectpythia.org/landing-page.html)    
A community learning resource for Python-based computing in the geosciences

<br><br><br>
# Pathlib   
**from pathlib import Path**
   
  - Creating a Path object `path = Path("folder/subfolder/file.txt")`
   
  - Get the absolute path `absolute_path = path.resolve()`
  
  - Check if a path exists `exists = path.exists()`
   
  - Get the parent directory `parent_dir = path.parent`
   
  - Get the file name `filename = path.name`
   
  - Create directories  
    `new_dir = Path("new_folder/subfolder")`  
    `new_dir.mkdir(parents=True, exist_ok=True)`

  - Reading a file `content = path.read_text()`
  
  - Writing to a file `path.write_text("Hello, world!")`