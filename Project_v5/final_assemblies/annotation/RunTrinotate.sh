#!/bin/bash 

#SBATCH -J RunTrinotate                                 
#SBATCH -p general
#SBATCH -o Trinotate_%j.log
#SBATCH -e Trinotate_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=100gb
#SBATCH --time=72:00:00 

##Move to correct WD
source ../../setup_files/path_set

cd $PWDHERE/final_assemblies/annotation

export PATH=$PATH:$PWDHERE/software/Trinotate
export PATH=$PATH:$PWDHERE/software/Blast
export PATH=$PATH:$PWDHERE/software/SignalP
export PATH=$PATH:$PWDHERE/software/TmHmm
export PATH=$PATH:$PWDHERE/software/Hmmer
export TRINOTATEDB="."

makeblastdb -in uniprot_sprot.pep -dbtype prot

Trinotate Trinotate.sqlite init --gene_trans_map genes_to_transcripts.tsv --transcript_fasta transcripts.main.fa --transdecoder_pep transcripts.reformated.aa

hmmscan --cpu 16 --domtblout PFAM.out $TRINOTATEDB/Pfam-A.hmm transcripts.reformated.aa > pfam.log &
blastx -query transcripts.main.fa -db uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastx.out &
blastp -query transcripts.reformated.aa -db uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.out &
signalp -m transcripts.reformated.aa -n signalp.out -f short > signalp.out &
tmhmm --short < transcripts.reformated.aa > tmhmm.out &
#RnammerTranscriptome.pl --transcriptome transcripts.main.fa --path_to_rnammer /usr/local/rnammer
wait

Trinotate Trinotate.sqlite LOAD_tmhmm tmhmm.out 
Trinotate Trinotate.sqlite LOAD_tmhmm signalp.out 
#Trinotate Trinotate.sqlite LOAD_rnammer transcripts.main.fa.rnammer.gff
Trinotate Trinotate.sqlite LOAD_pfam PFAM.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastx blastx.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastp blastp.out

Trinotate Trinotate.sqlite report > Report.xls
