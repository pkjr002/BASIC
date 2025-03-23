### Plugins for VS code
  ```
  SSH
  jupyter notebook
  git lense
  #### Optional
  open in browser #Renders html  
  IntelliSense #CSS class names in HTML 
  ```

### Using the Cmd Palet
  ```
  shift+cmd+P
  ```


### Editor SETTINGS VS code.
  In the settings.json add the following

<details>    
   
<summary> settings.json file </summary>    

  ```
  {
        "workbench.colorTheme": "Visual Studio Light",    
        "workbench.startupEditor": "none",   
        "explorer.autoReveal": false,   
        "explorer.confirmDelete": false,  
        "editor.fontSize": 14,   
        "terminal.integrated.fontSize": 15,   
        "notebook.lineNumbers": "on",    
        "jupyter.askForKernelRestart": false,    
        "window.zoomLevel": 1,   
        "editor.minimap.enabled": false,    
        "breadcrumbs.enabled": false,   
        "workbench.list.openMode": "doubleClick",   
        "terminal.integrated.enableMultiLinePasteWarning": false,    
        "workbench.editorAssociations": {    
            "*.pdf": "pdf.view",   
        },   
        "latex-workshop.latex.tools": [   
            {   
                "name": "pdflatex",   
                "command": "pdflatex",   
                "args": [   
                    "--shell-escape", // if you want to have the shell-escape flag
                    "-synctex=1",
                    "-interaction=nonstopmode",
                    "-file-line-error",
                    "%DOC%"
                ]
            }
        ],
        "latex-workshop.latex.recipes": [
            {
                "name": "pdflatex",
                "tools": [
                    "pdflatex"
                ]
            }
        ],
        "git.openRepositoryInParentFolders": "always",
        "git.confirmSync": false,
        "editor.wordWrap": "on",
        "github.copilot.editor.enableAutoCompletions": true,
        "read-aloud-text.speed": 1,
        "gitlens.graph.minimap.enabled": false,
        "git.suggestSmartCommit": false,
        "git.ignoreLegacyWarning": true,
        "gitlens.advanced.messages": {
            "suppressGitVersionWarning": true
        },
    } 
  ```
</details>    


<!-- ### Render MarkDown
`shift+cmd+P`  
Type `Markdown: Open Preview`  
OR `shift+cmd+V`  


## Fit Code on the viewport VScode Editor
Go to se -->