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
install TransABySS /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/TransABySS/*.sif
install SOAP /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/SOAPdenovo/*.sif
install Velvet /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Velvet/*.sif
install Trinity /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Trinity/*.sif
install EviGene /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/EviGene/*.sif

#annotation
install Trinotate /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Trinotate/*.sif
install Hmmer /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Hmmer/*.sif
install BLAST /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Blast/*.sif
install SignalP /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/SignalP/*.sif
install TmHmm /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/TmHmm/*.sif

#QC
install Quast /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Quast/*.sif
install BUSCO /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/BUSCO/*.sif

#DE (also needs trinity)
install Kallisto /home/ssanders/Documents/de-novo-transcriptome-assembly-pipeline/Project_v5/software/Kallisto/*.sif

