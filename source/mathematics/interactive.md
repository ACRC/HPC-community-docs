---
title: "Interactive sessions"
---

These are instructions on getting quick interactive sessions on BluePebble, assuming you already have login to this cluster and a project code. As this is primarily aimed for the School of Mathematics, we'll refer to the HPC project code to be in the form MATHXXXXXX, but this could be in a different format for other faculties/departments.

The School of Mathematics ringfenced a few of its nodes with the software [Magma](http://magma.maths.usyd.edu.au/magma/) installed on them into the "magma" partition, and we also use this partition for quick interactive testing.

:::{important}
The "magma" partition is for quick interactive testing besides making the software Magma available here. If you need to run a large or long-running job (e.g. that takes hours or days) that does not require the Magma package, please remove any reference to the "magma" partition from the below and use one of the other partitions on BluePebble, such as the default "compute" partition.
:::

We use maple/xmaple as an example but comsol, magma, math/mathematica, etc work similarly.

## If you don't need a graphical interface
1. Connect to the login node, as described [here](https://www.acrc.bris.ac.uk/protected/hpc-docs/connecting/index.html). For this you don't need X11 forwarding.
2. Once you are on the login node, do
   ```console
   $ srun --account=MATHXXXXXX --partition=magma --mem=1G --time=00:01:00 --pty bash -i
   ```
   to get an interactive session on one of our ringfenced nodes for quick interactive sessions. Login nodes are intended for small scale interactive work. This command allows us to create an interactive session on a compute node for more intensive interactive work. Notice that the above gives you a terminal for 1 minute with 1 GB memory and the default number of CPU cores (1) -- please change this to specify the time and resources you need. Also, remember to save your work often as your terminal will be killed after the requested time.
   :::{tip}
   Without `--partition=magma` you are in the general BluePebble pool with far more nodes but usually longer waiting times, but this is the place to submit longer, heavy computations rather than our "magma" partition.
   :::
3. In the interactive session do
   ```console
   $ module load apps/maple
   ```
   (tab works for autocompletions). Then launch
   ```console
   $ maple
   ```
## For graphical interface (GUI)
1. Connect to the login node, as described [here](https://www.acrc.bris.ac.uk/protected/hpc-docs/connecting/index.html) including the X11 bits.
2. Once on the login node, do
   ```console
   $ salloc --account=MATHXXXXXX --partition=magma --mem=1G --time=00:01:00
   ```
   again adjust the command to request the time and resources to what you need, and please remove `--partition=magma` if you have a heavy job to run for hours or days. This will say something like
   ```console
   salloc: Pending job allocation 6434337
   salloc: job 6434337 queued and waiting for resources
   salloc: job 6434337 has been allocated resources
   salloc: Granted job allocation 6434337
   salloc: Waiting for resource configuration
   salloc: Nodes bp1-compute169 are ready for job
   ```
   In some cases you may need to wait for this allocation to start (e.g., if not using the "magma" partition).
3. Do
   ```console
   $ ssh -X bp1-compute169
   ```
   (using whichever node was allocated to you in the previous step); tab completion works here too. Then
   ```console
   $ module load apps/maple
   ```
   ```console
   $ xmaple
   ```
