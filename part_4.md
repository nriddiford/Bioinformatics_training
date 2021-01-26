# Bardin lab Bioinformatics Training - Day 4

## Part III - [Running Nextflow]()

[1. Running our first nextflow script](#1-managing-environments-with-conda)

### 1 Running our first nextflow script

#### 1.1 Setting up a conda environment

First, we want to create a conda environment from which we can run nextflow:

```{bash}
# Start a compute session
qsub -I -l mem=10GB

# Create a conda environment called 'nextflow'
conda create -n nextflow -c bioconda nextflow pandas
# Activate this environment
conda activate nextflow

# Run nextflow without any options
nextflow
```


# Go to the analysis directory
cd /data/kdi_prod/project_result/948/01.00/Analysis

# Go to the nf-lohcator github repositroy
cd nf/nf-lohcator
ls -lth


nextflow run nriddiford/nf-lohcator
