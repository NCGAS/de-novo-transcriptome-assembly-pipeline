#!/bin/bash 

#SBATCH -J RunSOAP1                                     
#SBATCH -p general 
#SBATCH -o SOAP1_%j.txt
#SBATCH -e SOAP1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END 
#SBATCH --mail-user=
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=4 
#SBATCH --mem=128gb
#SBATCH --time=24:00:00 

##Move to correct WD
cd PWDHERE/SOAP

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-Trans-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-Trans-127mer all -s config_file -K 55 -o output55 &

wait
