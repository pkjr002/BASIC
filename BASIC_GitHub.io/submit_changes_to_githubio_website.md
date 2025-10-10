# How to Contribute to a Jekyll-based GitHub Pages Site Using Fork and Pull Request

If you want to contribute changes to a GitHub Pages site built with Jekyll but don’t have direct write access to the repository, you can use the fork-and-pull-request workflow. This standard process lets anyone propose changes that the repository owner can review and merge.

---

### Step 1: Fork the Repository
- Go to the GitHub repository hosting the website.
- Click the **Fork** button at the top-right corner.
- This creates a personal copy of the repository under your GitHub account.

### Step 2: Clone Your Fork Locally (Optional)
- On your forked repo page, click the **Code** button and copy the clone URL.
- Run in your terminal:
  ```
  git clone https://github.com/your-username/repo-name.git
  cd repo-name
  ```

- This copies all the website files to your computer.


### Step 3: Make Your Changes
- Edit the site content by modifying Markdown files, HTML templates, configuration files, or assets like images.
- You can do this locally using your preferred editor or directly on GitHub using the built-in web editor.
- If you want to preview locally, use:
  ```
  bundle exec jekyll serve
  ```

(requires [Jekyll](https://jekyllrb.com/) installed).

### Step 4: Commit and Push Your Changes
- Stage and commit your edits:
  ```
  git add .
  git commit -m "Describe your changes"
  git push
  ```

- If editing on GitHub web, just use the **Commit changes** button.

### Step 5: Create a Pull Request (PR)
- Once you push commits to your fork, GitHub usually shows a “Compare & pull request” button.
- Click it to open a pull request to the original repository.
- Enter a descriptive title and detailed explanation of your changes.
- Submit the pull request for review.

### Step 6: Review and Merge
- The repository owner will review your PR.
- If approved, they will merge it into the main repository.
- GitHub Pages will automatically rebuild and update the live site with your changes.

---

### Additional Information
- You do **not** need special permissions to fork or submit pull requests.
- Forking creates your own copy you can freely change without affecting the original site.
- Pull requests allow repo owners to review and selectively merge contributions.
- For ongoing or larger edits, it's good practice to create a separate branch in your fork before making changes.
- This workflow keeps collaboration secure, transparent, and manageable.

---

### Summary Table

| Step              | Description                                      |
|-------------------|------------------------------------------------|
| Fork              | Copy the repo to your GitHub account            |
| Clone/Edit        | Make changes locally or via GitHub web editor   |
| Commit & Push     | Save and upload your changes to your fork       |
| Pull Request      | Propose your changes to the original repo       |
| Review & Merge    | Owner reviews and merges, publishing updates    |

---

This process is the recommended way to contribute to Jekyll-based GitHub Pages sites, fostering collaboration without requiring direct write access.
