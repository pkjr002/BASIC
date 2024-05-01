# Install the VE
```
conda create -n ve_working python=3.11.6 -c conda-forge
conda activate ve_working
python3 -m venv ve_working
conda deactivate
. ve_working/bin/activate
pip install -r ve_working.txt
```



<div style="position: relative; width: 100%;"><hr style="position: absolute; left: 0; width: 50%; border: none; height: 2px; background-color: yellow; border-style: dotted;"></div>  

 
## Run FACTS using `sbatch`

Create a file `submit_sbatch.sh` in `./facts`  
Add the following lines of code
```
#!/bin/bash
#SBATCH --partition=part_1        # Partition (job queue)
#SBATCH --job-name=facts-2node    # Assign a short name to your job
#SBATCH --nodes=1                 # Number of nodes you require
#SBATCH --ntasks-per-node=24      # Total # of tasks across all nodes
#SBATCH --time=70:30:00           # Total run time limit (HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out  # STDOUT output file
#SBATCH --error=slurm.%N.%j.err   # STDERR output file (optional)

source /scratch/FULL-VE_path/bin/activate

radical-stack

export RADICAL_LOG_LVL="DEBUG"
export RADICAL_PROFILE="TRUE"

python3 /scratch/FACTS_path/facts/runFACTS.py /scratch/FACTS_path/facts/$1

```
#### Then we modify the resource file
Currently I am unsure which resource file is being used `resource_amarel_srun.yml` or `resource_amarel.yml`
<br>

`resource_amarel_srun.yml` spec  
```
mongodb:
    hostname: ""
    port:     
    username: ""
    password: ""

# Note the default and requested minimum walltime for RCT is 30 min per RCT user guide
resource-desc:
  resource: 'rutgers.amarel'
  walltime: 4320
  memory: 128000
  cpus: 12
  gpus: 0
  queue: 'kopp_1'
  project: ''
  schema: 'local'

```

Modifications made to `resource_amarel.yml` was given by Alex via slack.    
```
mongodb:
    hostname: ""
    port:     
    username: ""
    password: ""

# Note the default and requested minimum walltime for RCT is 30 min per RCT user guide
resource-desc:
  resource: 'rutgers.amarel'
  walltime: 3000
  #memory: 128000
  access_schema: 'interactive'
  cpus: 12
  gpus: 0
  queue: 'part_1'
  #project: ''
  #schema: 'local'
```
#### Facts can then be run using 
```
sbatch submit_sbatch.sh experiments/ssp585/
```   

To monitor the status of run use 
```
tail -f slurm<name of run>.err
```  

