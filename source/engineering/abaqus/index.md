---
title: "Abaqus"
---

The aim of this guide is to provide basic information and example job scripts
for how to run Abaqus on the [University of Bristol HPC systems](https://www.bristol.ac.uk/acrc/high-performance-computing/)
BlueCrystal Phase 4 and BluePebble.

```{note}
The content of this guide is open source, and contributions are welcomed from the Abaqus user community!
If you see something wrong in this guide or have something to add, then please see [here](https://acrc.github.io/HPC-community-docs)
for how to get involved and contribute.
```

Some basic familiarity with the Linux command line and remote HPC systems is assumed;
if you are unfamiliar or need a refresher, then the following courses are recommended:

- [Introduction to the command line](https://alleetanner.github.io/intro-to-command-line/)
- [Introduction to High Performance Computing](https://www.acrc.bris.ac.uk/protected/hpc-docs/training/intro-to-hpc-slurm/index.html)

## Setup

```{important}
Before using Abaqus at the university, you must first register for an Abaqus license -  
speak to your supervisor for how to do this and to obtain a charge code for the license.
```

Abaqus is available as a module on BlueCrystal Phase 4 and BluePebble and can be loaded into the shell environment using

```console
$ module load apps/abaqus/2018
```

You can verify if Abaqus has been setup correctly by running the following command:

```console
$ abaqus information=version
```

If you are using custom user subroutines, you will also need to load the Intel Fortran compiler:

::::{tab-set}
:::{tab-item} BlueCrystal (Phase 4)
```console
$ module load languages/intel/2020-u4
```
:::

:::{tab-item} BluePebble
```console
$ module load lang/intel-parallel-studio-xe/2020
```
:::
::::

## Fair Use


```{important}
Abaqus licenses are shared across the university in a fair-use manner: 
this means that you __should not run a large number of Abaqus jobs
simultaneously__ as this prevents other users from running Abaqus.
```

- You should not be using more than 400 license credits at a time;
  run the command `abaqus licensing dslsstat -usage` in the command line
  to see how many license credits you are currently using.
- As a rough guide, limit yourself to a maximum of 8 non-parallel jobs
  or 3 parallel jobs running simultaneously.
- If you are running [batch array jobs with slurm](https://slurm.schedmd.com/sbatch.html#OPT_array),
  you can use the `%` operator to limit the maximum number of concurrently running array tasks.


```{warning}
If you have more than 400 licenses in use, then your jobs may be
terminated without warning to allow others to use the licenses.
```

## Running Jobs

```{toctree}
---
includehidden: true
maxdepth: 1
titlesonly: true
---
single-node
multi-node
troubleshooting
```