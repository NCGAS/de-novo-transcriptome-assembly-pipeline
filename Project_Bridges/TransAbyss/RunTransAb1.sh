#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-type=END
#SBATCH --mail-user=YOUREMAILHERE
#SBATCH --job-name="TransAb1"
#SBATCH --partition=LM
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --time=12:00:00
#SBATCH --mem=100GB

#echo commands to stdout
set -x

##Move to correct WD
cd PWDHERE/TransAbyss

##load modules
module load python/2.7.11_gcc
module load boost/1.60.0
module load mpi
module load abyss
module load blat
export PATH=/opt/packages/transabyss/transabyss-2.0.1:$PATH

##run code
reads1=PWDHERE/input_files/left-norm.fq
reads2=PWDHERE/input_files/right-norm.fq
OD=`pwd`

transabyss -k 35 --pe $reads1 $reads2 --outdir $OD --name k35.transabyss.fa --threads 4 -c 12 
transabyss -k 45 --pe $reads1 $reads2 --outdir $OD --name k45.transabyss.fa --threads 4 -c 12 
transabyss -k 55 --pe $reads1 $reads2 --outdir $OD --name k55.transabyss.fa --threads 4 -c 12 

wait 
