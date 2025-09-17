# `GIT Workflows`



1. Revert Local Commit and Pull Remote Changes (Without Losing Uncommitted Work)
  If you have:
    - A local commit you want to discard
    - Uncommitted changes (including untracked files)
    - The need to pull the latest changes from the remote branch

  <details>

  <summary> Follow the steps below </summary>    
    <br>

    # 1. Stash your uncommitted changes (including untracked files)
    git stash push -u -m "temp-changes"

    # 2. Revert the last local commit (permanently delete it)
    git reset --hard HEAD~1

    # 3. Pull the latest changes from the remote branch
    git pull
    
    # 4. Reapply your stashed changes
    git stash pop

  </details>

  

