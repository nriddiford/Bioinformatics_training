# Bardin lab Bioinformatics Bonanza

## Part I - Weclome to the Jungle

### 1. Getting set up

#### 1.1 Download & install R Studio
*  https://rstudio.com/products/rstudio/download/

#### 1.2 Download & install Atom
*  https://atom.io/download/mac

#### 1.3 Download & install iTerm2
*  https://iterm2.com
*  Make sure you pin this to your dock!

#### 1.4 Configure proxies
Open iTerm2 and copy and paste the following into the console:

```{bash}
env_file=''
if [ -f "~/.zshenv" ]
then
    env_file=~/.zshenv
else
    env_file=~/.bash_profile
fi

renv_file=~/.Renviron
touch $env_file $renv_file

if grep '#proxysetup' $env_file
then
    echo "Already configured proxies in $env_file"
else
    echo "Configuring proxies in $env_file"
    echo "#proxysetup
http_proxy=http://www-cache:3128
https_proxy=https://www-cache:3128
ftp_proxy=http://www-cache:3128
export http_proxy https_proxy ftp_proxy

echo \"
http_proxy=www-cache:3128
https_proxy=www-cache:3128
\" > $renv_file

function home() {
  unset http_proxy https_proxy ftp_proxy
  git config --global --unset http.proxy
  echo "" > $renv_file
  echo "Unsettiing proxies"
}

function work(){
    source $env_file
}" | cat - $env_file > .tempenv && mv .tempenv $env_file
fi

source $env_file
```

This sets up your computer so that you will be able to work with Rstudio and github from home or at the Curie (behind the proxy). If you are working from home, either use a VPN to connect to the Curie network, or run the command `home` to turn off your proxy, or `work` to turn it back on.

This is important as it will allow you to download and install libraries in R.

### 2. Some basic command line navigation

#### 2.1 Hello world
Now that you're set up to download files from behind the proxy, we can enter the world of the command line. Open iTerm2 and type the following and then press `return`:

```
echo "hello world"
```

This is you using the command line! When you run programs either on your laptop or on the cluster, this is where you do it.

Here are some great resources for command line navigation:
* [Terminal Cheat Sheet for Mac](https://github.com/0nn0/terminal-mac-cheatsheet#english-version) - handy guide in multiple languages!

#### 2.2 Navigation
One of things you'll need to get comfortable with is navigating your computer by using the command line. To run any command/script type something in, and then press `return`. Fist, let's see where we are.

Type `pwd` to see your current location. We're going to be downloading some folders (`'directories'`) from Github, so let's navigate to a sensible place. Run the following commands, line by line:


Navigate to your 'home' (`~`) directory using the 'change directory' command (`cd`):

```
cd ~
```

Let's move to our desktop:
```
cd Desktop/
```

Check where we are by printing the woring directory (`pwd`):
```
pwd
```

We could have also done:
```
cd ~/Desktop
```

Now we want to use the 'make directory' command (`mkdir`) that will contain all the folders and files we're going to be working with. You can choose your own name, or use:

```mkdir Bioinformatics```

Now let's move ourselves into this directory:
```
cd Bioinformatics/
```

Note that this only works from the Desktop. We can type the following to get here from anywhere on our computer:
```
cd ~/Desktop/Bioinformatics
```

**When you're typing commands, you can press tab at anytime to autocomplete the command (much quicker!)**

Check where we are:
```
pwd
```

Make a text (.txt) file
```
touch welcome.txt
```

Open this in Atom
```
atom welcome.txt
```

Atom is a text editor where you can write code, text or lyrics to songs that are stuck in your head for some reason. Let's fill this file with some catchy '80s rock:

```
Welcome to the jungle
Weve got fun n games
We got everything you want
Honey, we know the names
We are the people that can find
Whatever you may need
If you got the money, honey
We got your disease
```

... and save the file


#### 2.3 Command line essentials
Just to get you a bit more familiar with using some common commands, let's mess around with this file a bit. Run the following commands, line by line:

Make sure we're in the right place
```
cd ~/Desktop/Bioinformatics
```

Preview the file using the `more` command:
```
more welcome.txt
```

Preview the file using the `less` command:
```
less welcome.txt
```

Preview the first 10 lines of the file using the `head` command:
```
head welcome.txt
```

Preview the first 3 lines of the file using the `head` command with options:
```
head -n 3 welcome.txt
```

This is an example of running a command with an argumnent (an option). You'll do this a lot! `head` is a program that someone's written to do a very speciic thing. Let's see what that is by viewing the manual (`man`):
```
man head
```

This tells us that the `-n` is an argument that specifies how many lines to show, so `head -n 3 welcome.txt` will give us the first 3 lines of `welcome.txt`

Let's see how many lines are in `welcome.txt` using `wc -l`:
```
wc -l welcome.txt
```

Now, let's use a `pipe`, to send the output from our `head` command to the `wc` command:
```
head -n 3 welcome.txt | wc -l
```

This is a really handy way of 'chaining together' commands, without having to run them one by one. Instead, we could have done:
```
head -n 3 welcome.txt > three_lines.txt
wc -l three_lines.txt
```

Here the `>` directs the output from `head` into a new file `three_lines.txt`.

**Note: It's REALLY important that file names (and directories) DO NOT contain spaces, or quotation marks or any other punctuation. One convention is to separate words using '_'**

Let's chck that we've created a file by listing (`ls`) the contents of the current working directory:
```
ls
```

We can also use some arguments to make this a bit easier to read:
```
ls -lh
```

You can see what these arguments are doing by cheking out the manual for `ls`
```
man ls
```

Now, rather than making a new file, let's append (`>>`) something to the `three_lines.txt` file:
```
head -n 2 welcome.txt >> three_lines.txt
```

Let's see what we end up with:
```
ls -lh
more three_lines.txt
```

Now we have a file that contains the original 3 lines (from `head -n 3`) plus two new lines that we've appended using `head -n 2`. We should rename this file by moving (`mv`) the moving the file to a different location! Let's rename it `five_lines.txt`

```
mv three_lines.txt five_lines.txt
ls -lh
```

Now let's copy the contents of this file to a new file called `five_lines_2.txt`
```
cp five_lines.txt five_lines_2.txt
```

### 3. Getting code from Github

#### 3.1 Get code from github
Open iTerm2 and type the following:

```
git clone https://github.com/nriddiford/alleleFreqs.git
```
