#PBS -k oe
#PBS -m abe ## Notify when abort, begin, end?
#PBS -M 
#PBS -N RunTrinity
#PBS -l nodes=1:ppn=16,vmem=220gb,walltime=4:00:00:00

module load trinityrnaseq/2.6.6
module load bowtie2/intel/2.3.2

cd PWDHERE/Trinity

export right=PWDHERE/input_files/right-norm.fq
export left=PWDHERE/input_files/left-norm.fq

Trinity --max_memory 200G --seqType fq  --left $left --right $right --CPU 16 --full_cleanup --output trinity_out_dir 
cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
