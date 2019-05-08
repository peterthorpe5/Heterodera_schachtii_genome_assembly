#!/bin/bash
#$ -V ## pass all environment variables to the job, VERY IMPORTANT
#$ -N MAIN_wtdbg ## job name
#$ -S /bin/bash ## shell where it will run this job
####$ -j y ## join error output to normal output
#$ -cwd ## Execute the job from the current working directory
###$ -q marvin.q ## queue name
#$ -pe multi 8
#$ -m e
#$ -M pjt6@st-andrews.ac.uk


cd /shelf/apps/pjt6/Hsh

module load oraclejava/jdk1.8.0_74
#default




#/shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -i Hsac_all_data_reduce_ploidy_300X_CMAPSEN_normal.trimmedReads_min5000.fasta.gz -fo Hs_smash_MIN5000
#
#/shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i Hs_smash_MIN5000.ctg.lay -fo Hs_smash_MIN5000.ctg.p19_L5000.lay.fa
###
#/shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000  -i Hsac_all_data_reduce_ploidy_300X_CMAPSEN_normal.trimmedReads_min5000.fasta.gz -fo Hs_smash_MIN5000
#
#/shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i Hs_smash_MIN5000.ctg.lay -fo Hs_smash_MIN5000.ctg.L5000.lay.fa
###


/shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -i Hsac_all_data_default.correctedReads_minlen5000.fasta.gz -fo Hs_default_MIN5000

/shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i Hs_default_MIN5000.ctg.lay -fo Hs_default_MIN5000.ctg.p19_L5000.lay.fa
##
/shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000  -i Hsac_all_data_default.correctedReads_minlen5000.fasta.gz -fo Hs_default_MIN5000

/shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i Hs_default_MIN5000.ctg.lay -fo Hs_default_MIN5000.ctg.L5000.lay.fa
##













