# Check where we are [R version of pwd]:
getwd()

# Set the directory to the 'Bioinformatics' directory using setwd() [R version of cd]
# If you're in an R project, you'll already be in the right directory
# setwd("~/Desktop/Bioinformatics")

# Uncomment these to install 
# install.packages('ggplot2')
# install.packages('dplyr')
# install.packages('plyr')

# You intall packages using the 'install.package()' function. You only need to do this once
install.packages('tidyverse')
install.packages('data.table')

# load ('source') all of the code in 'allelefreqs.R':
source('../alleleFreqs/script/alleleFreqs.R')

# Parse a varscan SNP file and save it into a dataframe called R13_snps_df
R13_snps_df <- parseVarscan(file = 'data/varscan/D106R13.snp.hc')

# Use the R function 'head()' to view the first 10 lines of 'R13_snps_df'
head(R13_snps_df)

# Call the function 'head()'  with the argument 'n = 3' to see the first 3 lines
head(R13_snps_df, n = 3)

# Save this to a variable 'three_lines'
three_lines <- head(R13_snps_df, n = 3)

# See what the varibale contains
head(three_lines)

# We can also use the function 'View()' to open a new panel in RStudio where we can see the dataframe in a spreadsheet like view:
View(three_lines)

# Plot the allelefrequeny of snps for sample 'D106R13'
plotFreq(df = R13_snps_df, sample = 'D106R13')


