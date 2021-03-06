To run these examples, you need to download the [HITChip Atlas data
set](Data.md)

### Richness

    # Use the HITChip Atlas data
    mydata <- atlas$microbes

    # Determine detection threshold as the top-80 quantile
    det.th <- quantile(mydata, 0.8)

    # Visualize the detection threshold (at log10 scale for clarity)
    plot(density(log10(mydata)), main = "Detection threshold", xlab = "Abundance (Log10)", ylab = "Frequency")
    abline(v = log10(det.th))

![](figure/rich-example-1.png)

    # Calculate richness. 
    # This indicates how many oligos are present in each sample
    # (exceed the detection threshold)
    ri <- rowSums(mydata > det.th)
    hist(ri, main = "Richness")

![](figure/rich-example-2.png)

### Diversity

    # Diversity using the vegan package
    # NOTE: data needs to be in absolute scale, not logarithmic
    di <- vegan::diversity(mydata, index = "shannon")
    hist(di, main = "Diversity")

![](figure/div-example-1.png)

### Evenness

    # Pielou's evenness is S/ln(R) w.r.t. given detection threshold
    # NOTE: here we use detection threshold for diversity as well because
    # the exact same data has to be used for diversity and richness calculation,
    # and for richness calculation the detection threshold needs to be set anyway
    # Diversity can be as such calculated also without threshold (see above)
    # but that gives somewhat different result.
    mydata2 <- mydata - det.th # NOTE: absolute (not log) scale data
    S <- vegan::diversity(mydata2, index = "shannon")
    R <- rowSums(mydata2 > 0)
    ev <- S/log(R)

### Compare with known background factors

Diversity vs. obesity

    par(mar = c(6, 4, 3, 1))
    bmi <- atlas$meta$BMI_group
    di <- vegan::diversity(atlas$microbes)
    boxplot(di ~ bmi, las = 2, main = "Microbiota diversity vs. obesity")

![](figure/diversitywithmetadata-1.png)

Diversity vs. age with smoothed confidence intervals:

    library(microbiome)
    library(sorvi)
    library(dplyr)

    # Pick the subset of RBB-preprocessed samples from time point 0
    rbb.samples <- filter(atlas$meta, Time == 0 & DNA_extraction_method == "r")$SampleID

    # Collect variables into a data frame
    df <- data.frame(Age = atlas$meta[rbb.samples, "Age"], Diversity = di[rbb.samples])

    # Visualize
    p <- sorvi::regression_plot(Diversity~Age, df, shade = TRUE, mweight = TRUE, verbose = FALSE)
    print(p)

![](figure/visu-example3-1.png)
