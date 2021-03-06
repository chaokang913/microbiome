---
title: "microbiome vignette"
author: "Leo Lahti and Jarkko Salojarvi"
date: "2015-02-09"
bibliography: 
- bibliography.bib
- references.bib
output: 
  md_document:
    variant: markdown_github
---
<!--
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteIndexEntry{microbiome tutorial}
  %\usepackage[utf8]{inputenc}
-->




microbiome R package
===========

The microbiome package contains general-purpose tools for microarray-based analysis of microbiome profiling data sets in R (R Core Team, 2013); also relevant (Venables and Ripley, 2002)


### How to start 

Example on reproducible document generation:  

 * [Minimal example](Template.md)  
 * [Example workflow](Atlas.md)

### Installation, example data sets and preprocessing
* [Installing R tools](Installation.md)

### Data
* [Download example data sets](Data.md)
* [Extract data from HITChip database](https://github.com/microbiome/HITChipDB/blob/master/vignettes/vignette.md)
* [Get phylogeny](Phylogeny.md)

### Visualization and related tools

Download some [example data sets](Data.md) to try these tools:

* [Barplots](Barplots.md)
* [Boxplots](Boxplots.md)
* [Density](Density.md)
* [Heatmaps](Heatmap.md)
* [Motion charts](Motionchart.md)
* [Oligo heatmap](Oligoheatmap.md)
* [PCA and other ordination/projection methods](PCA.md)
* [Cross hybridization](Crosshyb.md)

### Clustering 
* [Bimodality](Bimodality.md)
* [Clustering](Clustering.md)

### Microbiota composition
* [Core microbiota](Core.md)
* [Diversity](Diversity.md)
* [Probe level studies](Probelevel.md)
* [RelativeAbundance](RelativeAbundance.md)
* [Stability](Stability.md)

### Linear models, comparisons, and association studies
* [Linear models](limma.md)
* [Pairwise comparisons](Comparisons.md)
* [Cross correlations](Crosscorrelation.md)

### Other statistical analysis
* [ROC curves](ROC.md)
* [RDA](RDA.md)

### Output
* [Producing output files and figures](Output.md)

### Misc
* [Miscellaneous](misc.md)

### Licensing and Citations

This work can be freely used, modified and distributed under the 
[Two-clause FreeBSD license](http://en.wikipedia.org/wiki/BSD\_licenses).

Kindly cite the work as 'Leo Lahti and Jarkko Salojarvi
(2014). microbiome R package. URL: http://microbiome.github.com'.


### Dependencies

The package utilizes tools from a number of other CRAN and
Bioconductor extensions, including:

 * df2json (Caballero, 2013)
 * rjson (Couture-Beil, 2014)
 * ade4 (Dray and Dufour, 2007; Chessel, Dufour, and Thioulouse, 2004; Dray, Dufour, and Chessel, 2007)
 * mixOmics (Dejean, Gonzalez, Monget, Coquery, Yao, Liquet, and Rohart, 2014)
 * RCurl (Temple Lang, 2014)
 * vegan (Oksanen, Blanchet, Kindt, Legendre, Minchin, O'Hara, Simpson, Solymos, Stevens, and Wagner, 2015)
 * reshape (Wickham and Hadley, 2007)
 * WGCNA (Langfelder and Horvath, 2008; Langfelder and Horvath, 2012)
 * ggplot2 (Wickham, 2009)
 * RPA (Lahti, Torrente, Elo, Brazma, and Rung, 2013)
 * minet (Meyer, Lafitte, and Bontempi, 2008)
 * fastcluster (Müllner, 2013)
 * plyr (Wickham, 2011)


### References



[1] N. Caballero. _df2json: Convert a dataframe to JSON_. R
package version 0.0.2. 2013. <URL:
http://CRAN.R-project.org/package=df2json>.

[2] D. Chessel, A. Dufour and J. Thioulouse. "The ade4 package-I-
One-table methods". In: _R News_ 4 (2004), pp. 5-10.

[3] A. Couture-Beil. _rjson: JSON for R_. R package version
0.2.15. 2014. <URL: http://CRAN.R-project.org/package=rjson>.

[4] S. Dejean, I. Gonzalez, K. L. C. w. c. f. P. Monget, et al.
_mixOmics: Omics Data Integration Project_. R package version
5.0-3. 2014. <URL: http://CRAN.R-project.org/package=mixOmics>.

[5] S. Dray and A. Dufour. "The ade4 package: implementing the
duality diagram for ecologists". In: _Journal of Statistical
Software_ 22.4 (2007), pp. 1-20.

[6] S. Dray, A. Dufour and D. Chessel. "The ade4 package-II:
Two-table and K-table methods." In: _R News_ 7.2 (2007), pp.
47-52.

[7] L. Lahti, A. Torrente, L. L. Elo, et al. "A fully scalable
online-preprocessing algorithm for short oligonucleotide
microarray atlases". In: _Nucleic Acids Research_ 41 (10 2013).
R/BioC:
http://bioconductor.org/packages/release/bioc/html/RPA.html, p.
e110. <URL: http://nar.oxfordjournals.org/content/41/10/e110>.

[8] P. Langfelder and S. Horvath. "Fast R Functions for Robust
Correlations and Hierarchical Clustering". In: _Journal of
Statistical Software_ 46.11 (2012), pp. 1-17. <URL:
http://www.jstatsoft.org/v46/i11/>.

[9] P. Langfelder and S. Horvath. "WGCNA: an R package for
weighted correlation network analysis". In: _BMC Bioinformatics_
(2008), p. 559.

[10] P. E. Meyer, F. Lafitte and G. Bontempi. "MINET: An open
source R/Bioconductor Package for Mutual Information based Network
Inference". In: _BMC Bioinformatics_ 9 (2008). <URL:
http://www.biomedcentral.com/1471-2105/9/461>.

[11] D. Müllner. "fastcluster: Fast Hierarchical, Agglomerative
Clustering Routines for R and Python". In: _Journal of Statistical
Software_ 53.9 (2013), pp. 1-18. <URL:
http://www.jstatsoft.org/v53/i09/>.

[12] J. Oksanen, F. G. Blanchet, R. Kindt, et al. _vegan:
Community Ecology Package_. R package version 2.2-1. 2015. <URL:
http://CRAN.R-project.org/package=vegan>.

[13] R Core Team. _R: A language and environment for statistical
computing_. Vienna, Austria: R Foundation for Statistical
Computing, 2013. ISBN: ISBN 3-900051-07-0. <URL:
http://www.R-project.org/>.

[14] D. Temple Lang. _RCurl: General network (HTTP/FTP/...) client
interface for R_. R package version 1.95-4.5. 2014. <URL:
http://CRAN.R-project.org/package=RCurl>.

[15] W. N. Venables and B. D. Ripley. _Modern Applied Statistics
with S_. fourth. New York: Springer, 2002. ISBN: ISBN .

[16] H. Wickham. _ggplot2: elegant graphics for data analysis_.
Springer New York, 2009. ISBN: 978-0-387-98140-6. <URL:
http://had.co.nz/ggplot2/book>.

[17] H. Wickham. "The Split-Apply-Combine Strategy for Data
Analysis". In: _Journal of Statistical Software_ 40.1 (2011), pp.
1-29. <URL: http://www.jstatsoft.org/v40/i01/>.

[18] Wickham and Hadley. "Reshaping data with the reshape
package". In: _Journal of Statistical Software_ 21.12 (2007).
<URL: http://www.jstatsoft.org/v21/i12/paper>.

### Session info

This vignette was created with


```r
sessionInfo()
```

```
## R version 3.1.2 (2014-10-31)
## Platform: x86_64-pc-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitcitations_1.0.5 knitr_1.9          
## 
## loaded via a namespace (and not attached):
##  [1] bibtex_0.4.0      bitops_1.0-6      colorspace_1.2-4 
##  [4] digest_0.6.8      evaluate_0.5.5    formatR_1.0      
##  [7] ggplot2_1.0.0     grid_3.1.2        gtable_0.1.2     
## [10] httr_0.6.1        lubridate_1.3.3   MASS_7.3-37      
## [13] memoise_0.2.1     munsell_0.4.2     plyr_1.8.1       
## [16] proto_0.3-10      Rcpp_0.11.4       RCurl_1.95-4.5   
## [19] RefManageR_0.8.45 reshape2_1.4.1    RJSONIO_1.3-0    
## [22] scales_0.2.4      stringr_0.6.2     tools_3.1.2      
## [25] XML_3.98-1.1
```




