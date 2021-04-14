#!/bin/bash 

#SBATCH -J TransAb1b                                   
#SBATCH -p general 
#SBATCH -o TransAb1b_%j.log
#SBATCH -e TransAb1b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=10
#SBATCH --mem=100gb
#SBATCH --time=12:00:00 

#set wd
cd PWDHERE/TransAbyss

module load python/3.6.8
module load igraph/python3.6/0.9.0
module load transabyss/2.0.1
module load igraph/python/0.7.1
module load blat
#run
reads1=PWDHERE/input_files/left-norm.fq
reads2=PWDHERE/input_files/right-norm.fq
OD=`pwd`

transabyss -k 65 --pe $reads1 $reads2 --outdir $OD --name k65.transabyss.fa --threads 4 -c 12 
transabyss -k 75 --pe $reads1 $reads2 --outdir $OD --name k75.transabyss.fa --threads 4 -c 12 
transabyss -k 85 --pe $reads1 $reads2 --outdir $OD --name k85.transabyss.fa --threads 4 -c 12 

