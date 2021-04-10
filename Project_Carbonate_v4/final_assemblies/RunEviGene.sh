#!/bin/bash 

#SBATCH -J RunEviGene                                 
#SBATCH -p general 
#SBATCH -o RunEviGene_%j.out
#SBATCH -e RunEviGene_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=4
#SBATCH --mem=200gb
#SBATCH --time=12:00:00 

module load evigene/gnu/2013.07.27
module load blast 

cd PWDHERE/final_assemblies

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa

/N/soft/rhel7/evigene/gnu/2013.07.27/scripts/prot/trclass2mainalt.pl -trclass *trclass
mv *mainalt.tab annotation/
cat okayset/combined.okay.fa okayset/combined.okalt.fa > annotation/transcripts.fa
cat okayset/combined.okay.aa okayset/combined.okalt.aa > annotation/transcripts.aa

