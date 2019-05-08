#$ -cwd

cd /shelf/apps/pjt6/Hsh/final

#python run_pipeline.py


conda activate python27
conda activate repeatmasking

# genomtools is in path

/shelf/apps/pjt6/apps/TransposonPSI_08222010/transposonPSI.pl Cam_Hsc_genome1.2.fa nuc

# LTRharvest in genome tools  http://genometools.org/documents/ltrharvest.pdf


#make the enhanced database
gt suffixerator -db Cam_Hsc_genome1.2.fa -indexname hs -tis -suf -lcp -des -ssp -sds -dna


#search for the beasties. 

#gt ltrharvest -index hs -mintsd 5 -maxtsd 100 > Hs_LTR_harvest.out


# (optional sequence clusterin gof output

#mkvtree .... look at the pdf. 
