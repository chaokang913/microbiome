### Coloured Barplots

The following example picks 20 random species from a species data vector
and visualizes them as ordered barplot colored according to the L2
group.

    library(microbiome, quietly = TRUE)
    library(ggplot2)

    # Microbiota profiling data. Read as: bacteria x samples matrix
    data(peerj32)  # From https://peerj.com/articles/32/
    l2.log10.simulated <- t(peerj32$microbes)

    # Pick example data and visualize
    x <- l2.log10.simulated[,1]
    phylogeny.info <- GetPhylogeny("HITChip")
    p <- phylo.barplot(x, color.level = "L1", title = "My title", phylogeny.info = phylogeny.info, plot = FALSE)
    print(p)

![](figure/barplot-1.png)

### A longer version with source code

The following example picks 20 random species and visualizes the HITChip
signal as ordered barplot. In this example the bars are colored
according to the L2 group.

    # Load Phylogeny
    phylogeny.info <- GetPhylogeny("HITChip")

    # Get example data 
    data(peerj32)
    x <- log10(t(peerj32$microbes))

    # Pick 20 species from first sample at random
    taxa <- rownames(x)[sample(nrow(x), 20)]

    # Signal of the selected taxa at first sample
    signal <- x[taxa,1]

    # Higher-level taxonomic groups for the taxa
    l1 <- droplevels(levelmap(taxa, level.from = "L2", level.to = "L1", phylogeny.info = phylogeny.info))

    # Collect all into a data.frame
    df <- list()
    df$taxa <- taxa
    df$L1 <- l1
    df$signal <- signal
    df <- data.frame(df)

    # Define colors for groups
    l1.colors <- rainbow(length(unique(df$L1)))
    names(l1.colors) <- as.character(unique(df$L1))

    # Rearrange the data.frame
    m <- melt(df)

    # Sort by signal (ie. change order of factors for plot)
    df <- within(df, taxa <- factor(taxa, levels = taxa[order(abs(signal))]))

    # Plot the image
    p <- ggplot(aes(x = taxa, y = signal, fill = L1), data = df) 
    p <- p + scale_fill_manual(values = l1.colors[as.character(levels(df$L1))])

    p <- p + geom_bar(position="identity", stat = "identity") + theme_bw() + coord_flip()
    p <- p + ylab("Fold change") + xlab("") + ggtitle("My barplot")
    p <- p + theme(legend.position="right")
    p <- p + theme(panel.border=element_rect())

    print(p)

![](figure/barplot-example2-1.png)
