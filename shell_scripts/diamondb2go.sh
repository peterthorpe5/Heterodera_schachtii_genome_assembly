#!/bin/bash
#$ -cwd
#Abort on any error,
set -e

#echo Running on $HOSTNAME
#echo Current PATH is $PATH
#source $HOME/.bash_profile

################################################################
# Variables: FILLL IN DOWN TO THE END OF VARIABLES

threads=24
python_directory=$HOME/public_scripts/gene_model_testing/

diamond_db=/shelf/public/blastntnr/blastDatabases/nr_PT.dmnd



# END OF VARIABLES !!!!!!!!!!!!!!!!!!!!!!
########################################################
#conda activate genemodel

cd /storage/home/users/pjt6/shelf_apps/Hsh/gene_models


###########################################################################

# --taxonmap /shelf/public/blastntnr/blastDatabases//prot.accession2taxid.gz	
echo "running diamond-BLAST against NR xml for BLAST2GO"
diam_p="diamond blastp 
		-p ${threads} 
		--more-sensitive -e 1e-10 
	   -q H_sch_gene_calls_v1.aa
	   -d ${diamond_db}  
	   --outfmt 5 --salltitles
	   --out H_sch_gene_calls_v1.aa_vs_nr_B2GO.xml"
echo ${diam_p}
eval ${diam_p}
wait
