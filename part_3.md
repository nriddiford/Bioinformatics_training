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

 338  conda create -n test_1 "python<=3"
 340  conda create -n test_1 "python<3"
 342  conda activate test_1
 351  conda activate test_1
 352  conda deactivate

#### 1.1 Start a new project
Open Rstudio and from the `File` menu select `New Project`, then `Existing Directory`. Navigate to the directory `Bioinformatics_training` and click `Create Project`.

This is similar to what we've just done in Atom. Rstudio knows that we're in a Github repository (`Bioinformatics_training`), and provides us with some tools to work with git.

#### 1.2 The Rstudio windows
The window is split into four differnt panes (although you might only see three right now).

##### The file browser (**bottom right**)
This panel has a few tabs, but for the moment let's just focus on the first on, where you'll see the files in the directory. Click on `1_plotting_loh.R` and then on `2_plotting_cnv.R`. These should open up in the top left panel.

##### The text editor (**top left**)
This panel shows you tabs of files that you're working on. Select the `1_plotting_loh.R` tab and put your cursor on line 2. On the top left corner of this panel, you should see a button that says `run`. Click this to run the line (or selection of lines) of code that our cursor is on. `cmd` + `enter` is a shortcut to do the same thing. Lines that start with `#` are comments, and are not run. Highlight lines 1 - 5 and click `run` again and notice that only line 2 is executed.

##### The R terminal (**bottom left**)
Directly below shows the `R` console. This is the `R` version on the command line, where you can run `R` commands. Type `getwd()` and press `enter` to run the `R` version of `pwd`. Try running `pwd` and see what happens!

##### The R enviroment (**top right**)
Like the file browser panel, this shows a few differnt things. For now, we'll just note that there's a git tab. As we're in an `R` project, Rstudio knows that this is a git repository. Click on the `git` tab, and click on `Pull`. This does **exactly** the same as either running `git pull` on the command line, or right clicking `Fetch` and selcting `pull` in Atom.

#### 1.3 Rstudio projects
Apart from integrating `git` commands, another huge benefit of opening a directory as an `R` project is that Rstudio will save the state of what you're doing. Quit Rstudio, and from the command line navigate to the `Bioinformatics_training` repository and type:

```
open Bioinformatics_training.Rproj
```

This will now open the project we started in exactly the same state that we left it in - very handy!

#### 1.4
