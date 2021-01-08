# Bardin lab Bioinformatics Training - Day 2

## Part II - [Rstu-stu-studio](https://www.youtube.com/watch?v=r0qBaBb1Y-U){:target="_blank"}

[1. Working with Rstudio](https://github.com/nriddiford/Bioinformatics_training#4-working-with-rstudio)

### 1 Working with Rstudio
Like Atom, Rstudio is geared up to making things as easy as possibe. Whereas Atom is a text editor, where you can write code in lots of different languages, Rstudio is specically made for working with `R`.

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
