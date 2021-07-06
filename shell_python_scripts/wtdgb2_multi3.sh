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

filenames=*.fasta.gz
#
for f in ${filenames}
do
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p19_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 20 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p20_L5000.lay.fa
     /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.pdefault_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 4000 -p 19 -i ${f} -fo ${f}_MIN4000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN4000.ctg.lay -fo ${f}_MIN4000.ctg.p19_L4000.lay.fa
    #
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -e2 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p19_e2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 20 -e2  -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p20_e2L5000.lay.fa
     /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000  -e2 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.pdefault_e2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 4000  -e2 -p 19 -i ${f} -fo ${f}_MIN4000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN4000.ctg.lay -fo ${f}_MIN4000.ctg.p19_e2_L4000.lay.fa
    #
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 19 -e2 -AS2 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p19_e2-AS2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000 -p 20 -e2 -AS2 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.p20_e2-AS2L5000.lay.fa
     /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 5000  -e2 -AS2 -i ${f} -fo ${f}_MIN5000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN5000.ctg.lay -fo ${f}_MIN5000.ctg.pdefault_e2-AS2_L5000.lay.fa
    /shelf/apps/pjt6/apps/wtdbg2-master/wtdbg2 -t 8 -L 4000  -e2 -AS2 -p 19 -i ${f} -fo ${f}_MIN4000
    /shelf/apps/pjt6/apps/wtdbg2-master/wtpoa-cns -t 8 -i ${f}_MIN4000.ctg.lay -fo ${f}_MIN4000.ctg.p19_e2-AS2_L4000.lay.fa
done














