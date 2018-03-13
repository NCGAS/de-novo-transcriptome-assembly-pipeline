for f in *final*; do k=`echo ${f%.transabyss.fa-final.fa}`; sed -i "s/>/>TransAb.$k./g" $f; echo "$k done"; done
cat *final* >> ../final_assemblies/TransAbyss.fa
echo "DONE"
