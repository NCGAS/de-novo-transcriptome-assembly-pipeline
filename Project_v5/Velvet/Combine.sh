sed -i 's/>/>Velvet_k35_/g' oases.35/transcripts.fa 
sed -i 's/\///g' oases.35/transcripts.fa
echo "k35 done.."
sed -i 's/>/>Velvet_k45_/g' oases.45/transcripts.fa 
sed -i 's/\///g' oases.45/transcripts.fa
echo "k45 done.."
sed -i 's/>/>Velvet_k55_/g' oases.55/transcripts.fa 
sed -i 's/\///g' oases.55/transcripts.fa
echo "k55 done.."
sed -i 's/>/>Velvet_k65_/g' oases.65/transcripts.fa 
sed -i 's/\///g' oases.65/transcripts.fa
echo "k65 done.."
sed -i 's/>/>Velvet_k75_/g' oases.75/transcripts.fa 
sed -i 's/\///g' oases.75/transcripts.fa
echo "k75 done.."
sed -i 's/>/>Velvet_k85_/g' oases.85/transcripts.fa 
sed -i 's/\///g' oases.85/transcripts.fa
echo "k85 done.."
cat */transcripts.fa > ../final_assemblies/Velvet.fa
echo "DONE"
