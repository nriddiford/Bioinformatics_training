# Bardin lab Bioinformatics Training - Day 3

## Part III - [Nextflow setup]()

[1. Managing environments with conda](https://github.com/nriddiford/Bioinformatics_training#part_3.md#1-managing-environments-with-conda)

### 1 Managing environments with conda
[Conda](https://docs.conda.io/en/latest/) is an environment management system that we will be using in our Nextflow pipeline.

Conda makes it really easy to make sure that you are all using the same versions of the programs that we'll use.

An example of how this can be a problem is seen when working with something like Adobe Illustrator. If I make a figure using Illustrator v6, and give it to one of you who has Illustrator v10, it will tell you that it was created with an earlier version, and that some things will be changed in the version that you're viewing. It might also tell you that some fonts that I used are not available on your computer, so the text might look different as well.

This is a pain when using Illustrator, but a nightmare when running bioinformatic programs. What happens if the version I have produces different results than the one you have? This is **no bueno**!

Conda helps us manage this by allowing us to create a space - an `environment` - on our computer where we can install a particular version of a program (or more typically, multiple different programs).

Conda `environments` can help us isolate **stuff**, so that it runs on my computer as it does on yours (or the server).

Let's set up a basic example to illustrate this:
**Note - this will only work if you have conda installed. We will deal with installation in the next session, for now just follow along with the video**

#### 1.1 Setting up a conda environment
Making an environment in conda is really easy by running `conda create`, but we will need to provide a few additional options:

```{bash}
-n  The name of your environment. E.g. nextflow
-c  The channel we want to get packages from. We will mostly be using
we then list the packages that we want to install in the new environment
```

To illustrate what we're doing we'll set up two different environments, and we'll install a different version of `python` in each.

#### 1.2 Environment 1 - python version 2.7.18
```{bash}
# Create a new environment 'test_1' containing python version 2.7.18
conda create -n test_1 -c bioconda python=2.7.18
# Activate this environment
conda activate test_1
# Check what version of python we have
python --version
# Python 2.7.18
```

#### 1.3 Environment 2 - python version 3.9.1
```{bash}
conda create -n test_2 -c bioconda python=3.9.1
conda activate test_2
python --version
# Python 3.9.1
```

### 2 Working on the server

We're going to run most of our anayses on the curie Calcsub server. All you really need to understand about using the server is that it is essentially just room full of computers that we can access, so that we don't have to run memory-expensive jobs on our laptops.

#### 2.1 Log onto the server
```{bash}
ssh yourusername@calcsub
```
You will be asked for your password (we can set it up to remember your password later) and then you should see a message letting you know that you're on the Calcsub server.

#### 2.2 Start a computing session
When you log on you are placed in your home directory. The difference here is that in your home directory, you have very little space to store files, so we don't want to do any actual analysis here. If this is the first time you have logged in, there won't be anything there:

```{bash}
pwd
ls -lth
```
The first thing we can do is to navigate to our analysis space, where you can actually store and analyse data.

For me this is located here: `/data/kdi_prod/project_result/948/01.00/Analysis`

```{bash}
# Go to the directory
cd /data/kdi_prod/project_result/948/01.00/Analysis

# Check where we are
pwd

# List the files and directories
ls -lth
```

If you can access this space, you should be able to see all of my Analysis, incuding the raw and processed sequencing data. This is where I will work from, and the first thing we will need to do is to launch a compute session. You can think of this as logging onto a specific computer within the cluster. This should basically always be the first thing that you do after logging onto the Calcsub server.

```{bash}
qsub -I

# Or we can put this in a file
echo "qsub -I -l mem=10GB" > ~/setup.sh
bash ~/setup.sh
```

Now that we're in a compute session, we are automatically taken back to our home directory, so let's get back to our analysis space so that we can start with nextflow:

```{bash}
cd /data/kdi_prod/project_result/948/01.00/Analysis
```

### 3 An introdution to nextflow
[Nextflow](https://www.nextflow.io) "enables scalable and reproducible scientific workflows using software containers. It allows the adaptation of pipelines written in the most common scripting languages."

As well as following on here, for those of you who might want to go deeper and start building your own pipelines, this video series (by the co-creater of nextflow) is excellent:

* [Nextflow training workshop - day 1](https://www.youtube.com/watch?v=8_i8Tn335X0)
* [Nextflow training workshop - day 2](https://www.youtube.com/watch?v=j5Xc8mUmDMc)
* [Nextflow training workshop - day 3](https://www.youtube.com/watch?v=xmNUtboTThA)
* [Nextflow training workshop - day 4](https://www.youtube.com/watch?v=XFrVtD-RPzY)
* [Nextflow training workshop - day 5](https://www.youtube.com/watch?v=IcMz6JE8n_M)


In brief, nextflow allows us to:

1. Run things in containers (e.g. conda environments) to ensure reproducibility
2. Parallelise your workflow (to speed things up)
3. Automate an entire pipeline to got from raw sequncing data to analysed data

We have already dealt with point `1`, but parellisation is an important concept that we can briefly discuss.

#### 3.1 Parallelisation

At it's most basic level a bioinformatics pipeline is analagous to a cooking recipe, where you might proceed as follows:

|   | Cooking                       | Bioinformatics                               |
|---|-------------------------------|----------------------------------------------|
| 1 | Buy ingredients               | Install tools                                |
| 2 | Boil water                    | Align reads to genome                        |
| 3 | Cook pasta in water           | Detect SNVs                                  |
| 4 | Drain pasta                   | Select somatic SNVs                          |
| 5 | Chop tomatoes                 | Detect structural variants                   |
| 6 | Chop garlic                   | Filter structural variants                   |
| 7 | Add tomatoes, garlic to sauce | Select for somatic structural variants       |
| 8 | Heat sauce                    | Annotate structural variants                 |
| 9 | Mix sauce with pasta          | Combine somatic SNVS and structural variants |






nextflow run nriddiford/nf-lohcator
