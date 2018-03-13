sed -i 's/>/>Velvet.k35./g' oases.35/contigs.fa 
echo "k35 done.."
sed -i 's/>/>Velvet.k45./g' oases.45/contigs.fa 
echo "k45 done.."
sed -i 's/>/>Velvet.k55./g' oases.55/contigs.fa 
echo "k55 done.."
sed -i 's/>/>Velvet.k65./g' oases.65/contogs.fa 
echo "k65 done.."
sed -i 's/>/>Velvet.k75./g' oases.75/contigs.fa 
echo "k75 done.."
sed -i 's/>/>Velvet.k85./g' oases.85/contigs.fa 
echo "k85 done.."
cat */contigs.fa > ../final_assemblies/Velvet.fa
echo "DONE"
