#$ -cwd

cd /shelf/apps/pjt6/

python run_pipeline.py


conda activate python27
conda activate repeatmasking

# genomtools is in path

/shelf/apps/pjt6/apps/TransposonPSI_08222010/transposonPSI.pl Final.fasta nucl

# LTRharvest in genome tools  http://genometools.org/documents/ltrharvest.pdf


#make the enhanced database
gt suffixerator -db Final.fasta -indexname gp -tis -suf -lcp -des -ssp -sds -dna


#search for the beasties. 

gt ltrharvest -index gp -mintsd 5 -maxtsd 100 > Gp_LTR_harvest.out


# (optional sequence clusterin gof output

#mkvtree .... look at the pdf. 
