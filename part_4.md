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

#### 1.2 Run nextflow
To test that things are working, we can run a built in test pipeline called `hello`. This pipeline can be found [here](https://github.com/nextflow-io/hello).
```{bash}
nextflow run hello
```

We should see somethig like this:

```
N E X T F L O W  ~  version 20.07.1
Pulling nextflow-io/hello ...
downloaded from https://github.com/nextflow-io/hello.git
Launching `nextflow-io/hello` [peaceful_miescher] - revision: e6d9427e5b [master]
executor >  local (4)
[ad/f28bf8] process > sayHello (3) [100%] 4 of 4 ✔
Bonjour world!

Ciao world!

Hola world!

Hello world!
```

On the 6th line of this output, we can see what has actually happend under the hood. Nextflow calls `steps` in a pipeline `processes`, and here we can see that a `process` called `sayHello` has completed `[100%]` and that it has been run `4 of 4` times.

Now that nextflow is up and running, let's move on to the Bardin lab [loh detection pipeline](https://github.com/nriddiford/nf-lohcator)

#### 1.3 Clone the lohcator repository from github
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

#### 1.4 Setting up the sample plan file
Now that we're in a nextflow conda environment, and located in a directory containing nextflow scripts (e.g. `main.nf`) we're ready to get started!

The first thing that we need to do is to make a file that we will use as input to nextflow. This will make sure that nextflow knows where to look to find our sequencing reads, and how samples are paired as tumour-normal.

To do this, we need to run a small program called `write_files.py` that's located in `bin/`.

```{bash}
python bin/write_files.py
```

Here we can see that we need to provide 4 options:

```{bash}
--out_file  # The name of the sample plan to output
--config    # The tumour-normal mapping file
--directory # The directory containing our sequencing reads
--extension # The extention to look for in the directory
```

#### 1.4.1 `--directory`
At a minimum we need to specify the `--directory` where are reads are located. To test the pipeline on the server I have created some highly downsampled reads located in `/data/kdi_prod/project_result/948/01.00/Analysis/Trimmo_out/HUM/nextflow`.

Let's have a look at what's in here: `ls -1 /data/kdi_prod/project_result/948/01.00/Analysis/Trimmo_out/HUM/nextflow`

```{bash}
HUM-1.dwnsamp.R1.fq.gz
HUM-1.dwnsamp.R2.fq.gz
HUM-3.dwnsamp.R1.fq.gz
HUM-3.dwnsamp.R2.fq.gz
HUM-4.dwnsamp.R1.fq.gz
HUM-4.dwnsamp.R2.fq.gz
HUM-6.dwnsamp.R1.fq.gz
HUM-6.dwnsamp.R2.fq.gz
HUM-7.dwnsamp.R1.fq.gz
HUM-7.dwnsamp.R2.fq.gz
HUM-9.dwnsamp.R1.fq.gz
HUM-9.dwnsamp.R2.fq.gz
```

So, we have 6 samples (`HUM-1 - HUM-9`), with `foward` (`R1`) and `reverse` (`R2`) reads split between two files. This is how the data you get from your sequencing runs will look like.

#### 1.4.2 `--extension`
We also need to give the file extention, which in our case is `fq.gz`

#### 1.4.3 `--config`
We must also specify how to pair tumour and normal samples. To do this, we have to specify a file that we've made. The default is in `data/samples2.txt`. Let's have a look at this: `more data/samples2.txt`.

```{bash}
tumour	normal
A373R1	A373R2
A373R3	A373R4
A373R5	A373R6
...
HUM-1	HUM-3
HUM-4	HUM-6
HUM-7	HUM-9
```

The format of this file is tumour sample in column 1 (`tumour`) and the paired normal sample in column 2 (`normal`). These two columns are separated by a `tab`. I have made this pairing for all the samples we've sequenced so far, but you can make your own too, and will need to add sample names to this as your sequence more.

Let's run `write_files.py` and save the output to a file called `my_sample_plan_tiny_cluster.csv`:

```{bash}
python bin/write_files.py \
  --directory /data/kdi_prod/project_result/948/01.00/Analysis/Trimmo_out/HUM/nextflow \
  --extension fq.gz \
  --config data/samples2.txt \
  --out_file my_sample_plan_tiny_cluster.csv
```

```{text}
Looking for '*fq.gz' files in /data/kdi_prod/project_result/948/01.00/Analysis/Trimmo_out/HUM/nextflow
Writing sample plan to 'my_sample_plan_tiny_cluster.csv'
-> HUM-1 is paired with HUM-3
-> HUM-4 is paired with HUM-6
-> HUM-7 is paired with HUM-9
```

#### 1.5 Running nextflow
Now that we have our sample plan set up, we can run nextflow using this as input.

```{bash}
nextflow run main.nf -profile cluster,multiconda --samplePlan my_sample_plan_tiny_cluster.csv -resume
```

Another very useful feature that nextflow gives us is to rerun a pipeline and skip any steps that have already been completed. To do this, we need to run with the `-resume` option:

```{bash}
nextflow run main.nf -profile cluster,multiconda --samplePlan my_sample_plan_tiny_cluster.csv -resume
```

```{bash}
nextflow run main.nf -profile cluster,submit,multiconda --samplePlan my_sample_plan_tiny_cluster.csv
```
