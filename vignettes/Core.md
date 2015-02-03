### Prevalence of taxonomic groups


```r
# List prevalence measure for each group using detection threshold of 2
# Sort the taxa by prevalence
head(prevalence(peerj32$microbes, 2, sort = TRUE))
```

```
##  Subdoligranulum variable at rel.       Streptococcus mitis et rel. 
##                                 1                                 1 
## Streptococcus intermedius et rel.       Streptococcus bovis et rel. 
##                                 1                                 1 
##    Sporobacter termitidis et rel.        Ruminococcus obeum et rel. 
##                                 1                                 1
```

```r
# Just list the names of taxa that are present over abundance threshold 2
# in over 20 percent of the samples:
prevalent.taxa <- list_prevalent_groups(peerj32$microbes, 2, 0.2)
```



### Core microbiota

Determine common core microbiota, following the [blanket
analysis](http://onlinelibrary.wiley.com/doi/10.1111/j.1469-0691.2012.03855.x/abstract):
 

```r
core <- createCore(t(peerj32$microbes))
```

Visualizing core microbiota:


```r
# Core 2D visualization
tmp <- Core2D(core)
```

![plot of chunk core-example2](figure/core-example2-1.png) 

```r
# Core heatmap
tmp <- core_heatmap(t(peerj32$microbes))
```

![plot of chunk core-example2](figure/core-example2-2.png) 