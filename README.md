de novo transcriptome assembly pipeline
=============================================

This pipeline combines multiple assemblers and multiple paramters using the combined de novo transcriptome assembly pipelines. For more information, go to https://ncgas.org/WelcomeBasket_Pipeline.php 

Contact the NCGAS team (help@ncgas.org) if you have any questions.

The pipeline is currently set up ONLY for TORQUE job handlers (SLURM is in progress and will be updated soon), with current set up being for IU's Carbonate Cluster. If you want to run this on your own hardware, we can help you convert the scripts to run on your machine. READ THE READMEs. There are READMEs in every folder.

### Step 0: ###
You will need to run the start up script to set up your email, project location, and designate if you are using single or double strands.  This can be done with the following command:

  Setup.ba -e <your email> -s <single or double> -r <read length> -i <insert size if double>
@@ -29,21 +29,21 @@ You can get citations for all software by using: 
NOTE: You can change your email and strand setting several times, but the current working directory will only be run the first time.  As long as you don't move the directory, this will not cause any issues.
Also, this step can take a bit of time, and you can ignore any sed related errors - that is expected at this time!


### Step 1: ###
Put all your reads into input_files - DO THIS AFTER STEP 0! Otherwise it will take forever!
Read the README in input_files to get instructions for combining reads properly into input files.
You can do this with symlink (use command "man ln" if you are unfamiliar with this command).

Then run the normalization command - this will normalize your data and make it take less time/resources without loss of information.
This will output two files to this directory, left-norm.fq and right-norm.fq; these files will be used for the following assembly steps and other downstream analyses.
Command: qsub RunTrinity.normalize.sh


### Step 2: SOAP ###
Run RunSOAP1.sh and RunSOAP1b.sh. You can submit these jobs at the same time.
Command: qsub RunSOAP1.sh; qsub RunSOAP1b.sh
When both jobs finish, run ./Combine.sh
Command: ./Combine.sh


### Step 2b: Velvet ###
Run RunVelvet1.sh and RunVelvet1b.sh. 
Command: qsub RunVelvet1.sh; qsub RunVelvet1b.sh
When BOTH above are complete, run RunVelvet2.sh and RunVelvet2b.sh. Again, you can submit these jobs at the same time.
@@ -53,17 +53,17 @@ When RunVelvet2 jobs are complete, submit RunVelvet3 jobs. 
Command: qsub RunVelvet3.sh; qsub RunVelvet3b.sh
When all six velvet jobs finish, run ./Combine.sh
Command: ./Combine.sh


### Step 2c: TransAbyss ###
Run RunTransAb1.sh and RunTransAb1b.sh. You can submit these jobs at the same time.
Command: qsub RunTransAbyss1.sh; qsub RunTransAbyss1b.sh
When they finish, run ./Combine.sh
Command: ./Combine.sh


### Step 2d: Trinity
Run RunTrinity.sh. There is no combine script for this assembler.
Command: qsub RunTrinity.sh


### Step 3: Combine all outputs ###
The output of each combined assembly will be automatically placed in final_assembly.
FIRST run ./Combine.sh to get one input for Evigenes
THEN run RunEviGene.sh
@@ -83,13 +83,15 @@ within okayset, you will set two sets of files:
SEE http://arthropods.eugenes.org/EvidentialGene/trassembly.html for documentation!
ALSO SEE https://ncgas.org/Blog_Posts/EviGene.php for an explanation of EviGene's methods!


### Step 4: ###
You can continue downstream analysis by following information in the README's in final_assemblies, 
1. annotation using Trinotate
2. differential expression (DE) using Kallisto
3. quality control (QC) runs BUSCO and QUAST to calculate assembly statistics

This step can be done on data assembled with version 4 or previous versions (2 or 3) of the pipeline!

### Indiana University Machine (Torque job handler) ###
Project Carbonate v1- original scripts as described at PAG 2018
Project Carbonate v2- added updated transabyss (2.0) and defaulted everything everything to run on normalized files, added normalization script to input_files
Project Carbonate v4- original scripts as described in PAG 2019

### Pittsburgh Supercomputing Center's Bridges system (SLURM job handler) ###
Project Bridges v1- original scripts as described at PAG 2018
Project Bridges v2- added updated transabyss (2.0) and defaulted everything everything to run on normalized files, added normalization script to input_files
Project Bridges v4- in progress

### Youtube videos from workshop ###
This pipeline was taught at NCGAS' Transcriptome assembly workshop; all lectures are available on YouTube, https://www.youtube.com/playlist?list=PLqi-7yMgvZy_IaAiPG89AX2cQH2JY4Ifo&disable_polymer=true
