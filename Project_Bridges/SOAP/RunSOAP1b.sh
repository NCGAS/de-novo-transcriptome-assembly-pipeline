#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-type=END
#SBATCH --mail-user=YOUREMAILHERE
#SBATCH --job-name="RunSOAP1"
#SBATCH --partition=LM
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --time=24:00:00
#SBATCH --mem=128GB

#echo commands to stdout
set -x

##Move to correct WD
cd PWDHERE/SOAP

##load modules
module load soapdenovo2/2015-10-09

##run code
SOAPdenovo-127mer all -s config_file -K 65 -o output65 &
SOAPdenovo-127mer all -s config_file -K 75 -o output75 &
SOAPdenovo-127mer all -s config_file -K 85 -o output85 &

wait
