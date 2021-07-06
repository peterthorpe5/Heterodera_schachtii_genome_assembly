#$ -cwd

cd /storage/home/users/pjt6/shelf_apps/Hsh/final_genome

python run_pipeline.py


conda activate python27
conda activate repeatmasking

# genomtools is in path

#/shelf/apps/pjt6/apps/TransposonPSI_08222010/transposonPSI.pl Hsc_genome1.1.fasta nuc

# LTRharvest in genome tools  http://genometools.org/documents/ltrharvest.pdf


#make the enhanced database
#gt suffixerator -db Hsc_genome1.1.fasta -indexname hs -tis -suf -lcp -des -ssp -sds -dna


#search for the beasties. 

#gt ltrharvest -index hs -mintsd 5 -maxtsd 100 > Hs_LTR_harvest.out


# (optional sequence clusterin gof output

#mkvtree .... look at the pdf. 
