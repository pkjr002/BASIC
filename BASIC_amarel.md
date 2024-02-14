# VS code appearance.
In the settings.json add the following
```
{
    "workbench.colorTheme": "Visual Studio Light",
    "workbench.startupEditor": "none",
    "explorer.autoReveal": false,
    "explorer.confirmDelete": false,
    "editor.fontSize": 14,
    "terminal.integrated.fontSize": 14
}
```

# Specify SSH details on local
In the ```~/.ssh/config``` file (if it doesnot exist, create it) add the following
```
Host amarel.rutgers
  HostName amarel.rutgers.edu
  User unme001

Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_
```

# Install Miniconda
```
$ mkdir -p ~/miniconda3
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
$ bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
$ rm -rf ~/miniconda3/miniconda.sh
```

Note: Depending on which shell, initialize as 
```
$ ~/miniconda3/bin/conda init bash
$ ~/miniconda3/bin/conda init zsh
$ ~/miniconda3/bin/conda init tcsh
```

Check the install by typing
```
conda --version
conda list
```

## OPT:Check conda path 
```echo $PATH```

If miniconda is not listed, then add it to the *rc. First check your shell 
```$ echo $SHELL```
add ```export PATH=~/miniconda3/bin:$PATH``` to your shell 
```$ echo -e '\nexport PATH=~/miniconda3/bin:$PATH' >> ~/.zshrc```
refresh the terminal ```source ~/.*rc```


# Conda Environments (env)
Check your env ```$ conda env list```

Activate base env ```$ conda activate base```
Dectivate ```$ conda deactivate ```

## Create a conda env
```
$ conda create -n <my-env> python=3.9;     # specific py versionm 
$ conda create --name <my-env>
```

## Specifying a location for an environment
```$ conda create --prefix ./envs jupyterlab=3.2 matplotlib=3.5 numpy=1.21```

## Create the environment from the ```environment.yml``` file:
```$ conda env create -f environment.yml```

## Remove env
```$ conda env remove --name venv```


# Add the conda env to JUPYTER
```
$ pip install ipykernel   
$ python -m ipykernel install --user --name=<env name> 
```

# Plugins for VS code
jupyter notebook
git lense

# HPC generic
scontrol show node
sinfo