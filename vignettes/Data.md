### HITChip Atlas data set

An example data set from [Lahti et al. Nat. Comm. 5:4344,
2014](http://www.nature.com/ncomms/2014/140708/ncomms5344/full/ncomms5344.html)
contains large-scale profiling of 130 genus-like taxa across 1006 normal
western subjects. This data set is readily available for download from
the open [Data Dryad](http://doi.org/10.5061/dryad.pk75d) repository.

Load the HITChip Atlas microbiome profiling data in R.

    # Load Dryad tools
    library("rdryad") # Use the install.packages("rdryad") if package not available

    # Define the data URL
    url <- download_url('10255/dryad.64665')

    # Download the data
    data <- read.table(url, sep = "\t", row.names = 1, header = TRUE)

    # Fix some broken names from the original release..
    # ie. replace 'Clostridium..sensu.stricto.les' with 'Clostridiales'
    colnames(data) <- gsub("Clostridium..sensu.stricto.les", "Clostridiales", colnames(data))

    # Convert to matrix 
    data <- as.matrix(data)

Load the HITChip Atlas metadata in R. Note that some individuals have
multiple time points.

    url <- download_url('10255/dryad.64666')
    meta <- read.table(url, sep = "\t", row.names = 1, header = TRUE)

    # Add SampleIDs as a separate column from rownames
    meta$SampleID <- rownames(meta)

    # Order BMI groups in correct order
    # (see README at http://datadryad.org/resource/doi:10.5061/dryad.pk75d for details)
    meta$BMI_group <- factor(meta$BMI_group, levels = c("underweight", "lean", "overweight", "obese", "severeobese", "morbidobese"))
    meta$SubjectID <- factor(meta$SubjectID)

Collect the atlas data and metadata into a single object:

    atlas <- list(microbes = data, meta = meta)

### PeerJ example data set

An example data set from Lahti et al. [PeerJ 1:e32,
2013](https://peerj.com/articles/32/) concerns associations between
human intestinal microbiota and blood serum lipids. Load the data in R:

    library(microbiome)
    data(peerj32)
    names(peerj32)

    ## [1] "lipids"   "microbes" "meta"

### Load example data

Load simulated example data of the human gut microbiota. With HITChip,
[fRPA](http://www.computer.org/csdl/trans/tb/2011/01/ttb2011010217-abs.html)
is the recommended preprocessing method.

    library(microbiome)
    # Define data path (you can replace data.directory with your own path)
    data.directory <- system.file("extdata", package = "microbiome")
    print(data.directory)

    ## [1] "/home/antagomir/R/x86_64-pc-linux-gnu-library/3.1/microbiome/extdata"

    # Read HITChip data matrix (genus-level (L2) log10 values)
    level <- "L1"
    method <- "frpa"
    l1.data <- read.profiling(level = level, 
                           method = method, 
                               data.dir = data.directory, 
                               log10 = TRUE)  

    # Read HITChip probe level data (absolute values - no log10)
    oligo.data <- read.profiling(level = "oligo", 
                                 data.dir = data.directory, 
                     log10 = FALSE)  

    # Probe-taxon mapping table
    phylogeny.info <- read.profiling(level = "phylogeny.full", 
                                 data.dir = data.directory)

    # Phylogeny that is used to summarize the probes to phylotype/genus/phylum levels
    phylogeny.info.filtered <- read.profiling(level = "phylogeny.filtered", 
                                 data.dir = data.directory)

### Reading metadata

An easy way to provide sample metadata is to create a tab-separated
metadata file. You can create the file in Excel and export it to
tab-separated csv format. The standard (and self-explanatory) field
names include 'sampleID', 'time', 'subjectID', 'group', 'gender',
'diet', 'age'. You can leave these out or include further fields. See
this [example
file](https://raw.github.com/microbiome/microbiome/master/inst/extdata/metadata.xls).
Read the metadata with:

    # Read simulated example metadata
    library(gdata)
    metadata.file <- paste(data.directory, "/metadata.xls", sep = "")
    metadata <- read.xls(metadata.file, as.is = TRUE)
    rownames(metadata) <- metadata$sampleID

### Estimating relative abundancies

Estimate relative abundance of the taxa in each sample. Note: the input
data set needs to be in absolute scale (not logarithmic).

    rel <- relative.abundance(oligo.data, det.th = min(na.omit(oligo.data)))
