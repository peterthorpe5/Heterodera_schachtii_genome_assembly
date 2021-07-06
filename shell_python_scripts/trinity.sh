#!/bin/bash
#$ -cwd
#Abort on any error,
#set -e

cd /shelf/apps/pjt6/Hsh/final_genome

conda activate trinity


#samtools merge -@ 4 merged.bam H481Amapped.out.sorted.fwd.bam  H483Amapped.out.sorted.fwd.bam  P2mapped.out.sorted.fwd.bam H481Amapped.out.sorted.rev.bam  H483Amapped.out.sorted.rev.bam  P2mapped.out.sorted.rev.bam


#samtools sort -@ 8 merged.bam sorted


samtools index sorted.bam

genome="Hsc_genome1.1.fasta"

 Trinity --genome_guided_bam sorted.bam \
         --genome_guided_max_intron 10000 -SS_lib_type FR \
         --CPU 30 --max_memory 300G --full_cleanup --output Hs_genome_gui_Trinity --genome_guided_min_coverage 3
         
 