#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunTrinotate
#PBS -l nodes=1:ppn=2,vmem=100gb,walltime=72:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

module load trinotate

hmmscan --cpu 16 --domtblout PFAM.out $TRINOTATEDB/Pfam-A.hmm transcripts.reformated.aa > pfam.log &
blastx -query transcripts.main.fa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastx.out &
blastp -query transcripts.reformated.aa -db $TRINOTATEDB/uniprot_sprot.pep -num_threads 16 -max_target_seqs 1 -outfmt 6 -evalue 1e-3 > blastp.out &
signalp -f short -n signalp.out transcripts.reformated.aa & 
tmhmm --short < transcripts.reformated.aa > tmhmm.out &
RnammerTranscriptome.pl --transcriptome transcripts.main.fa --path_to_rnammer /N/soft/rhel7/trinotate/rnammer-1.2/rnammer &

wait

Trinotate Trinotate.sqlite LOAD_tmhmm tmhmm.out 
Trinotate Trinotate.sqlite LOAD_tmhmm signalp.out 
Trinotate Trinotate.sqlite LOAD_rnammer transcripts.main.fa.rnammer.gff
Trinotate Trinotate.sqlite LOAD_pfam PFAM.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastx blastx.out
Trinotate Trinotate.sqlite LOAD_swissprot_blastp blastp.out

Trinotate Trinotate.sqlite report > Report.xls
