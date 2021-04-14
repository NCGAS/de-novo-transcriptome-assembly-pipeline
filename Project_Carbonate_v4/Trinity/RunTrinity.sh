#!/bin/bash 

#SBATCH -J RunTrinity                                   
#SBATCH -p general 
#SBATCH -o Trinity_%j.log
#SBATCH -e Trinity_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=220gb
#SBATCH --time=4-0:0:00 

module load trinityrnaseq/2.6.6

cd PWDHERE/Trinity

export right=PWDHERE/input_files/right-norm.fq
export left=PWDHERE/input_files/left-norm.fq

Trinity --max_memory 200G --seqType fq  --left $left --right $right --CPU 16 --full_cleanup --output trinity_out_dir 
cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
