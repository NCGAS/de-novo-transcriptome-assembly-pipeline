sed -i 's/>/>SOAP.k35./g' output35.scafSeq 
echo "k35 done"
sed -i 's/>/>SOAP.k45./g' output45.scafSeq 
echo "k45 done"
sed -i 's/>/>SOAP.k55./g' output55.scafSeq 
echo "k55 done"
sed -i 's/>/>SOAP.k65./g' output65.scafSeq 
echo "k65 done"
sed -i 's/>/>SOAP.k75./g' output75.scafSeq 
echo "k75 done"
sed -i 's/>/>SOAP.k85./g' output85.scafSeq 
echo "k85 done"
cat output*.scafSeq > ../final_assemblies/SOAP.fa 
echo "Done!"
