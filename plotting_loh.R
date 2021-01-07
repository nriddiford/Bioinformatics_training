# Check where we are:
getwd()

# Set the directory to the 'allelefreqs' github repository
setwd('')

# load ('source') all of the code in 'allelefreqs.R':
source('script/alleleFreqs.R')

# Parse a varscan SNP file and save it into a dataframe called R13_snps_df
R13_snps_df <- parseVarscan(file = 'data/D106R13.snp.hc')

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

#
plotDen(df = R13_snps_df)



