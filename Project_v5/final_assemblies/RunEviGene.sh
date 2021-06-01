#!/bin/bash 

#SBATCH -J RunEviGene                                 
#SBATCH -p trinity
#SBATCH -o EviGene_%j.log
#SBATCH -e EviGene_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=3
#SBATCH --mem=200gb
#SBATCH --time=12:00:00 

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/EviGene/:$PATH

cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/final_assemblies

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

trclass2mainalt.pl -trclass *trclass
mv *mainalt.tab annotation/
cat okayset/combined.okay.fa okayset/combined.okalt.fa > annotation/transcripts.fa
cat okayset/combined.okay.aa okayset/combined.okalt.aa > annotation/transcripts.aa
