#!/bin/bash
#$ -cwd

conda activate python36
cd /shelf/apps/pjt6/Hsh/gene_models/

export AUGUSTUS_CONFIG_PATH=~/shelf_apps/apps/augustus-3.2.1/config/

# need to make a symbolic link to LINAGE
mkdir LINEAGE
wait
#~ NOTE the nematode dataset was downloaded and used in place og Metazo models. 
ln -s ~/shelf_apps/apps/BUSCO_v1.1b1/eukaryota ./LINEAGE/
wait



filenames=*.fasta
#
for f in ${filenames}
do
    python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -m transcriptome -in ${f} -l ./LINEAGE/eukaryota -o ${f}_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530
done
#
