#join all files by name of transcript, but keep only fifth column (tpm)

#TO BE TESTED
f=`ls *kallisto/abundance.tsv | head -n 1 | sed 's|/abundance.tsv||g'`
awk '{print $1}' $f > list
for f in *_kallisto*/abundance.tsv; do join -1 1 -2 1 tmp <(awk '{print $1,$5}' $f) | sed "s/tpm/${f%_kallisto/abundance.tsv}/g" > tmp2; mv tmp2 tmp; done

#old
#join -1 1 -2 1 <(awk '{print $1,$5}' Sample12_treat/abundance.tsv) <(awk '{print $1,$5}' Sample5_treat/abundance.tsv ) > tmp
#join -1 1 -2 1 tmp <(awk '{print $1,$5}' Sample14_control/abundance.tsv ) > tmp2
#join -1 1 -2 1 tmp2 <(awk '{print $1,$5}' Sample2_control/abundance.tsv ) > tmp

#fix header
sed -i 1d tmp

###NEEDS TO BE CHANGED!!!###
#change this based on your sample names to be used in samples_described
echo " T12 T5 C14 C2" > matrix
cat tmp >> matrix

#cleanup
rm tmp
rm tmp2

#make tabs
sed -i 's/\ /\t/g' matrix

