#!/bin/bash 

#SBATCH -J RunQC                                 
#SBATCH -p general
#SBATCH -o QC_%j.log
#SBATCH -e QC_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --time=12:00:00 

source ../../setup_files/path_set 
cd $PWDHERE/final_assemblies/QC

#This is a means by which to check the different metrics for each of your 
#subassemblies, as well as your main assembly. Sometimes the CDTA will not be 
#the best (though there's no way to know unless you do it ^_^).  Also, 
#different projects require a focus on different aspects, so we give you this 
#table to determine what your best option is for your needs!

#1) Make script to symlink all assemblies here
for f in ../../TransAbyss/*final.fa; do ln -s $f ${f#../../TransAbyss/}; done
ln -s ../../Trinity/*.fasta Trinity.fa
for f in ../../SOAP/*.scafSeq; do ln -s $f SOAP.k${f#../../SOAP/output}; done
for f in *scafSeq; do mv $f ${f%scafSeq}fa; done
ln -s ../../Velvet/oases.35/transcripts.fa Velvet.k35.fa
ln -s ../../Velvet/oases.45/transcripts.fa Velvet.k45.fa
ln -s ../../Velvet/oases.55/transcripts.fa Velvet.k55.fa
ln -s ../../Velvet/oases.65/transcripts.fa Velvet.k65.fa
ln -s ../../Velvet/oases.75/transcripts.fa Velvet.k75.fa
ln -s ../../Velvet/oases.85/transcripts.fa Velvet.k85.fa
ln -s ../annotation/transcripts.main.fa .
ln -s ../okayset/combined.okay.fa .

#2) Make script to run BUSCO on all - Needs TESTING
export PATH="$PATH:$PWDHERE/software/BUSCO/"
for f in *fa; do busco -i $f -o ${f%fa}busco -l eukaryota_odb10 -m tran; done

#3) Make script to run quast on all - DONE
export PATH="$PATH:$PWDHERE/software/Quast/"
for f in *.fa; do quast.py -o ${f%fa}quast $f; done

#4) Make script to combine into a table
#print names and busco
echo "Assembly Complete_BUSCOs_(C) Complete_and_single-copy_BUSCOs_(S) Complete_and_duplicated_BUSCOs_(D) Fragmented_BUSCOs_(F) Missing_BUSCOs_(M) Total_BUSCO_groups_searched">BUSCO.table

for f in *.busco/short_summary*; do tail -n 10 $f | head -n 6 | awk -v f=${f%.busco/short_summary*} 'BEGIN{ORS=" ";print f}{print $1}END{printf "\n"}' ; done >> BUSCO.table

sed -i 's/run_//g' BUSCO.table
sed -i 's/fa-final/fa_final/g' BUSCO.table

#print names and quast
echo "Assembly #_contigs_(>=_0_bp) #_contigs_(>=_1000_bp) #_contigs_(>=_5000_bp) #_contigs_(>=_10000_bp) #_contigs_(>=_25000_bp) #_contigs_(>=_50000_bp) Total_length_(>=_0_bp) Total_length_(>=_1000_bp) Total_length_(>=_5000_bp) Total_length_(>=_10000_bp) Total_length_(>=_25000_bp) Total_length_(>=_50000_bp) #_contigs Largest_contig Total_length GC_(%) N50 N75 L50 L75 #_N's_per_100_kbp" > quast.table

for f in *.quast/report.txt; do tail -n 22 $f | awk 'ORS=" " {print $NF}END{printf "\n"}'; done >> quast.table

#join
join -1 1 -2 1 BUSCO.table quast.table | column -t > QC.table
cat BUSCO.table | column -t > tmp1; mv tmp1 BUSCO.table
cat quast.table | column -t > tmp1; mv tmp1 quast.table

#use less -S to view the table!
