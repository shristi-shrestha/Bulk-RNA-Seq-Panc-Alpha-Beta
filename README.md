## Bulk RNA-seq data from sorted α and β cell data published under datasets GSE106148 and GSE116559

This repository contains scripts for R shiny web application to browse visuals of gene expression data from the following two study.

1. GSE106148([Brissova et al., Cell Reports, 2018](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6368357/))  - RNAseq of sorted Alpha cells from normal and T1D human pancreatic islets
2. GSE116559([Saunders et al., Cell Metab. 2019](https://www.cell.com/cell-metabolism/pdf/S1550-4131(18)30639-9.pdf)) -  RNAseq of sorted Beta cells from normal human pancreatics islets



## Data

The normalized expression shown in the web application is from sorted Alpha cells and sorted Beta cells from normal donors only.



## Installation

The web app can be accessed at https://shristishrestha.shinyapps.io/Bulk-RNA-Seq-Alpha-Beta/ or the web app can run locally through app.R



## RNA-seq method

Reads were sequenced on an Illumina HiSeq 2500 to generate approximately 50 million reads per sample, paired end. Raw reads were mapped to the reference human genome hg19 using TopHat v2.1 (Trapnell et al., 2009). Aligned reads were then imported onto the Avadis NGS analysis platform (Strand Life Sciences, Bengaluru, India) and filtered based on read quality followed by read statistics. TMM (Trimmed Mean of M-values) algorithm (Dillies et al., 2013; Robinson and Oshlack, 2010) was used as the normalization method.
