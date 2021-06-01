#! /bin/bash

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
install TransABySS /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/TransABySS/*.sif
install SOAP /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/SOAPdenovo/*.sif
install Velvet /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Velvet/*.sif
install Trinity /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinity/*.sif
install EviGene /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/EviGene/*.sif

#annotation
install Trinotate /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Trinotate/*.sif
install Hmmer /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Hmmer/*.sif
install BLAST /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Blast/*.sif
install SignalP /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/SignalP/*.sif
install TmHmm /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/TmHmm/*.sif

#QC
install Quast /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Quast/*.sif
install BUSCO /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/BUSCO/*.sif

#DE (also needs trinity)
install Kallisto /N/slate/ss93/Full_set/transcriptome-workshop-SP2021/Project_v5/software/Kallisto/*.sif
