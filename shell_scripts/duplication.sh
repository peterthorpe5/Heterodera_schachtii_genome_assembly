
cd hs_hs
conda activate python27
python reform_gff.py --gff ../H_sch_gene_calls_v1_CP.gff -s hs -o hs_hs.gff


conda deactivate

# pre filter the amino acid file for .t1 codings, only. Then remove the .t1 from the name.
diamond makedb --in Hs.aa.fasta -d Hs

diamond blastp -p 12 --more-sensitive -e 1e-5 -v -q Hs.aa.fasta  -d Hs.dmnd --outfmt 6 -o ./hs_hs/hs_hs.blast

# mcscanx

~/shelf_apps/apps/MCScanX/duplicate_gene_classifier  /shelf/apps/pjt6/Hsh/final/duplication/hs_hs/hs_hs

# collinear_tandem_arrays

~/shelf_apps/apps/MCScanX/downstream_analyses/detect_collinear_tandem_arrays -g hs_hs.gff -b hs_hs.blast -c hs_hs.collinearity -o hs_newton_detect_collinear_tandem_array 

~/shelf_apps/apps/MCScanX/downstream_analyses/detect_collinear_tandem_arrays -g hs_hs.gff -b hs_hs.blast -c hs_hs.collinearity -o hs_detect_collinear_tandem_arrays.out

# 
perl ~/shelf_apps/apps/MCScanX/downstream_analyses/add_ka_and_ks_to_collinearity.pl -i hs_hs.collinearity -d ../H_sch_gene_calls_v1.codingseq.t1_only.fasta -o hs.collinearity.kaks