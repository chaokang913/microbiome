Bimodality quantification
-------------------------

Calculate coefficients of bimodality (used in [Shade et
al.](http://mbio.asm.org/content/5/4/e01371-14)) for taxa in an example
data set, and plot the taxa with the lowest and highest score:

    # Load example data
    library(microbiome)
    data(peerj32); 
    mydata <- t(peerj32$microbes)

    # Calculate coefficient of bimodality for each taxa
    bs <- apply(mydata, 1, coefficient.of.bimodality)

    # Pick the most and least bimodal taxa as examples
    unimodal <- names(which.min(bs))
    bimodal <- names(which.max(bs))

    # Visualize
    par(mfrow = c(1,2))
    plot(density(mydata[unimodal,]), main = unimodal)
    plot(density(mydata[bimodal,]), main = bimodal)

![](figure/bimodality-1.png)
