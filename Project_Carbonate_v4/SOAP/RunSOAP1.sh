#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunSOAP1
#PBS -l nodes=1:ppn=4,vmem=128gb,walltime=24:00:00

##Move to correct WD
cd PWDHERE/SOAP

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-Trans-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-Trans-127mer all -s config_file -K 55 -o output55 &

wait
