# Bardin lab Bioinformatics Bonanza

## Part I - Weclome to the Jungle

### 1. Getting set up

##### 1.1 Download & install R Studio
*  https://rstudio.com/products/rstudio/download/

##### 1.2 Download & install Atom
*  https://atom.io/download/mac

##### 1.3 Download & install iTerm2
*  https://iterm2.com
*  Make sure you pin this to your dock!

##### 1.4 Configure proxies
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
