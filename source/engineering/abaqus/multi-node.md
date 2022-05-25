---
title: "Multi-Node Jobs"
---

Large parallel Abaqus jobs, using more than 28 processors, can be run on across multiple nodes using MPI.

```{tip}
Multi-node parallelism is best-suited to Abaqus/Explicit.
Abaqus/Standard (implicit) does not scale well across multiple nodes.
```

## Job Script Template

Here is an example job submission script for a multi-node Abaqus job:

```{code-block} bash
---
linenos: true
---
#!/usr/bin/env bash -l
# 
#SBATCH --job-name=my_job
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=28
#SBATCH --cpus-per-task=1 
#SBATCH --time=0:10:00 
#SBATCH --mem-per-cpu=4000M

# Load modules 
module load apps/abaqus/2018
# module load languages/intel/2020-u4              # BlueCrystal (Phase 4)
# module load lang/intel-parallel-studio-xe/2020   # BluePebble

# Unset SLURM's Global Task ID for ABAQUS's PlatformMPI to work 
unset SLURM_GTIDS 

# Get allocated nodes for Abaqus
env_file=abaqus_v6.env 
node_list=$(scontrol show hostname ${SLURM_NODELIST} | sort -u) 
mp_host_list="[" 
for host in ${node_list}; do 
    mp_host_list="${mp_host_list}['$host', ${SLURM_CPUS_ON_NODE}]," 
done 
mp_host_list=$(echo ${mp_host_list} | sed -e "s/,$/]/") 
echo "mp_host_list=${mp_host_list}"  >> ${env_file} 

# Launch Abaqus 
abaqus job=<job-name> cpus=$((SLURM_NTASKS_PER_NODE*SLURM_NNODES)) user=<usub-file> mp_mode=mpi double=both interactive
```

There are number of important differences with the single-node job script example:
- More than one node is requested
- We request multiple tasks per node (distributed parallelism), instead of multiple cpus per task (thread-based parallelism)
- We have extra lines to inform Abaqus platform MPI about the nodes that have been allocated via the job scheduler
- We __must__ use `mp_mode=mpi` for multi-node parallelism


### How to use

Follow the same steps are described for the {doc}`single-node example <single-node>` except
you can scale the paralellism by changing the number of nodes (line 4).
