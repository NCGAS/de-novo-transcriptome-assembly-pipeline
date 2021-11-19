#!/bin/bash 

#SBATCH -J RunEviGene                                 
#SBATCH -p general
#SBATCH -o EviGene_%j.log
#SBATCH -e EviGene_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=3
#SBATCH --mem=200gb
#SBATCH --time=12:00:00 

source ../setup_files/path_set 
cd $PWDHERE/final_assemblies

export PATH=$PATH:$PWDHERE/software/EviGene/

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

trclass2mainalt.pl -trclass *trclass
mv *mainalt.tab annotation/
cat okayset/combined.okay.fa okayset/combined.okalt.fa > annotation/transcripts.fa
cat okayset/combined.okay.aa okayset/combined.okalt.aa > annotation/transcripts.aa
