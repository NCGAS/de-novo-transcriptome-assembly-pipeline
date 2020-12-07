#PBS -k oe 
#PBS -m abe
#PBS -M 
#PBS -N RunSOAP1b
#PBS -l nodes=1:ppn=4,vmem=128gb,walltime=24:00:00

##Move to correct WD
cd PWDHERE/SOAP/

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 65 -o output65 &
SOAPdenovo-Trans-127mer all -s config_file -K 75 -o output75 &
SOAPdenovo-Trans-127mer all -s config_file -K 85 -o output85 &

wait
