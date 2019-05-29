#!/bin/bash
#$ -cwd
#$ -V

cd /storage/home/users/pjt6/shelf_apps/Hsh/final

#conda activate python27
# prepare the gene names file

# diaomind search
#diamond makedb --in H_sch_gene_calls_v1.aa -d hs 
#diamond blastp --query GROS_non_effectors.fasta -d hs.dmnd -e 1e-90 --out GRSO_non_effector_vs_Hs_1e90.tab --outfmt 6 -p 4


# prepare the gff file
#python ~/public_scripts/genomic_upstream_regions/re_format_GFF_Mcscanx.py --gff H_sch_gene_calls_v1_CP.gff -m True -o Hs.format.out

values="500 1000 1500 2000 2500 3000 5000 10000"


genome=/storage/home/users/pjt6/shelf_apps/Hsh/final/Cam_Hsc_genome1.2.fa
for v in ${values}:
do
    cmd="python ~/public_scripts/genomic_upstream_regions/get_upstream_regions.py 
    -c Hs.format.out 
    -g ${genome} 
    -f all_gene.names 
    -u ${v} 
    -o Hs.all_${v}_upstream.fasta 
    > warning_${v}.out"
    echo ${cmd}
    eval ${cmd}
done

# motif finding. 


for v in ${values}:
do
    cmd="python 
    get_sequences_i_want_from_fasta_command_line.py 
    Hs.all_${v}_upstream.fasta Hs_non_effectors.names Hs_non_effectors_${v}_upstream.fasta"
    echo ${cmd}
    eval ${cmd}
done

for v in ${values}:
do
    cmd="python 
    get_sequences_i_want_from_fasta_command_line.py 
    Hs.all_${v}_upstream.fasta all_gene.names Hs.all_${v}_upstream.fasta2"
    echo ${cmd}
    eval ${cmd}
done

for v in ${values}:
do
    cmd="mv  
    Hs.all_${v}_upstream.fasta2 Hs.all_${v}_upstream.fasta"
    echo ${cmd}
    eval ${cmd}
done



conda activate homer

#FASTA example: findMotifs.pl   targets.fa  fasta   motifResults/   -fasta   background.fa

for v in ${values}:
do
    cmd="findMotifs.pl   
    Hs_SUBVENTRAL_${v}_upstream.fasta 
    homer_results_${v}/ 
    -fasta 
    Hs_non_effectors_${v}_upstream.fasta"
    echo ${cmd}
    eval ${cmd}
done

#findMotifs.pl   Hs_SUBVENTRAL_1000_upstream.fasta homer_results/ -fasta Hs_non_effectors_1000_upstream.fasta

