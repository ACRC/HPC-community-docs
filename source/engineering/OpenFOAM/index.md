---
title: "OpenFOAM"
---

The aim of this guide is to provide basic information and example job scripts
for how to run OpenFOAM on the [University of Bristol HPC systems](https://www.bristol.ac.uk/acrc/high-performance-computing/)
BlueCrystal Phase 4.

```{note}
The content of this guide is open source, and contributions are welcomed from the OpenFOAM user community!
If you see something wrong in this guide or have something to add, then please see [here](https://acrc.github.io/HPC-community-docs)
for how to get involved and contribute.
```

Some basic familiarity with the Linux command line and remote HPC systems is assumed;
if you are unfamiliar or need a refresher, then the following courses are recommended:

- [Introduction to the command line](https://alleetanner.github.io/intro_to_CLI/)
- [Introduction to High Performance Computing](https://www.acrc.bris.ac.uk/protected/hpc-docs/training/intro-to-hpc-slurm/index.html)

You may also want to refer to the [official OpenFOAM documentation](http://www.openfoam.org/docs/user).

## Setup

OpenFOAM is available as a module on BlueCrystal Phase 4, and you can search the modules available using

```console
$ module avail openfoam
```

To load the module of version 6 into the shell environment use

```console
$ module load apps/openfoam/6
```

You can verify if OpenFOAM has been setup correctly by running the following command:

```console
$ icoFoam -help
```

## Get started

The tutorials in the following link introduce the basic procedures of running OpenFOAM:

- [OpenFOAM tutorials](https://doc.cfd.direct/openfoam/user-guide-v6/tutorials)

```{note}
Using [ParaView](https://www.paraview.org/) with OpenFOAM on BlueCrystal Phase 4 requires additional setup, which is not covered in this documentation.
```

## Running Jobs

OpenFOAM should be run on BlueCrystal Phase 4 by submitting jobs to Slurm, introduced in the following sections.

```{toctree}
---
includehidden: true
maxdepth: 1
titlesonly: true
---
single-node
multi-node
```
