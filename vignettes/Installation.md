Carry out the following steps to install the R package/s to extract and
analyze HITChip data. Note that admin rights may be required to complete
the installation, and the data is protected by password/IP combinations.
Kindly report any problems to [developers](Contact).

### Installing R

1.  Install [R](http://www.r-project.org/)
2.  Consider installing [RStudio](http://rstudio.org); GUI for R
3.  If you use Windows, install also
    [RTools](http://cran.r-project.org/bin/windows/Rtools/) (version
    corresponding to your R version)

### Install dependent packages

Open R. Then Install dependencies from the Tools panel, or run the
following commands:

    source("http://www.bioconductor.org/biocLite.R")
    biocLite(c("ade4", "fastcluster", "df2json", "rjson", "gplots", "devtools", "ggplot2","MASS","minet","mixOmics", "plyr","qvalue","reshape2","RPA","svDialogs","vegan","WGCNA"))

If some of these installations fail, ensure from the tools panel that
you have access to CRAN and Bioconductor repositories. If you cannot
install some of these packages, some functionality in microbiome may not
work.

### Install or update the microbiome package

The microbiome package contains general data analysis routines.
Install/Update the package in R:

    library(devtools) # Load the devtools package
    install_github("microbiome/microbiome") # Install the package
    library(microbiome) # Test loading the package

### Loading the package

Once the package has been installed, you can load it in R with:

    library(microbiome)  

Install HITChipDB package (for developers only)
-----------------------------------------------

The HITChipDB package contains additional routines to fetch and
preprocess HITChip (or MIT/PITChip) data from the MySQL database.
Install the package with the following installation commands in R:

    library(devtools) # Load the devtools package
    install_github(repo = "HITChipDB", username = "microbiome") # Install the package
    # Also install RMySQL, multicore and tcltk !
    # Test installation by loading the microbiome package in R
    library("HITChipDB")
