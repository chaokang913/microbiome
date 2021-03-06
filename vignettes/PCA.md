### Principal component analysis (PCA)

Visualize deviation of all bacteria from their population mean (smaller:
blue; higher: red):

    # Example data
    library(microbiome)
    data(peerj32)
    x <- peerj32$microbes
    m <- peerj32$meta

    # Convert HITChip signal to relative abundances
    rel <- relative.abundance(t(x))

    # Let us focus on the most abundant and prevalent bacteria
    # that are seen in >1% (>0.01) relative abundance in 
    # >20% (>0.2) of the subjects
    prevalent.taxa <- names(which(prevalence(t(rel), 0.01, sort = TRUE) > 0.2))

    # Project data on 2D display with PCA (visualize subjects based on 20 random features)
    set.seed(423542)
    proj <- microbiome::project.data(log10(x[, prevalent.taxa]), type = "PCA")

    # Visualize; show gender with colors
    p <- densityplot(proj, col = m$gender, legend = T)
    print(p)

![](figure/density-1.png)

    # Visualize with low/high Prevotella
    # This shows that Prevotella (color) has ecosystem-level impact on microbiota composition
    prevotella.abundance  <- log10(x[, "Prevotella melaninogenica et rel."]) 
    p <- densityplot(proj, col = prevotella.abundance, legend = T)
    print(p)

![](figure/density-2.png)

PCA with ggplot2 - the above example gives a shortcut for the following:

    # Arrange projected data onto a data frame
    coms <- intersect(rownames(proj), rownames(m))
    df <- as.data.frame(cbind(proj[coms,], m[coms,]))
    names(df) <- c("x", "y", colnames(m))

    # Construct the figure with ggplot2
    library(ggplot2)
    theme_set(theme_bw(15))
    p <- ggplot(df) 

    # Add densities
    p <- p + stat_density2d(aes(x = x, y = y, fill=..density..), geom="raster", stat_params = list(contour = F), geom_params = list()) 
    p <- p + scale_fill_gradient(low="white", high="black") 

    # Add points
    p <- p + geom_point(aes(x = x, y = y, color = gender), size = 1.5) 

    # Add labels
    p <- p + xlab("PCA 1") + ylab("PCA 2") + ggtitle("Density plot")
    p <- p + scale_colour_discrete(name = "Sex")

    # Plot the figure
    print(p)

![](figure/density2-1.png)

### Other projections

Project high-dimensional data on two-dimensional plane by various
methods including PCA, MDS, Sammons mapping etc. (for visualization
purposes; see help(project.data) for details):

    # Example data
    library(microbiome)
    data(peerj32)
    x <- peerj32$microbes

    # Nonmetric MDS projection
    proj <- project.data(x, type = "MDS.nonmetric")

    ## initial  value 21.257494 
    ## iter   5 value 16.978865
    ## final  value 16.790732 
    ## converged

    # Plot the projection
    library(ggplot2)
    theme_set(theme_bw(15))
    ggplot(aes(x = Comp.1, y = Comp.2), data = proj) + geom_point()

![](figure/visu-example-1.png)

Plot the projection with sample names:

    ggplot(aes(x = Comp.1, y = Comp.2, label = rownames(proj)), data = proj) + geom_text()

![](figure/visu-example2-1.png)
