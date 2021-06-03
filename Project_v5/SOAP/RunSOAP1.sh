#!/bin/bash 

#SBATCH -J RunSOAP1                                     
#SBATCH -p trinity
#SBATCH -o SOAP1_%j.log
#SBATCH -e SOAP1_%j.err 
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=ss93@iu.edu
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=3
#SBATCH --cpus-per-task=2
#SBATCH --mem=128gb
#SBATCH --time=24:00:00

##Move to correct WD
source ../setup_files/path_set
cd $PWDHERE/SOAP

##load modules
export PATH=$PWDHERE/software/SOAPdenovo:$PATH

##run code
SOAPdenovo-Trans-127mer all -s config_file -K 35 -o output35 &
SOAPdenovo-Trans-127mer all -s config_file -K 45 -o output45 &
SOAPdenovo-Trans-127mer all -s config_file -K 55 -o output55 &

wait
