#PBS -k oe
#PBS -m abe
#PBS -M YOUREMAILHERE
#PBS -N RunEviGene
#PBS -l nodes=1:ppn=4,vmem=300gb,walltime=00:12:00:00

module load cd-hit/4.5.6
module load evigene/2013.07.27

export BLASTDV=/N/soft/blastdb

cd PWDHERE/final_assemblies

tr2aacds.pl -tidy -NCPU 3 -MAXMEM 131072 -log -cdna combined.fa
