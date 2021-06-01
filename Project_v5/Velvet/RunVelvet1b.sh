#!/bin/bash 

#SBATCH -J RunVelvet1b                                   
#SBATCH -p trinity
#SBATCH -o Velvet1b_%j.log
#SBATCH -e Velvet1b_%j.err 
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
velveth oases.65 65 -short -fastq $reads &
velveth oases.75 75 -short -fastq $reads &
velveth oases.85 85 -short -fastq $reads &

wait

sbatch RunVelvet2b.sh
