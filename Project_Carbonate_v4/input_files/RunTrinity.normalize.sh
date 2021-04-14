#!/bin/bash 

#SBATCH -J RunTrinityNorm                                 
#SBATCH -p general 
#SBATCH -o TrinityNorm_%j.log
#SBATCH -e TrinityNorm_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=150gb
#SBATCH --time=12:00:00 

module load trinityrnaseq/2.6.6

cd PWDHERE/input_files

export right=PWDHERE/input_files/right.fq
export left=PWDHERE/input_files/left.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --left $left --right $right --pairs_together --PARALLEL_STATS --CPU 16
ln -s PWDHERE/input_files/left.norm.fq PWDHERE/input_files/left-norm.fq
ln -s PWDHERE/input_files/right.norm.fq PWDHERE/input_files/right-norm.fq

