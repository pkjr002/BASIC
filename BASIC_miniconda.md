# Install Miniconda
```
$ mkdir -p ~/miniconda
$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda/miniconda.sh
$ bash ~/miniconda/miniconda.sh -b -u -p ~/miniconda
$ rm -rf ~/miniconda/miniconda.sh
```

**Note:** Depending on which shell, initialize as (*you will use only 1 from below*)
```
$ ~/miniconda/bin/conda init bash
$ ~/miniconda/bin/conda init zsh
$ ~/miniconda/bin/conda init tcsh
```
#### To check your shell 
```
$ echo $SHELL
```

## Check the install by typing
```
conda --version
conda list
```

## OPTIONAL: Check conda path 
```
echo $PATH
```
If miniconda is not listed, then we need to add it to the *rc. 

Add `export PATH=~/miniconda3/bin:$PATH` to your shell *.rc. If you are using a mac with zsh shell, use   
```
$ echo -e '\nexport PATH=~/miniconda/bin:$PATH' >> ~/.zshrc
```
Refresh the terminal 
```
source ~/.zshrc
```  
## To stop auto activating environment in the Terminal
edit `~/.condarc`  
```
$ echo -e '\nauto_activate_base: false' >> ~/.condarc
```

## Control if Conda modifies your shell 
```
$ echo -e '\nchangeps1: true' >> ~/.condarc
```

<br><br>  

# Conda_101
## Conda Environments (env)
Check your env 
```
$ conda env list
```

Activate base env 
```
$ conda activate base
```
Dectivate 
```
$ conda deactivate 
```

## Create a conda env
```
$ conda create -n <my-env> python=3.9;     # specific py versionm 
$ conda create --name <my-env>
```

## Specifying a location for an environment
```
$ conda create --prefix ./envs jupyterlab=3.2 matplotlib=3.5 numpy=1.21
```

## Create the environment from the `environment.yml` file:
```
$ conda env create -f environment.yml
```

## Remove env
```
$ conda env remove --name venv
```


# Add the conda env to JUPYTER
```
$ pip install ipykernel   
$ python -m ipykernel install --user --name=<env name> 
```