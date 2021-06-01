#join all files by name of transcript, but keep only fifth column (tpm)

#copy the first column of one of your sample outputs into tmp to create a list of transcripts:
awk '{print $1}' Sample1N_0min_kallisto/abundance.tsv | sed 1d | sort > tmp

#loop through the samples and merge them into the list
for f in *_kallisto/abundance.tsv; do join -1 1 -2 1 tmp <(awk '{print $1,$5}' $f | sed 1d | sort -k1,1) > tmp2; mv tmp2 tmp; done

###NEEDS TO BE CHANGED!!!###
#change this based on your sample names to be used in samples_described
echo " 0.1n 10.1n 30.1n 0.1p 10.1p 30.1p 0.2n 10.2n 30.2n 0.2p 10.2p 30.2p 0.3n 10.3n 30.3n 0.3p 10.3p 30.3p" > matrix
cat tmp >> matrix

#cleanup
rm tmp

#make tabs
sed -i 's/\ /\t/g' matrix
