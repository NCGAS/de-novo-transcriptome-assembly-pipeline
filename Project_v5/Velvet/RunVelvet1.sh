#!/bin/bash 

#SBATCH -J RunVelvet1                                   
#SBATCH -p trinity
#SBATCH -o Velvet1_%j.log
#SBATCH -e Velvet1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/Velvet

export PATH=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Velvet:$PATH

#input define
reads=/N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/input_files/reads-norm.fq

##run code
velveth oases.35 35 -short -fastq  $reads &
velveth oases.45 45 -short -fastq  $reads &
velveth oases.55 55 -short -fastq  $reads &

wait

sbatch RunVelvet2.sh
