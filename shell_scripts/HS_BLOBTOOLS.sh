#!/bin/bash
#$ -cwd
cd /shelf/apps/pjt6/Hsh/blobs

conda activate python27


minialign -t12 -xont Hs_trimmed.ctg._L5000.lay.fa /shelf/apps/pjt6/Hsh/Hsac_all_data_300X_CMAPSEN_normal.trimmedReads.fasta.gz > temp.sam
wait 
#samtools view -@ 18 -S -b -o unsorted.bam temp.sam
wait 
#samtools sort -@ 32 unsorted.bam sorted

#samtools index sorted

wait 

#python ~/Downloads/blobtools-light-master/mapping2cov.py -a /home/pt40963/scratch/nematode/newton/purge_haplo_ALL_haplotypes_all_data/purge_the_purged/Hs_trimmed.ctg._L5000.lay.fa -bam /home/pt40963/scratch/nematode/newton/purge_haplo_ALL_haplotypes_all_data/purge_the_purged/sorted.bam -o contig.mappingall_final.cas.cov


######################################


blastn -task megablast -query Hs_trimmed.ctg._L5000.lay.fa -db nt -outfmt '6 qseqid staxids bitscore std scomnames sscinames sblastnames sskingdoms stitle' -evalue 1e-20 -out n.clc.allfinal.out -num_threads 8

blobtools create -i Hs_trimmed.ctg._L5000.lay.fa  -s temp.sam -t n.clc.allfinal.out -o Hs_trimmed.ctg._L5000.lay.fa.blobplots
 
 mkdir allfinal.fa.blobplots
 cp Hs_trimmed.ctg._L5000.lay.fa.blobplots.blobDB.json ./allfinal.fa.blobplots
 
blobtools view -i  Hs_trimmed.ctg._L5000.lay.fa.blobplots.blobDB.json -o allfinal.fa.blobplots/
 
blobtools blobplot -i Hs_trimmed.ctg._L5000.lay.fa.blobplots.blobDB.json -o allfinal.fa.blobplots/ 

#rm temp.sam

cd allfinal.fa.blobplots
cat *.blobDB.table.txt | grep "Streptophyta" | cut -f1 > Streptophyta.names
#cat *.blobDB.table.txt | grep "Arthropoda" | cut -f1 > Arthropoda.names
cat *.blobDB.table.txt | grep "Ascomycota" | cut -f1 > Ascomycota.names
#cat *.blobDB.table.txt | grep "Chordata" | cut -f1 > Chordata.names
#cat *.blobDB.table.txt | grep "Nematoda" | cut -f1 > Nematoda.names
cat *.blobDB.table.txt | grep "Basidiomycota" | cut -f1 > Basidiomycota.names
cat *.blobDB.table.txt | grep "Proteobacteria" | cut -f1 > Proteobacteria.names
cat *.blobDB.table.txt | grep "Bacteria-undef" | cut -f1 > Bacteria-undef.names
cat *.blobDB.table.txt | grep "Viruses-undef" | cut -f1 > Viruses-undef.names
#cat *.blobDB.table.txt | grep "Cnidaria" | cut -f1 > Cnidaria.names
cat *.blobDB.table.txt | grep "Actinobacteria" | cut -f1 > Actinobacteria.names
cat *.blobDB.table.txt | grep "Mucoromycota" | cut -f1 > Mucoromycota.names
cat *.blobDB.table.txt | grep "Euryarchaeota" | cut -f1 > Euryarchaeota.names 
cat *.blobDB.table.txt | awk '$5 < 5' | grep 'no-hit' | sort -k4 -rn | cut -f1 > low_cov_5.LOOKATME
cat *.names >  bad_contigs.out

cd ../

python /shelf/apps/pjt6/apps/public_scripts-master/get_sequences_i_want_from_fasta_command_line_not_wanted_file.py Hs_trimmed.ctg._L5000.lay.fa ./allfinal.fa.blobplots/bad_contigs.out 10 Hs_trimmed.ctg._L5000.lay.contim_filtered.fasta
rm temp.sam

