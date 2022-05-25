---
title: "Single-Node Jobs"
---

Small scale Abaqus jobs can be run on a single node with up to 28 processors.

## Job Script Template

Here is an example job submission script for a single-node Abaqus job:

```{code-block} bash
---
linenos: true
---
#!/usr/bin/env bash -l
# 
#SBATCH --job-name=my_job
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=14
#SBATCH --time=0:10:00 
#SBATCH --mem-per-cpu=4000M

# Load modules 
module load apps/abaqus/2018
# module load languages/intel/2020-u4              # BlueCrystal (Phase 4)
# module load lang/intel-parallel-studio-xe/2020   # BluePebble

# Unset SLURM's Global Task ID for ABAQUS's PlatformMPI to work 
unset SLURM_GTIDS 

# Launch Abaqus 
abaqus job=<job-name> cpus=${SLURM_CPUS_PER_TASK} user=<usub-file> mp_mode=threads double=both interactive
```

```{note}
On a single node, the best choice for best performance between `mp_mode=threads` and `mp_mode=mpi`
will depend on your specific problem. `threads` is recommended and known to work well;
`mpi` may be more efficient for larger problems.
```

### How to use

1. Create a new job file (_e.g._ `job.sh`) with the template above in a folder in your scratch space
    - Copy your Abaqus job file (`.inp`) and Fortran user subroutine (if using) into the same folder

2. Update the number of processors to use (line 6)
    - On BluePebble and BlueCrystal, the maximum number of processors per node is 28

3. Update the time limit (line 7)
    - You should update this to however long you require for your Abaqus job.
    - The format for the time limit is `days-hours:minutes:seconds`
    - See [here](https://slurm.schedmd.com/sbatch.html#OPT_time) for more help on `sbatch --time`

4. Update the memory per cpu (line 8)
    - Increase this value if you encounter an `oom-kill` or `out-of-memory` error message in your output file

5. If you are using custom user subroutines:
    - Uncomment either line 12 or line 13 to add the Intel Fortran compiler depending on which system you are running on (BlueCrystal or BluePebble)
    - Replace `<usub-file>` on the last line with the name of your Fortran user subroutine source file (_e.g._ `usub_czm.f`)

6. Replace `<job-name>` on the last line with the name of your Abaqus job input file (`.inp`)

7. Submit the job to slurm:
    - Change directory (`cd`) into the folder containing your job files and job script
    - Run `$ sbatch job.sh` where `job.sh` is the name of your job script


```{important}
Make sure that you run your jobs using your _scratch_ space
in `/user/work/<username>/` and not from your `$HOME` directory
in `/user/home/<username>`. Your `$HOME` storage only has 20 GB (BlueCrystal) or 25 GB (BluePebble)
of space, whereas your scratch space has 1 TB.
```

