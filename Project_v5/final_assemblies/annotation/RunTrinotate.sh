#!/bin/bash 

#SBATCH -J RunTrinotate                                 
#SBATCH -p trinity
#SBATCH -o Trinotate_%j.log
#SBATCH -e Trinotate_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=100gb
#SBATCH --time=72:00:00 

##Move to correct WD
cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/final_assemblies/annotation

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinotate:$PATH
export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Blast:$PATH
export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/SignalP:$PATH
export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/TmHmm:$PATH
export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Hmmer:$PATH
export TRINOTATEDB="."

#makeblastdb -in uniprot_sprot.pep -dbtype prot
#hmmpress Pfam-A.hmm

#Trinotate Trinotate.sqlite init --gene_trans_map genes_to_transcripts.tsv --transcript_fasta transcripts.main.fa --transdecoder_pep transcripts.reformated.aa

#hmmscan --cpu 16 --domtblout PFAM.out $TRINOTATEDB/Pfam-A.hmm transcripts.reformated.aa > pfam.log
#blastx -query transcripts.main.fa -db uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastx.out &
#blastp -query transcripts.reformated.aa -db uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.out &
#signalp -m transcripts.reformated.aa -n signalp.out -f short
#tmhmm --short < transcripts.reformated.aa > tmhmm.out &
#RnammerTranscriptome.pl --transcriptome transcripts.main.fa --path_to_rnammer /usr/local/rnammer
wait

Trinotate Trinotate.sqlite LOAD_tmhmm tmhmm.out 
Trinotate Trinotate.sqlite LOAD_tmhmm signalp.out 
#Trinotate Trinotate.sqlite LOAD_rnammer transcripts.main.fa.rnammer.gff
Trinotate Trinotate.sqlite LOAD_pfam PFAM.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastx blastx.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastp blastp.out

Trinotate Trinotate.sqlite report > Report.xls
