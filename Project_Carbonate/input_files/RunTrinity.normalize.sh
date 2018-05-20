#PBS -k oe
#PBS -m abe ## Notify when abort, begin, end?
#PBS -M YOUREMAILHERE
#PBS -N RunTrinity
#PBS -l nodes=1:ppn=16,vmem=150gb,walltime=2:00:00:00

module load trinityrnaseq/2.6.6
module load bowtie2/intel/2.3.2

cd PWDHERE/input_files

export right=PWDHERE/input_files/right.fq
export left=PWDHERE/input_files/left.fq

insilico_read_normalization.pl --seqType fq -JM 100G --max_cov 30 --left $left --right $right --pairs_together --PARALLEL_STATS --CPU 16
ln -s PWDHERE/input_files/left.norm.fq PWDHERE/input_files/left-norm.fq
ln -s PWDHERE/input_files/right.norm.fq PWDHERE/input_files/right-norm.fq

