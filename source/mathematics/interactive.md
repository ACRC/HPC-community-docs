---
title: "Interactive sessions"
---

These are instructions on getting quick interactive sessions on BluePebble, assuming you already have login to this cluster and a project code. As this is primarily aimed for the School of Mathematics, we'll refer to the project code to be in the form MATHXXXXXX, but this could be in other format.

The School of Mathematics ringfenced a few of its nodes with the software Magma installed on them into the "magma" partition, and we also use this partition for quick interactive testing.

:::{important}
If you need to run something heavy that takes hours or days please remove any reference to the "magma" partition from the below.
:::

We use maple/xmaple as an example but comsol, magma, math/mathematica, etc work similarly.

- **If you don't need a graphical interface:**
1. Connect to the login node, as described [here](https://www.acrc.bris.ac.uk/protected/hpc-docs/connecting/index.html). For this your don't need X11 forwarding.
2. Once you are on the login node, do
```console
$ srun --account=MATHXXXXXX --partition=magma --mem=1gb --time=00:01:00 --pty bash -i
```
to get an interactive session on one of our ringfenced nodes for quick interactive sessions. (No heavy jobs are allowed to be run on the login node, hence this command.) Notice that the above gives you a terminal for 1 minute, obviously change this to what time you need and save your work often as your terminal will be killed after the requested time.
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
- **For graphical interface (GUI):**
1. Connect to the login node, as described [here](https://www.acrc.bris.ac.uk/protected/hpc-docs/connecting/index.html) including the X11 bits.
2. Once on the login node, do
```console
salloc --account=MATHXXXXXX --partition=magma --mem=1gb --time=00:01:00
```
again adjust the time from 1 minute to what you need, and please remove `--partition=magma` if you have a heavy job to run for hours or days. This will say something like
```console
salloc: Nodes bp1-compute169 are ready for job
```
3. Do
```console
ssh -X bp1-compute169
```
(or whichever node was allocated to you in the previous step); tab completion works. Then
```console
$ module load apps/maple
```
```console
$ xmaple
```
