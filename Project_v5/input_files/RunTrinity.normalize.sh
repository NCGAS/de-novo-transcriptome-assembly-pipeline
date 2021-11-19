#!/bin/bash 

#SBATCH -J RunTrinityNorm                                 
#SBATCH -p general
#SBATCH -o TrinityNorm_%j.log
#SBATCH -e TrinityNorm_%j.err 
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=150gb
#SBATCH --time=12:00:00 

source ../setup_files/path_set 

export PATH=$PATH:$PWDHERE/software/Trinity

cd $PWDHERE/input_files

export reads=$PWDHERE/input_files/reads.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --single $reads --PARALLEL_STATS --CPU 16
ln -s $PWDHERE/input_files/single.norm.fq $PWDHERE/input_files/reads-norm.fq
