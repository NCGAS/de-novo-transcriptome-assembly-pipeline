#!/bin/bash 

#SBATCH -J RunSOAP1b                                   
#SBATCH -p general 
#SBATCH -o SOAP1b_%j.log
#SBATCH -e SOAP1b_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=4 
#SBATCH --mem=128gb
#SBATCH --time=24:00:00 

##Move to correct WD
cd PWDHERE/SOAP/

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 65 -o output65 &
SOAPdenovo-Trans-127mer all -s config_file -K 75 -o output75 &
SOAPdenovo-Trans-127mer all -s config_file -K 85 -o output85 &

wait
