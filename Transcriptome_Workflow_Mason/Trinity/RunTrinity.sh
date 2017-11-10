#PBS -k oe
#PBS -m abe ## Notify when abort, begin, end?
#PBS -M YOUREMAILHERE
#PBS -N RunTrinity
#PBS -l nodes=1:ppn=16,vmem=220gb,walltime=4:00:00:00

module load bowtie
module load samtools/1.2
module load java/jre/1.8.0_73
module load gcc/4.9.2
module load trinityrnaseq/2.2.0

cd PWDHERE/Trinity

export right=PWDHERE/input_files/right.fq
export left=PWDHERE/input_files/left.fq

Trinity --max_memory 200G --seqType fq  --left $left --right $right --CPU 16 --full_cleanup --output trinity_out_dir 
cp trinity_out_dir.Trinity.fasta ../final_assemblies/Trinity.fa
