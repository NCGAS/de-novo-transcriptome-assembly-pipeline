#PBS -N TransAb1b
#PBS -m bea
#PBS -M YOUREMAILHERE
#PBS -l nodes=1:ppn=10,walltime=12:00:00,vmem=100gb

#set wd
cd PWDHERE/TransAbyss

module load transabyss/2.0.1
module load igraph/python/0.7.1
module load blat
#run
reads1=PWDHERE/input_files/left-norm.fq
reads2=PWDHERE/input_files/right-norm.fq
OD=`pwd`

transabyss -k 65 --pe $reads1 $reads2 --outdir $OD --name k65.transabyss.fa --threads 4 -c 12 
transabyss -k 75 --pe $reads1 $reads2 --outdir $OD --name k75.transabyss.fa --threads 4 -c 12 
transabyss -k 85 --pe $reads1 $reads2 --outdir $OD --name k85.transabyss.fa --threads 4 -c 12 

