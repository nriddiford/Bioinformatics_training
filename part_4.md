# Bardin lab Bioinformatics Training - Day 4

## Part III - [Running Nextflow]()

[1. Running our first nextflow script](#1-running-our-first-nextflow-script)

### 1 Running our first nextflow script

#### 1.1 Setting up a conda environment
First, we want to create a conda environment from which we can run nextflow:

```{bash}
# Start a compute session
qsub -I -l mem=10GB
```

```{bash}
# Create a conda environment called 'nextflow'
conda create -n nextflow -c bioconda nextflow pandas
# Activate this environment
conda activate nextflow

# Run nextflow without any options
nextflow
```

#### 1.2 Clone the repository from github
All the script we need is in a [github repository](https://github.com/nriddiford/nf-lohcator)

```{bash}
# Go to the analysis directory
cd /data/kdi_prod/project_result/948/01.00/Analysis

# Clone the nf-lohcator repository
git clone https://github.com/nriddiford/nf-lohcator
cd nf-lohcator

ls -lth
```
**Note, we can actually skip this step, and instead run nextflow directly from github (without having to clone the repository first, by using `nextflow run nriddiford/nf-lohcator`)**
