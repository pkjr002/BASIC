# VS code appearence.
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
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```
Note: epending on which shell, initialize as 
```
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
~/miniconda3/bin/conda init tcsh
```
Check the install by typing
```
conda --version
conda list
```
Check conda path 
```
echo $PATH
```
If miniconda is not listed, then add it to the *rc. First check your shell 
```$ echo $SHELL```
add ```export PATH=~/miniconda3/bin:$PATH``` to your shell
refresh the terminal ```source ~/.*rc```


# Conda Environments (env)
$ conda env list

$ conda activate base
$ conda deactivate 

# Create env
$ conda create -n myenv python=3.9;  conda create --name <my-env>;  
#Specifying a location for an environment
$ conda create --prefix ./envs jupyterlab=3.2 matplotlib=3.5 numpy=1.21

# Create the environment from the environment.yml file:
$ conda env create -f environment.yml

$ conda env remove --name venv


# JUPYTER env
$ pip install ipykernel   
$ python -m ipykernel install --user --name=plot_M2 



other Plugins
jupyter notebook
git lense





# HPC generic
scontrol show node
sinfo