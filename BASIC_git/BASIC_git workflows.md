# `GIT Workflows`



1. <b><u>Revert Local Commit and Pull Remote Changes (Without Losing Uncommitted Work)</u></b>
  If you have:
    - A local commit you want to discard
    - Uncommitted changes (including untracked files)
    - The need to pull the latest changes from the remote branch
    <br> 

      <details>

      <summary> <em>Follow the steps below</em> </summary>    
                
      1. Stash your uncommitted changes (including untracked files)  
      ```git stash push -u -m "temp-changes"```

      1. Revert the last local commit (permanently delete it)  
      ```git reset --hard HEAD~1```

      1. Pull the latest changes from the remote branch  
      ```git pull```

      1. Reapply your stashed changes  
      ```git stash pop```

      </details>

      <br><br>

  

1. <b><u>Make your `main` mirror the Original `main`</u></b>  
  i.e.
    - Keep your fork `main` identical to the original repo `main`  
    <br>
  
      <details>  

      <summary> <em>Follow the steps below</em> </summary>    
                
      1. Add the original repo as a remote  
      ```git remote add upstream https://github.com/original/repo.git```  

      1. Fetch the latest from the original repo  
      ```git fetch upstream```

      1. Reset your `main` branch to match upstream     
      ```git checkout main```
      ```git reset --hard upstream/main```

      1. Force push to update your fork on GitHub   
      ```git push origin main --force```
    
      
      :bulb: keep your main in sync in the future    
      ```
      git fetch upstream
      git checkout main
      git reset --hard upstream/main
      git push origin main --force
      ```
      </details>

      <br><br>
