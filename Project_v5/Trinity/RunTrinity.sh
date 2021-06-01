#!/bin/bash 

#SBATCH -J RunTrinity                                   
#SBATCH -p trinity
#SBATCH -o Trinity_%j.log
#SBATCH -e Trinity_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=220gb
#SBATCH --time=4-0:0:00 

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinity:$PATH

cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/Trinity

export reads=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/input_files/reads-norm.fq

Trinity --max_memory 200G --seqType fq  --single $reads --CPU 6 --full_cleanup --output trinity_out_dir 

cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
