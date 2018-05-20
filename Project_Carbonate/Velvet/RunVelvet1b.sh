#PBS -k oe 
#PBS -m abe
#PBS -M YOUREMAILHERE
#PBS -N RunVelvet1b
#PBS -l nodes=1:ppn=2,vmem=400gb,walltime=3:00:00

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
