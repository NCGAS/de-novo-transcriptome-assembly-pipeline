#!/bin/bash 

#SBATCH -J TransAb1                                    
#SBATCH -p general
#SBATCH -o TransAb1_%j.log
#SBATCH -e TransAb1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END
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

transabyss -k 35 --se $reads --outdir $OD --name k35.transabyss.fa --threads 2 -c 12 &
transabyss -k 45 --se $reads --outdir $OD --name k45.transabyss.fa --threads 2 -c 12 &
transabyss -k 55 --se $reads --outdir $OD --name k55.transabyss.fa --threads 2 -c 12 &

wait
