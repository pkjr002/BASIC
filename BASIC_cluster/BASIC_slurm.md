# SLURM Directives:

<hr style="position: absolute; left: 1.5; width: 50%; height: 2px; background-color: blue; border-style: dotted;"><br>

```
#SBATCH --partition=p_1: Specifies the partition (job queue) to submit the job to. The p_1 partition is used in this case.   
#SBATCH --job-name=facts-2node-nz: Assigns a short name to the job for easier identification.   
#SBATCH --nodes=1: Requests one node for the job.   
#SBATCH --ntasks-per-node=24: Requests 24 tasks per node.   
#SBATCH --time=05:00:00: Sets a time limit of 5 hours for the job.   
#SBATCH --output=slurm.%N.%j.out: Specifies the file to which STDOUT will be written. %N is the node name and %j is the job ID.   
#SBATCH --error=slurm.%N.%j.err: (Optional) Specifies the file to which STDERR will be written. %N is the node name and %j is the job ID.   
```