#!/bin/bash 

#SBATCH -J RunTrinity                                   
#SBATCH -p trinity
#SBATCH -o Trinity_%j.log
#SBATCH -e Trinity_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=220gb
#SBATCH --time=4-0:0:00 

export PATH=PWDHERE/software/Trinity:$PATH

cd PWDHERE/Trinity

export reads=PWDHERE/input_files/reads-norm.fq

Trinity --max_memory 200G --seqType fq  --single $reads --CPU 6 --full_cleanup --output trinity_out_dir 

cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
