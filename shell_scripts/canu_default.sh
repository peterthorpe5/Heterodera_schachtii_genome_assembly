#!/bin/bash
#$ -V ## pass all environment variables to the job, VERY IMPORTANT
#$ -N canu_binary ## job name
#$ -S /bin/bash ## shell where it will run this job
####$ -j y ## join error output to normal output
#$ -cwd ## Execute the job from the current working directory
#$ -q marvin.q  ## queue name
#$ -pe multi 14
#$ -m e
#$ -M pjt6@st-andrews.ac.uk

cd /shelf/apps/pjt6/newton

module load oraclejava/jdk1.8.0_74
#default
/shelf/apps/pjt6/canu-1.7.1/Linux-amd64/bin/canu -p newton_using_EC_reads -d newton_using_EC_reads genomeSize=120m -pacbio-raw 'Gp_newton_reduce_haplotypes_400X.correctedReads.fasta.gz' -useGrid=False -maxMemory=250 -maxThreads=14




#/shelf/apps/pjt6/canu-1.7.1/Linux-amd64/bin/canu -assemble -p newton_using_EC_reads \
#-d newton_using_EC_reads genomeSize=120m \
#-pacbio-corrected '/shelf/apps/pjt6/newton/newton_using_EC_reads/newton_using_EC_reads.trimmedReads.fasta.gz' \
# -useGrid=False -maxMemory=250 -maxThreads=14

