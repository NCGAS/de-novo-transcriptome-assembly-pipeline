#! /bin/bash

source ./setup_files/path_set
echo $PWDHERE

function install {
SIF="$2"
FILE="${2%\**}"
PROG="$1"
COMMAND="$3"

echo "Looking for $PROG..."

if [ -f "$SIF" ]; then
     echo "...${SIF#*/} already here!"
elif [[ $(which $COMMAND) ]]; then
     echo "...Program found in PATH, skipping installation!"
else
     echo "...Not found, installing from: $FILE/pull.sh"
     cd $FILE
     bash pull.sh
     echo "...Installed $PROG"
fi

}

function singcheck {
echo "Looking for Singularity"
if [ ! $(command -v singularity) ]; then
        if [ ! $(command -v module load singularity) ]
        then
		sudo su -c 'bash ./setup_files/install_singularity.sh'
        else
               module load singularity
        fi
fi
}

singcheck
#assembly
install TransABySS $PWDHERE/software/TransABySS/*.sif transabyss
install SOAP $PWDHERE/software/SOAPdenovo/*.sif SOAPdenovo-Trans-127mer
install Velvet $PWDHERE/software/Velvet/*.sif velvetg
install Trinity $PWDHERE/software/Trinity/*.sif Trinity
install EviGene $PWDHERE/software/EviGene/*.sif tr2aacds.pl

#annotation
install Trinotate $PWDHERE/software/Trinotate/*.sif Trinotate
install Hmmer $PWDHERE/software/Hmmer/*.sif hmmscan
install BLAST $PWDHERE/software/Blast/*.sif blastn
install SignalP $PWDHERE/software/SignalP/*.sif signalp
install TmHmm $PWDHERE/software/TmHmm/*.sif tmhmm

#QC
install Quast $PWDHERE/software/Quast/*.sif quast.py
install BUSCO $PWDHERE/software/BUSCO/*.sif busco

#DE (also needs trinity)
install Kallisto $PWDHERE/software/Kallisto/*.sif kallisto

