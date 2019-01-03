#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunAnnotate
#PBS -l nodes=1:ppn=1,vmem=10gb,walltime=1:00:00

##Move to correct WD
cd PWDHERE/final_assemblies/annotation

./Annotate.sh -p GENE
