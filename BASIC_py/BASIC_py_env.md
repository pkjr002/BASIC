# Environments    
A Python environment is an isolated workspace that contains a specific Python interpreter and a collection of packages. It helps you manage dependencies for different projects without conflicts.   


### Types of Python Environments:
> **Global Environment**:     
The default Python installation on your system.

> **Virtual Environment**:    
Isolated Python instances for individual projects.   
(via venv or virtualenv): 

> **Conda Environment**:    
Managed by Anaconda/Miniconda, useful for scientific computing.


### Why Use It?
* Avoid package conflicts between projects.
* Work with different Python versions or package versions.


<br><br><br><br>

# Details of checking Environments   

- Using `conda` (if using Anaconda/Miniconda)    
    ```
    conda env list
    ```   

- Using `pipenv` (if using Pipenv)    
    ```
    pipenv --env
    ```

- Using `virtualenv`       
    Virtual environments managed with virtualenv don't have a built-in command to list them.    
    You'll need to check manually in the directory where you created the environments.   
    In terminal   
    ```
    source /path/to/env/bin/activate
    ```

- Using `pyenv`   
    ```
    pyenv versions
    ```

- Using `ipython kernel`   
    ```
    jupyter kernelspec list
    ```


### Install the environment's Jupyter kernel:    
`python -m ipykernel install --user --name=envname`