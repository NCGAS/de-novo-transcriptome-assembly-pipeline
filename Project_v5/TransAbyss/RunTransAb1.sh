#!/bin/bash 

#SBATCH -J TransAb1                                    
#SBATCH -p trinity
#SBATCH -o TransAb1_%j.log
#SBATCH -e TransAb1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=2
#SBATCH --mem=100gb
#SBATCH --time=12:00:00 

#set wd
cd /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/TransAbyss
source ../setup_files/path_set 

export PATH=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/TransABySS:$PATH

#run
reads=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads-norm.fq
OD=`pwd`

transabyss -k 35 --se $reads --outdir $OD --name k35.transabyss.fa --threads 2 -c 12 &
transabyss -k 45 --se $reads --outdir $OD --name k45.transabyss.fa --threads 2 -c 12 &
transabyss -k 55 --se $reads --outdir $OD --name k55.transabyss.fa --threads 2 -c 12 &

wait
