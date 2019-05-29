
# pfam search:
# hmmsearch --domtblout Hs_pfam.out  --cut_ga ../databases/Pfam-A.hmm H_sch_gene_calls_v1.aa
# cazyme search
# hmmsearch --domtblout Hs_canDB.out  ../databases/dbCAN.hmm H_sch_gene_calls_v1.aa

#python ~/Desktop/public_scripts/split_up_fasta_file_into_N_files/split_up_fasta_file.py -i H_sch_gene_calls_v1.aa -n 10

# phobius: phobius.pl -short H_sch_gene_calls_v1.aa > H_sch_gene_calls_v1.phobius
values="2 3 4 5 6 7 8 9 10 11"


for v in ${values}:
do 
	cmd="signalp -f short H_sch_gene_calls_v1.aa_${v}.fasta > temp${v}.signalp.out"
	echo ${cmd}
	eval ${cmd}
done
