#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=YOUREMAILHERE
#SBATCH --job-name="RunTrinity"
#SBATCH --partition=LM
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --time=24:00:00
#SBATCH --mem=220GB

#echo commands to stdout
set -x

##Move to correct WD
cd PWDHERE/Trinity

#module loads 
module load bowtie
module load samtools/1.3.1
module load java/jdk8u73
module load gcc/5.3.0
module load trinity/2.2.0

export right=PWDHERE/input_files/right-norm.fq
export left=PWDHERE/input_files/left-norm.fq

Trinity --max_memory 200G --seqType fq  --left $left --right $right --CPU 16 --full_cleanup --output trinity_out_dir 
cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
