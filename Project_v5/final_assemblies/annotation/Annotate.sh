#!/usr/bin/bash

while getopts i:p:h option
do
case "${option}" in
p) prefix=${OPTARG};;
h) echo "################################################";
   echo "use the following syntax:";
   echo "";
   echo "./Annotate.sh -p NAME_PREFIX";
   echo "";
   echo "################################################"
   exit 0;;
esac
done

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinotate:$PATH
export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Hmmer:$PATH

bash scripts/make_genes_to_transcripts.ba -i *.mainalt.tab -g $prefix
bash scripts/convert_aa.ba -t genes_to_transcripts.tsv -f transcripts.main.aa
perl Build_Trinotate_Boilerplate_SQLite_db.pl Trinotate

Trinotate Trinotate.sqlite init --gene_trans_map genes_to_transcripts.tsv --transcript_fasta transcripts.main.fa --transdecoder_pep transcripts.reformated.aa 
gzip -d Pfam-A.hmm.gz
rm *.h3i
hmmpress Pfam-A.hmm

awk 'NR==FNR {a[$2]=$1; next} NR>FNR {if ($1~/>/) {print ">"a[$1],$0} else {print $0}}' <(awk 'OFS="\t"{print $1,">"$2}' genes_to_transcripts.tsv) transcripts.main.fa | awk '{gsub(/>/,".",$2)}1{print $1$2,$3,$4,$5}' > transcripts.main.renamed.fa
awk 'NR==FNR {a[$2]=$1; next} NR>FNR {if ($1~/>/) {print ">"a[$1],$0} else {print $0}}' <(awk 'OFS="\t"{print $1,">"$2}' genes_to_transcripts.tsv) transcripts.main.aa | awk '{gsub(/>/,".",$2)}1{print $1$2,$3,$4,$5,$6,$7}' > transcripts.main.renamed.aa

