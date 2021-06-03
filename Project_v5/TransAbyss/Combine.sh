for f in *final*; do \
k=`echo ${f%.transabyss.fa-final.fa}`; \
sed -i "s/TransAb_..._//g" $f ; \
sed -i "s/>/>TransAb.$k./g" $f; \
sed -i -E 's/>TransAb.k(..)./>TransAb_k\1_/g' $f; \
sed -i 's/\ /_/g' $f; \
echo "$k done"; \
done

cat *final* >> ../final_assemblies/TransAbyss.fa
echo "DONE"
