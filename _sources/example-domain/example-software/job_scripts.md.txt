---
title: "Job scripts"
---

## Serial Example Software job
Small scale Example Software jobs can be run in serial, using a single core.
Here is an example where Example Software processes the input file `example.in`, producing output `example.out`. 

```{code-block} bash
---
linenos: true
---
#!/bin/bash

#SBATCH --job-name=example_software
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --mem=1G

module load apps/example-software/1.0.0

INPUT_FILE=example.in
OUTPUT_FILE=example.out

example-software ${INPUT_FILE} > ${OUTPUT_FILE}
```

You may need to adjust the walltime (`--time`) and memory (`--mem`) requested, depending on how demanding your simulation is.

### Array jobs
A common use case for Example Software on HPC is to run many small, single-core, jobs, each with different input parameters.
The results of the jobs can then be collected and statistically analysed.
This can be achieved using an [array job](https://www.acrc.bris.ac.uk/protected/hpc-docs/job_types/array.html#array-jobs), for example:

```{code-block} bash
---
linenos: true
---
#!/bin/bash

#SBATCH --job-name=example_software
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --mem=1G
#SBATCH --array=0-99

module load apps/example-software/1.0.0

INPUT_FILE="example_${SLURM_ARRAY_TASK_ID}.in"
OUTPUT_FILE="example_${SLURM_ARRAY_TASK_ID}.out"

example-software ${INPUT_FILE} > ${OUTPUT_FILE}
```

In this example, an array of jobs numbered 0 to 99 is created, each running the job script with a different array index (`SLURM_ARRAY_TASK_ID`).
The array index is used to select a input file (`example_0.in` to `example_99.in`) and to name the corresponding output file (`example_0.out` to `example_99.out`).

## Parallel Example Software job
For larger scale jobs, per-job parallelism may be useful. Example Software can make use of threaded parallelism via OpenMP on a single node. In the following example, the `OMP_NUM_THREADS` environment variable is set to the number of CPUs per task requested (in this case 28, as this is how many cores there are per BlueCrystal 4 compute node). The number of threads is also set using the Example Software command line option `-n`.  

```{code-block} bash
---
linenos: true
---
#!/bin/bash

#SBATCH --job-name=example_software_omp
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=28
#SBATCH --time=1:00:00
#SBATCH --mem=1G

module load apps/example-software/1.0.0

export OMP_NUM_THREADS="${SLURM_CPUS_PER_TASK}"

INPUT_FILE=example.in
OUTPUT_FILE=example.out

example-software -n ${OMP_NUM_THREADS} ${INPUT_FILE} > ${OUTPUT_FILE}
```