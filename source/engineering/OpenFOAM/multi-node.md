---
title: "Multi-Node Jobs"
---

Large OpenFOAM jobs can be run across multiple nodes.


## Job Script Template

Here is an example job submission script for a multi-node OpenFOAM job:

```{code-block} bash
---
linenos: true
---
#!/bin/bash
## Submission script for Cluster
#SBATCH --job-name=my_job
#SBATCH --time=0-01:00:00 # hh:mm:ss
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=28
#SBATCH --cpus-per-task=1



## system error message output file
## leave %j as it's being replaced by JOB ID number
#SBATCH -e my_job_%j.err

## system message output file
#SBATCH -o my_job_%j.out

# record some potentially useful details about the job: 
echo Running on host $(hostname) 
echo Time is $(date) 
echo Directory is $(pwd) 
echo Slurm job ID is ${SLURM_JOBID} 
echo This jobs runs on the following machines: 
echo ${SLURM_JOB_NODELIST} 
printf "\n\n\n\n" 

# Load modules required for runtime e.g.
module load apps/openfoam/6



# Run the solver. Take pisoFoam with 112 processors for example:
mpirun -np 112 pisoFoam -parallel 

echo End Time is $(date) 
echo "Done pisoFoam finish"
printf "\n\n"

```

```{note}
For further information on the structure and syntax of Slurm job scripts, see the [ACRC HPC documentation pages on job types](https://www.acrc.bris.ac.uk/protected/hpc-docs/job_types/index.html).
```
### How to use
Save the script file in the [case folder](https://www.openfoam.com/documentation/user-guide/2-openfoam-cases), `cd` into the case folder, and submit the script to Slurm after the decomposition of mesh and initial field data. The number of MPI processes to request is the number of nodes times the number of tasks per node. 

