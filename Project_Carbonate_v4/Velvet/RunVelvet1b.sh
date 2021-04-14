#!/bin/bash 

#SBATCH -J RunVelvet1b                                   
#SBATCH -p general 
#SBATCH -o Velvet1b_%j.log
#SBATCH -e Velvet1b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=2
#SBATCH --mem=200gb
#SBATCH --time=03:00:00 

##Move to correct WD
cd PWDHERE/Velvet

##load modules
module load velvet/1.2.10
module load oases/0.2.09

#input define
right=PWDHERE/input_files/right-norm.fq
left=PWDHERE/input_files/left-norm.fq

##run code
velveth oases.65 65 -shortPaired -fastq -separate $left $right &
velveth oases.75 75 -shortPaired -fastq -separate $left $right &
velveth oases.85 85 -shortPaired -fastq -separate $left $right &

wait
