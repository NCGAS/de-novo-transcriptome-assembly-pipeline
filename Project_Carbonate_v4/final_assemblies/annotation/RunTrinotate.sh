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
cd PWDHERE/final_assemblies/annotation

module load perl/5.30.1
module load hmmer/3.1
module load trinotate
module unload trinityrnaseq   #this is temporary
module load trinityrnaseq/2.11.0  

cp /N/soft/rhel7/trinotate/3.1.1/Trinotate.sqlite .
Trinotate Trinotate.sqlite init --gene_trans_map genes_to_transcripts.tsv --transcript_fasta transcripts.main.fa --transdecoder_pep transcripts.reformated.aa

hmmscan --cpu 16 --domtblout PFAM.out $TRINOTATEDB/Pfam-A.hmm transcripts.reformated.aa > pfam.log &
blastx -query transcripts.main.fa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastx.out &
blastp -query transcripts.reformated.aa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.out &
signalp -f short -n signalp.out transcripts.reformated.aa & 
tmhmm --short < transcripts.reformated.aa > tmhmm.out &
RnammerTranscriptome.pl --transcriptome transcripts.main.fa --path_to_rnammer /N/soft/rhel7/trinotate/rnammer-1.2/rnammer &

wait

module unload perl
module load perl #DBI is missing from 5.30.1, this is temporary

Trinotate Trinotate.sqlite LOAD_tmhmm tmhmm.out 
Trinotate Trinotate.sqlite LOAD_tmhmm signalp.out 
Trinotate Trinotate.sqlite LOAD_rnammer transcripts.main.fa.rnammer.gff
Trinotate Trinotate.sqlite LOAD_pfam PFAM.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastx blastx.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastp blastp.out

Trinotate Trinotate.sqlite report > Report.xls
