#!/bin/bash 

#SBATCH -J RunTrinityNorm                                 
#SBATCH -p trinity
#SBATCH -o TrinityNorm_%j.log
#SBATCH -e TrinityNorm_%j.err 
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=16
#SBATCH --mem=150gb
#SBATCH --time=12:00:00 

source ../setup_files/path_set 

export PATH=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Trinity:$PATH

cd /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files

export reads=/home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --single $reads --PARALLEL_STATS --CPU 16
ln -s /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/single.norm.fq /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/input_files/reads-norm.fq
