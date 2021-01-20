# Bardin lab Bioinformatics Training - Day 3

## Part III - [Nextflow setup]()

[1. Managing environments with conda](https://github.com/nriddiford/Bioinformatics_training#4-working-with-rstudio)

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
