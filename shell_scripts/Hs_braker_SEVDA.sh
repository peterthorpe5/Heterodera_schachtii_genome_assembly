cd /home/pjt6/Desktop/Hs


#generate protein alingmnert:
#gth -genomic Gp_Newton_haplotype1_sotmasked.fasta -protein Gpal_aa_fromNCBI_JJ.fasta -skipalignmentout -gff3out -o gth.aln -force -paralogs -prseedlength 20 -prhdist 2 -gcmincoverage 80 -prminmatchlen 20

#############################################################
# 1) just braker nothing extra


cd /home/pjt6/Desktop/Hs
files="
H481Amapped.out.sorted.fwd.bam  H483Amapped.out.sorted.rev.bam  Hsc_genome1.1.softmasked.fasta
H481Amapped.out.sorted.rev.bam  Hs_braker.sh                    P2mapped.out.sorted.fwd.bam
H483Amapped.out.sorted.fwd.bam  Hsc_genome1.1.fasta"

bams="H481Amapped.out.sorted.fwd.bam  H483Amapped.out.sorted.fwd.bam  P2mapped.out.sorted.fwd.bam
H481Amapped.out.sorted.rev.bam  H483Amapped.out.sorted.rev.bam  P2mapped.out.sorted.rev.bam
"
#bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,\
#P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam \
#--stranded=+,-,+,-,+,-


echo "1) running test "
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefault 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_default
--augustus_args="--protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking '
#echo ${cmd}
#eval ${cmd}


# allow overlapping genes preeicted independenly on opposite starnds
#--singlestrand=true


echo "1) running test overlapping genes"
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakersinglestranded 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_brakersinglestranded
--augustus_args="--protein=on --start=on --stop=on --cds=on --introns=on --singlestrand=true --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking '
#echo ${cmd}
#eval ${cmd}


cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefault 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_default
--augustus_args="--protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking '
#echo ${cmd}
#eval ${cmd}

###############################################################################################################
###############################################################################################################

#1) default but with proteins and RNAseq for training aug. 
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefaultpus_prot 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_defaultprot01
--augustus_args="--protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking 
--prot_aln=Annotations-Hsc_scaff001_trimmed.gff3
--prg=gth
--ALIGNMENT_TOOL_PATH=/home/pjt6/programs/gth-1.7.1-Linux_x86_64-64bit/bin/ 
--gth2traingenes '
echo ${cmd}
eval ${cmd}

#2) default but with proteins gff only training Aug
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefaultpus_protgfftrain 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_defaultprot123
--augustus_args="--protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking 
--prot_aln=Annotations-Hsc_scaff001_trimmed.gff3
--prg=gth
--ALIGNMENT_TOOL_PATH=/home/pjt6/programs/gth-1.7.1-Linux_x86_64-64bit/bin/ 
--trainFromGth '
echo ${cmd}
eval ${cmd}


#3)  Default but with the following additional args to augustus: --sample=0 --alternatives=false
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefaultpus_prot_sample0_alt_falsegfftrain 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_defaultsampl0_altfalse456
--augustus_args="--sample=0 --alternatives=false --protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking '
echo ${cmd}
eval ${cmd}


#4) Default but with following additional --minexonintronprob=0.15 --minmeanexonintronprob=0.6
echo "1) running test "
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefaultpus_protminexonintronprob=0.15 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_default
--augustus_args="--minexonintronprob=0.15 --minmeanexonintronprob=0.6 --protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking '

echo ${cmd}
eval ${cmd}


#5) default but with proteins and RNAseq for training aug with the following additional args to augustus: --sample=0 --alternatives=false
cmd='perl /home/pjt6/programs/BRAKER/scripts/braker.pl 
--genome=Hsc_genome1.1.softmasked.fasta
--overwrite 
--workingdir=/home/pjt6/Desktop/Hs/brakerdefaultpus_prot 
--bam=H481Amapped.out.sorted.fwd.bam,H481Amapped.out.sorted.rev.bam,H483Amapped.out.sorted.fwd.bam,H483Amapped.out.sorted.rev.bam,P2mapped.out.sorted.fwd.bam,P2mapped.out.sorted.rev.bam 
--stranded=+,-,+,-,+,-
--AUGUSTUS_BIN_PATH=/home/pjt6/programs/Augustus/bin 
--AUGUSTUS_CONFIG_PATH=/home/pjt6/programs/Augustus/config 
--AUGUSTUS_SCRIPTS_PATH=/home/pjt6/programs/Augustus/scripts 
--species=Hs_defaultprot01
--augustus_args="--sample=0 --alternatives=false --protein=on --start=on --stop=on --cds=on --introns=on  --stopCodonExcludedFromCDS=False --genemodel=complete " 
--crf --cores 4 --gff3 --rounds 7 
--filterOutShort 
--GENEMARK_PATH=/home/pjt6/programs/gm_et_linux_64/gmes_petap/ 
--softmasking 
--prot_aln=Annotations-Hsc_scaff001_trimmed.gff3
--prg=gth
--ALIGNMENT_TOOL_PATH=/home/pjt6/programs/gth-1.7.1-Linux_x86_64-64bit/bin/ 
--gth2traingenes '
echo ${cmd}
eval ${cmd}
