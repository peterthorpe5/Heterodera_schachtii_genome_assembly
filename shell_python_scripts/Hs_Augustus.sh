cd /shelf/apps/pjt6/Hsh/dirty_genes/
#augustus --genemodel=partial --protein=on --start=on --stop=on --cds=on --introns=on --gff3=on --outfile=Gp_newton_ALL_haplotypes_200X.contigs.gff --noInFrameStop=true --strand=both --species=Globodera_pallida_pacbiocanu1.6_all_data_20180530 Gp_newton_ALL_haplotypes_200X.contigs.fasta

#augustus --genemodel=partial --protein=on --start=on --stop=on --cds=on --introns=on --gff3=on --outfile=GBN_Gp_newton_ALL_haplotypes_200X.contigs.gff --noInFrameStop=true --strand=both --species=Globodera_pallida_pacbiocanu1.6_all_data_20180530 curated.fasta


augustus --genemodel=complete --protein=on --start=on --stop=on --cds=on --introns=on \
--gff3=on --outfile=Hschac_20181210_gene_Hetero_schac_20180514_models.gff --noInFrameStop=true --strand=both \
--species=Hetero_schac_20180514_complete_only scaffolds_gapfilled_FINAL.fasta
