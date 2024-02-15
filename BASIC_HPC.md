# Cluster / High Performance Computing 
`$ sinfo` ...............................Displays information about the SLURM-managed compute nodes, including their state, partition, and available features.  
`$ squeue` ..............................Shows the status of jobs in the SLURM job queue, including job ID, username, partition, job name, state, and node(s) allocated.  
`$ sacct` ...............................Provides accounting data for jobs, showing details such as job start time, end time, CPU usage, memory usage, and exit status.  
`$ scancel` .............................Cancels one or more SLURM jobs by specifying their job IDs.  
`$ scontrol update`......................Allows modification of job or node properties, such as changing a job's priority or specifying a node's features.  
`$ sbatch` ..............................Submits a batch script to SLURM for execution.  
`$ salloc` ..............................Requests an interactive SLURM job allocation with a specified number of nodes and resources.  
`$ sattach` .............................Attaches to a running SLURM job for monitoring and debugging purposes.  
`$ sreport` .............................Generates various reports based on SLURM job and accounting data, such as CPU usage, job efficiency, or job counts.  
`$ sview` ...............................Provides a graphical interface for monitoring SLURM jobs, nodes, and partitions in real-time.  
`$ scontrol show job <jobid>` ...........Displays detailed information about a specific SLURM job, including its state, allocated resources, and job script details.  
`$ scontrol show node <node names>` .....Displays info about the specified nodes. *If no node name is specified, info for all nodes in the cluster is displayed*.   