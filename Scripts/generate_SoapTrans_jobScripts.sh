#!/bin/bash
### For running Soap-trans on Mason

### The following script is for generating many job scripts/qsub scripts at once in order to get the best job throughput possible on Mason.
#   Always try to request the minimum amount of job resource for your particular input file(s)
#   This will ensure your job can squeaze into the tiniest cracks on the scheduler left when bigger jobs are placed!

### Change the config parameters for Soap-Trans here
#   Definitely check the q line and change to q1= and q2= if you have paired reads
#   Set max read length to the longest you have or take it out
### asm_flags doesn't usually change
function write_config {
    readpath=$1
    #read1=$1
    #read2=$2
    cat > config_file <<EOF
#maximal read length
max_rd_len=200
[LIB]
#maximal read length in this lib
rd_len_cutof=200
#if sequence needs to be reversed
reverse_seq=0
#in which part(s) the reads are used
asm_flags=3
#minimum aligned length to contigs for a reliable read location (at least 32 for short insert size)
map_len=32
#fastq file for input data
q=$readpath
#q1=$read1
#q2=$read2
EOF

}

### This function writes a job script that can then be submitted via qsub
function write_qsub_script {
    k=$1
    sample=$2
    working_directory=$3
    outdir=${working_directory}/${sample}/${sample}/k${k}

#define the template.
    cat > runSoap${k}.sh <<EOF
#PBS -k oe
#PBS -N soap_${sample}_$k
#PBS -m abe
#PBS -M youremailaddress@iu.edu
#PBS -l nodes=1:ppn=4,walltime=36:00:00,vmem=64gb
#set wd
cd $working_directory

##load modules
module load soapdenovotrans/1.03

##run code
SOAPdenovo-Trans-127mer all -s config_file -K $k -o $outdir

EOF
}

# define parameters which are passed in.
# Values of k should be odd numbers and smaller than your read lengths
# Choosing multiple and combining them later can make for a more complete assembly
ks="21 25 29 31 35"
# Here I have it set so that the samples are the names used in my trimmed files, and I'll use these as prefixes for the assembly outputs. 
# You don't have to do it this way, if you have another way to iterate over all the files you want assembled seperately
samples="treated_1 treated_2 treated_3 control_1 control_2 control_3"

working_directory=$PBS_O_WORKDIR
for sample in $samples; do
    cd $working_directory
    mkdir -p "${sample}"
    cd "${sample}"
    # Put in the path for your read file(s) here. I use the sample name to iterate over my files
    read="/N/dc2/projects/../trimmed_${sample}.fq"
    # If you have paired reads, get the second one:
    #read2="/N/dc2/projects/../trimmed_${sample}_2.fq"
    write_config $read #$read2
    for k in $ks; do
	echo "k is $k and sample is $sample"
	write_qsub_script $k $sample $working_directory
    done
done