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
cd PWDHERE/input_files

#module loads 
module load bowtie
module load samtools/1.3.1
module load java/jdk8u73
module load gcc/5.3.0
module load trinity/2.2.0

export right=PWDHERE/input_files/right.fq
export left=PWDHERE/input_files/left.fq

/opt/packages/trinity/2.4.0/util/insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --left $left --right $right --pairs_together --PARALLEL_STATS --CPU 16
ln -s PWDHERE/input_files/left.norm.fq PWDHERE/input_files/left-norm.fq
ln -s PWDHERE/input_files/right.norm.fq PWDHERE/input_files/right-norm.fq

