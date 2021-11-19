#!/bin/bash 

#SBATCH -J TransAb1b                                    
#SBATCH -p general
#SBATCH -o TransAb1b_%j.log
#SBATCH -e TransAb1b_%j.err 
#SBATCH --mail-type=FAIL,END,BEGIN
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=2
#SBATCH --mem=100gb
#SBATCH --time=12:00:00 

#set wd
source ../setup_files/path_set 
cd $PWDHERE/TransAbyss

export PATH=$PATH:$PWDHERE/software/TransABySS

#run
reads=$PWDHERE/input_files/reads-norm.fq
OD=`pwd`

transabyss -k 65 --se $reads --outdir $OD --name k65.transabyss.fa --threads 2 -c 12 &
transabyss -k 75 --se $reads --outdir $OD --name k75.transabyss.fa --threads 2 -c 12 &
transabyss -k 85 --se $reads --outdir $OD --name k85.transabyss.fa --threads 2 -c 12 &

wait
