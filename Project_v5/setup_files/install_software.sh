#! /bin/bash

source ../setup_files/path_set 

function install {
SIF="$2"
FILE="${2%\**}"
PROG="$1"

echo "Looking for $PROG..."

if [ -f "$SIF" ]; then
     echo "...${SIF#*/} already here!"
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
		bash install_singularity.sh
        else
               module load singularity
        fi
fi
}

singcheck
#assembly
install TransABySS $PWDHERE/software/TransABySS/*.sif
install SOAP $PWDHERE/software/SOAPdenovo/*.sif
install Velvet $PWDHERE/software/Velvet/*.sif
install Trinity $PWDHERE/software/Trinity/*.sif
install EviGene $PWDHERE/software/EviGene/*.sif

#annotation
install Trinotate $PWDHERE/software/Trinotate/*.sif
install Hmmer $PWDHERE/software/Hmmer/*.sif
install BLAST $PWDHERE/software/Blast/*.sif
install SignalP $PWDHERE/software/SignalP/*.sif
install TmHmm $PWDHERE/software/TmHmm/*.sif

#QC
install Quast $PWDHERE/software/Quast/*.sif
install BUSCO $PWDHERE/software/BUSCO/*.sif

#DE (also needs trinity)
install Kallisto $PWDHERE/software/Kallisto/*.sif

