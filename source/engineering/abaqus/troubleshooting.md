---
title: "Troubleshooting"
---


## License not Authorized for User

```text
Failed to checkout DSLS license for: QAE
ERROR 1A000035: License not authorized for this user
...
```

If you receive this error when trying to run Abaqus, then you first need to
register for a university Abaqus license - speak to your supervisor about
how to do this.


## Out of Memory

If you do not request sufficient memory for your job, then it may be terminated by
the job scheduler with the following error message (check the log output files):


```text
slurmstepd: error: Detect 1 oom-kill event(s) in StepId=xxxxxx.batch. Some of your processes may have been killed by the cgroup out-of-memory handler.
```

This may also be accompanied by the following Abaqus error message (or similar):

```text
Abaqus Error: The executable explicit_dp
aborted with system error "Termination signal" (signal 9)
```

You can address this issue by increasing the requested `--mem-per-cpu` in your job submission script.


## Problem During Linking

The compilation and linking of large complex user subroutines may require much more memory
than the actual Abaqus job that you intend to run.

If you encounter an error similar to the following:

```text
ifort: error #10106: Fatal error in ld
Abaqus Error: Problem during Linking ...
```

Then you should check that your requested memory limit is not too low (<500M) and try increasing it.


## Node Configuration not Available

```text
sbatch: error: Batch job submission failed: Requested node configuration is not available
```

This error message can occur when you request too many resources (_e.g._ cpus, memory) than is available
on the cluster nodes.

```{note}
Your total memory request is the `--mem-per-cpu` parameter multiplied by
the number of cpus you have requested.
You can find out how much RAM is available per node in the ACRC HPC documentation
[here (UoB only)](https://www.acrc.bris.ac.uk/protected/hpc-docs/training/intro-to-hpc-slurm/acrc_systems.html).
```


## Job Terminates Immediately

If your job ends immediately after starting, make sure you have specified the `interactive`
keyword for Abaqus in your job script.

__Example:__

```bash
abaqus job=<job-name> cpus=${SLURM_NTASKS} user=<usub-file> mp_mode=threads double=both interactive
```


## Job Terminates Unexpectedly

If your jobs ends before the allotted maximum time, make sure you are running the job
in your _scratch_ space (`/user/work/<username>`) and not your `$HOME` space (`/user/home/<username>`).

Make sure also that you have enough space remaining in your scratch space;
you can check with the `user-quota` command.