# This is a collection of excersises originally developed by Maria Nettestad (https://github.com/MariaNattestad/R_for_biologists/tree/master)
# I pulled the lessons into 1 file .R
# It is meant for abslute beginners.

# Lesson 1----
#
#      Lesson 1 -- Hit the ground running
#      •   Reading in data
#      •   Creating a quick plot
#      •   Saving publication-quality plots in multiple 
#          file formats (.png, .jpg, .pdf, and .tiff)
#
# Go to the packages tab in the bottom right part of Rstudio, click "Install" at the top, type in ggplot2, and hit Install
# Go to the Files tab in the bottom right part of Rstudio, navigate to where you can see the Lesson-01 folder. 
# then click "More" and choose "Set As Working Directory".
#
# NOTE: if you are setting your directory with code and files all in one place, you only need to enlist filenames when loading data.
# Otherwise, you need to add in folder name as well, as in: "subfolder/data.txt"

library(ggplot2)

filename <- "Encode_HMM_data.txt"
# Select a file and read the data into a data-frame
my_data <- read.csv(filename, sep="\t", header=FALSE)
# if this gives an error, make sure you have followed the steps above to set your working directory to the folder that contains the file you are trying to open

head(my_data)

# Rename the columns so we can plot things more easily without looking up which column is which
names(my_data)[1:4] <- c("chrom","start","stop","type")

# At any time, you can see what your data looks like using the head() function:
head(my_data)

# Now we can make an initial plot and see how it looks
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar() #aes is a function that adds pretty colors into the graph, and geom_bar sets the type of graph

# Save the plot to a file

# Different file formats:
png("les1_plot.png")
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar()
dev.off()

tiff("les1_plot.tiff")
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar()
dev.off()

jpeg("les1_plot.jpg")
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar()
dev.off()

pdf("les1_plot.pdf")
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar()
dev.off()

# High-resolution:
png("Lesson-01/plot_hi_res.png",1000,1000)
ggplot(my_data,aes(x=chrom,fill=type)) + geom_bar()
dev.off()

# Lesson 2----
# #
#      Lesson 2 -- Importing and downloading data
#      •   Importing data from Excel
#      •   Downloading from UCSC
#      •   Downloading from ENSEMBL
#      •   Downloading from ENCODE
#
# Getting data from Excel
	# Get the excel file from this paper: "Gene expression profiling of breast cell lines identifies potential new basal markers". Supplementary table 1
	# Go into excel and save it as "Tab Delimited Text (.txt)"


filename <- "Lesson-02/micro_array_results_table1.txt"

my_data <- read.csv(filename, sep="\t", header=TRUE)
head(my_data)

# 
# Where to find publicly available big data
# UCSC -- RefSeq genes from table browser
# Ensembl -- Mouse regulatory features MultiCell
# ENCODE -- HMM: wgEncodeBroadHmmGm12878HMM.bed


genes <- read.csv("Lesson-02/RefSeq_Genes", sep="\t", header=TRUE)
head(genes)
dim(genes)



regulatory_features <- read.csv("Lesson-02/RegulatoryFeatures_MultiCell.gff", sep="\t", header=FALSE)
head(regulatory_features)
dim(regulatory_features)



chromHMM <- read.csv("Lesson-02/wgEncodeBroadHmmGm12878HMM.bed", sep="\t", header=FALSE)
head(chromHMM)
dim(chromHMM)
