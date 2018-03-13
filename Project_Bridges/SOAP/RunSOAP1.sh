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
SOAPdenovo-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-127mer all -s config_file -K 55 -o output55 &

wait
