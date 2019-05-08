#!/bin/bash
#$ -cwd
cd /shelf/apps/pjt6/Hsh

conda activate python36

export AUGUSTUS_CONFIG_PATH=~/shelf_apps/apps/augustus-3.2.1/config/


# need to make a symbolic link to LINAGE
mkdir LINEAGE
wait
#~ NOTE the nematode dataset was downloaded and used in place og Metazo models. 
ln -s ~/shelf_apps/apps/BUSCO_v1.1b1/eukaryota ./LINEAGE/
wait
#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_raw.ctg.lay.fa -l ./LINEAGE/eukaryota -o Hs_raw._BUSCO -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_trimmed.ctg.lay.fa -l ./LINEAGE/eukaryota -o Hs_trimmed._BUSCO -f -Z 827000000 --cpu 4 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in newt_correc_corre.ctg.lay.fa -l ./LINEAGE/eukaryota -o newt_correc_corre._BUSCO -f -Z 827000000 --cpu 4 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Newton_canu_smash_haplotypes.lay.fa -l ./LINEAGE/eukaryota -o Newton_canu_smash_haplotypes.lay.fa_BUSCO -f -Z 827000000 --cpu 4 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in newt_correc_corre.ctg.l5000_p_default_lay.fa -l ./LINEAGE/eukaryota -o newt_correc_corre.ctgl5000_p_default_lay_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530


#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in newt_correc_corre.ctg.L4000_p19_lay.fa -l ./LINEAGE/eukaryota -o newt_correc_corre.ctg.L4000_p19_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_default_trimmed.ctg._L5000.lay.fa -l ./LINEAGE/eukaryota -oHs_default_trimmed.ctg._L5000_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530

#filenames=n*.L*.fa

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in newt_correc_corre.ctg.L4000_p19_lay.contamin.filtered.fasta -l ./LINEAGE/eukaryota -o newt_correc_corre.ctg.L4000_p19_lay.contamin.filtered.fasta_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530

#
#for f in ${filenames}
#do
#    python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in ${f} -l ./LINEAGE/eukaryota -o ${f}_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530
#done

filenames=*.fa

for f in ${filenames}
do
    python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in ${f} -l ./LINEAGE/eukaryota -o ${f}_BUSCO  -f -Z 827000000 --cpu 4 --species Globodera_pallida_illumina_published_assembly_20180530
done

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_smash_MIN5000.ctg.L5000.lay.fa -l ./LINEAGE/eukaryota -o Hs_smash_MIN5000.ctg.L5000.lay.fa_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530
#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_smash_MIN5000.ctg.p19_L5000.lay.fa -l ./LINEAGE/eukaryota -o Hs_smash_MIN5000.ctg.p19_L5000.lay.fa_BUSCO  -f -Z 827000000 --cpu 8 --species Globodera_pallida_illumina_published_assembly_20180530

#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in curated.fasta -l ./LINEAGE/eukaryota -o curated_BUSCO  -f -Z 827000000 --cpu 12 --species Globodera_pallida_illumina_published_assembly_20180530
#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in Hs_default_MIN5000.ctg.p19_L5000.lay.fa -l ./LINEAGE/eukaryota -o Hs_default_MIN5000.ctg.p19_L5000.lay.fa_BUSCO  -f -Z 827000000 --cpu 12 --species Globodera_pallida_illumina_published_assembly_20180530


#python ~/shelf_apps/apps/BUSCO_v1.1b1/BUSCO_v1.1b1.py -in prefix.ctg.lay.fa -l ./LINEAGE/eukaryota -o prefix.ctg.lay._BUSCO  -f -Z 827000000 --cpu 4 --species Globodera_pallida_illumina_published_assembly_20180530

