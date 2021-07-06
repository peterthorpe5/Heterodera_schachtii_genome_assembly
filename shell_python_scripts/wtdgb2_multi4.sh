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

#conda activate pb_toolkit
#bamToFastq -i m54214_201023_205432.subreads.bam -fq m54214_201023_205432.subreads.fastq
# cat ./*/*.fastq > all.fastq

cd /shelf/apps/pjt6/Hsh

module load oraclejava/jdk1.8.0_74
#default

filenames=*.fasta.gz
#
for f in ${filenames}
do
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -AS2 -i ${f} -fo ${f}2_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}2_MIN5000.ctg.lay -fo ${f}2_MIN5000.ctg.p19-AS2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 20 -AS2 -i ${f} -fo ${f}2_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}2_MIN5000.ctg.lay -fo ${f}2_MIN5000.ctg.p20-AS2L5000.lay.fa
     /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000  -AS2 -i ${f} -fo ${f}2_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}2_MIN5000.ctg.lay -fo ${f}2_MIN5000.ctg.pdefault-AS2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 4000  -AS2 -p 19 -i ${f} -fo ${f}2_MIN4000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}2_MIN4000.ctg.lay -fo ${f}2_MIN4000.ctg.p19-AS2_L4000.lay.fa
done












