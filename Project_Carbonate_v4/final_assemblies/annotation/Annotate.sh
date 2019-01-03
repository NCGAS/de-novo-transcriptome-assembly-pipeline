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

module load trinotate

scripts/make_genes_to_transcripts.ba -i *.mainalt.tab -g $prefix
scripts/convert_aa.ba -t genes_to_transcripts.tsv -f transcripts.main.aa
Trinotate Trinotate.sqlite init --gene_trans_map genes_to_transcripts.tsv --transcript_fasta transcripts.main.fa --transdecoder_pep transcripts.reformated.aa 

awk 'NR==FNR {a[$2]=$1; next} NR>FNR {if ($1~/>/) {print ">"a[$1],$0} else {print $0}}' <(awk 'OFS="\t"{print $1,">"$2}' genes_to_transcripts.tsv) transcripts.main.fa | awk '{gsub(/>/,".",$2)}1{print $1$2,$3,$4,$5}' > transcripts.main.renamed.fa
awk 'NR==FNR {a[$2]=$1; next} NR>FNR {if ($1~/>/) {print ">"a[$1],$0} else {print $0}}' <(awk 'OFS="\t"{print $1,">"$2}' genes_to_transcripts.tsv) transcripts.main.aa | awk '{gsub(/>/,".",$2)}1{print $1$2,$3,$4,$5,$6,$7}' > transcripts.main.renamed.aa
