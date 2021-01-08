# Intalling a package from Github
# First, install 'devtools' which makes this sort of thing easy
install.packages('devtools')

# Load the library. And then use the `install_github()` function to install our pacakge:

library(devtools)
install_github("nriddiford/cnvPlotteR")
library(cnvPlotteR)

# Get help for a function within this package
?cnvPlotteR::plotCoverage()

# Let's plot the read coverage for one sample
cnvPlotteR::plotCoverage(counts_file = 'data/cnv_seq/B241R61.tagged.SC.hits.filt-vs-B241R62.tagged.SC.hits.filt.window-50000.minw-4.count')

# Let's just plot the X chromosome
cnvPlotteR::plotCoverage(counts_file = 'data/cnv_seq/B241R61.tagged.SC.hits.filt-vs-B241R62.tagged.SC.hits.filt.window-50000.minw-4.count',
                         chroms = "X")

# Now let's plot the Notch locus
# Have a look at the help:
?cnvPlotteR::regionPlot()

# Now plot
cnvPlotteR::regionPlot(cnv_file = "data/cnv_seq/B241R61.tagged.SC.hits.filt-vs-B241R62.tagged.SC.hits.filt.window-500.minw-4.cnv")

cnvPlotteR::regionPlot(cnv_file = "data/cnv_seq/B241R61.tagged.SC.hits.filt-vs-B241R62.tagged.SC.hits.filt.window-500.minw-4.cnv",
                        ylim = c(-7,7), write = T)

