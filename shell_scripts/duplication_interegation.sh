#!/bin/bash

# fill these variables in
current_path="/shelf/apps/pjt6/Hsh/final/duplication/"
species="hs_hs"
mcscanx_path="/storage/home/users/pjt6/shelf_apps/apps/MCScanX/"

# need to install bioperl, plus loads of things that fail. Then you need clustalw in your path too.
#conda activate bioperl

cd ${current_path}
cd ${species}
##################################################################################
# python reform_gff.py --gff ../H_sch_gene_calls_v1_CP.gff -s hs -o ${species}.gff
# pre filter the amino acid file for .t1 codings, only. Then remove the .t1 from the name.
# diamond makedb --in Hs.aa.fasta -d Hs
# diamond blastp -p 12 --more-sensitive -e 1e-5 -v -q Hs.aa.fasta  -d Hs.dmnd --outfmt 6 -o ./${species}/${species}.blast


# filter the blast file for min evalues of interest

evalues_of_interest=" 1e-10 1e-20 1e-25 1e-35 1e-50 1e-55"

for evalue in ${evalues_of_interest}
do
    echo "current evalue ${evalue}"
    filtercmd="python ${current_path}/Remove_low_quality_blast_matches.py 
    ${current_path}/${species}_1eminus5.blast
    ${evalue}
    ${species}.blast"
    echo ${filtercmd}
    eval ${filtercmd}
    # mcscanx
    mcscancmddupclass="${mcscanx_path}/duplicate_gene_classifier  
    ${current_path}${species}/${species}"
    echo ${mcscancmddupclass}
    eval ${mcscancmddupclass}
    # move the output file to the evalue used
    mv ${species}.gene_type ${species}_${evalue}.gene_type
    mcscancmd="${mcscanx_path}/MCScanX  
    ${current_path}${species}/${species}"
    echo ${mcscancmd}
    eval ${mcscancmd}
    # collinear_tandem_arrays
    collincmd="${mcscanx_path}/downstream_analyses/detect_collinear_tandem_arrays 
    -g ${species}.gff 
    -b ${species}.blast 
    -c ${species}.collinearity 
    -o ${species}_${evalue}_detect_collinear_tandem_array"
    echo ${collincmd}
    eval ${collincmd}
    echo "we need bioperl activated for this next bit"
    kakscmd="perl 
    ${mcscanx_path}/downstream_analyses/add_ka_and_ks_to_collinearity.pl 
    -i ${species}.collinearity 
    -d ${current_path}/${nt_file}
    -o ${species}.${evalue}_collinearity.kaks"
    echo ${kakscmd}
    eval ${kakscmd}
    mv ${species}.collinearity ../${species}_${evalue}.collinearity    
done
