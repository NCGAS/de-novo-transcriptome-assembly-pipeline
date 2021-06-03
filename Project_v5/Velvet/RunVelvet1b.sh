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
cd /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/Velvet
source ../setup_files/path_set 

export PATH=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Velvet:$PATH

#input define
reads=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads-norm.fq

##run code
velveth oases.65 65 -short -fastq $reads &
velveth oases.75 75 -short -fastq $reads &
velveth oases.85 85 -short -fastq $reads &

wait

sbatch RunVelvet2b.sh
