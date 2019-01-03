#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunVelvet3b
#PBS -l nodes=1:ppn=2,vmem=200gb,walltime=3:00:00

##Move to correct WD
cd PWDHERE/Velvet

##load modules
module load velvet/1.2.10
module load oases/0.2.09

#input define
right=PWDHERE/input_files/right-norm.fq
left=PWDHERE/input_files/left-norm.fq

##run code
oases oases.65 &
oases oases.75 &
oases oases.85 &

wait
