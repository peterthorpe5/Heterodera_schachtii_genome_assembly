#!/bin/bash



cd /shelf/apps/pjt6/newton
/home/pt40963/scratch/Downloads/canu/Linux-amd64/bin/canu gnuplotTested=true -p Hsac_all_data_reduce_ploidy_300X_CMAPSEN_normal \
    -d Hsac_all_data_300X_CMAPSEN_normal genomeSize=180m -pacbio-raw 'both.subreads.fastq' \
    -useGrid=False -maxMemory=120 -maxThreads=28 corOutCoverage=300 corMhapSensitivity=normal

