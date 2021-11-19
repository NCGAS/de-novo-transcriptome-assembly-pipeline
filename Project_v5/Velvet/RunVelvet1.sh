#!/bin/bash 

#SBATCH -J RunVelvet1                                   
#SBATCH -p general
#SBATCH -o Velvet1_%j.log
#SBATCH -e Velvet1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
source ../setup_files/path_set 
cd $PWDHERE/Velvet

export PATH=$PATH:$PWDHERE/software/Velvet

#input define
reads=$PWDHERE/input_files/reads-norm.fq

##run code
velveth oases.35 35 -short -fastq  $reads &
velveth oases.45 45 -short -fastq  $reads &
velveth oases.55 55 -short -fastq  $reads &

wait

sbatch RunVelvet2.sh
