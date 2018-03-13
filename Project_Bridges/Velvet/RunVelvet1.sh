#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=YOUREMAILHERE
#SBATCH --job-name="RunVelvet1"
#SBATCH --partition=LM
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --time=3:00:00
#SBATCH --mem=400GB

#echo commands to stdout
set -x

#Move to correct WD
cd PWDHERE/Velvet

##load modules
module load python/intel_2.7.13
module load velvet/1.2.10-maxk63-big

#input define
right=PWDHERE/input_files/right-norm.fq
left=PWDHERE/input_files/left-norm.fq

##run code
velveth oases.35 35 -shortPaired -fastq -separate $left $right &
velveth oases.45 45 -shortPaired -fastq -separate $left $right &
velveth oases.55 55 -shortPaired -fastq -separate $left $right &

wait
