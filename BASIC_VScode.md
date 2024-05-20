# Plugins for VS code
```SSH```  
```jupyter notebook```  
```git lense```  
#### Optional
```open in browser ```  Renders html  
```IntelliSense ``` CSS class names in HTML 

# Using the Cmd Palet
```
shift+cmd+P
```

### Prevent auto expanding of directories in Explorer tab
In home screen of VScode `shift+cmd+P`  
Type `Open User Settings (JSON)`  
Add the line `"explorer.autoReveal": false`  


# SETTINGS VS code.
On keyboard hold `shift+cmd+p` and then find settings.json file.  
In the settings.json add the following
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
    "workbench.editor.enablePreview": false,
    "window.zoomLevel": 1,
    "editor.minimap.enabled": false,
    "breadcrumbs.enabled": false,
    "workbench.list.openMode": "doubleClick",
    "terminal.integrated.enableMultiLinePasteWarning": false,
    "workbench.editorAssociations": {
        "*.pdf": "pdf.view"
    },
    "git.openRepositoryInParentFolders": "always",
    "git.confirmSync": false,
    "editor.wordWrap": "on",
}
```



### Render MarkDown
`shift+cmd+P`  
Type `Markdown: Open Preview`  
OR `shift+cmd+V`  


## Fit Code on the viewport VScode Editor
Go to se