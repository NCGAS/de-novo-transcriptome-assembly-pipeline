#PBS -N TransAb1
#PBS -m bea
#PBS -M YOUREMAILHERE
#PBS -l nodes=1:ppn=10,walltime=12:00:00,vmem=100gb

#set wd
cd PWDHERE/TransAbyss

# set up the environment
TRANSABYSS_PATH=/N/soft/rhel6/transabyss/1.5.5
export PATH=${TRANSABYSS_PATH}:${TRANSABYSS_PATH}/bin/:${PATH}

module load gcc/4.9.2
module load abyss/1.5.1_k96-openmpi
module load python/2.7.9
module load blat/35

#run
reads1=PWDHERE/input_files/left.fq
reads2=PWDHERE/input_files/right.fq
OD=`pwd`

transabyss -k 35 --pe $reads1 $reads2 --outdir $OD --name k35.transabyss.fa --threads 4 -c 12 
transabyss -k 45 --pe $reads1 $reads2 --outdir $OD --name k45.transabyss.fa --threads 4 -c 12 
transabyss -k 55 --pe $reads1 $reads2 --outdir $OD --name k55.transabyss.fa --threads 4 -c 12 
