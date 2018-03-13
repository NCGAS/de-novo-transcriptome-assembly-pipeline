# de novo transcriptome assembly pipeline

The pipeline is currently set up for SLURM and TORQUE job handlers, with current set up being for IU Carbonate Cluster and PSC Bridges.  If you want to run this on your own hardware, we can help you convert the scripts to run on your machine.
READ THE READMEs.  There are READMEs in every folder.

There are two commands you must run first that are in that file.  The first will set the email address so that you get notification when the jobs are done.  The second will set the current directory as the working directory for the project.

Place your input in the input_sequences folder.  These should be trimmed and quality controlled sequences.  This pipeline does not deal with that step, as it is very context and project dependent.  Concatonate all your left reads into one file called left.fq; combine your right reads into right.fq.

For each assembler folder, run each set of steps.  If there are run files with the same prefix number (e.g. 1a and 1b), these can be run concurrently.  Simply submit both with qsub.  See README in each file for more information.

For description, documentation, and licence for each program, go here.  You can also use “module display $NAME” where  $NAME is the name of the module listed in the run files.

After you have finished the assemblies, run the ./Combine.sh script.  This will combine the kmers, label them with the kmer and the assembler, and output them to the final_assemblies folder

After all assemblers are done and there are <ASSEMBLER>.fa files for each in the final_assemblies files, run the final_assemblers/Combine.sh first, then run RunEvigenes.  See the README for details on the output and next steps.

# Indiana University Machine (Torque job handler)
Project Carbonate v1- original scripts as described at PAG 2018
Project Carbonate v2 - added updated transabyss (2.0) and defaulted everything everything to run on normalized files, added normalization script to input_files

# Pittsburgh Supercomputing Center's Bridges system (SLURM job handler)
Project Bridges v1- original scripts as described at PAG 2018
Project Bridges v2 - added updated transabyss (2.0) and defaulted everything everything to run on normalized files, added normalization script to input_files
