sed -i 's/>/>SOAP_k35_/g' output35.scafSeq 
echo "k35 done"
sed -i 's/>/>SOAP_k45_/g' output45.scafSeq 
echo "k45 done"
sed -i 's/>/>SOAP_k55_/g' output55.scafSeq 
echo "k55 done"
sed -i 's/>/>SOAP_k65_/g' output65.scafSeq 
echo "k65 done"
sed -i 's/>/>SOAP_k75_/g' output75.scafSeq 
echo "k75 done"
sed -i 's/>/>SOAP_k85_/g' output85.scafSeq 
echo "k85 done"
cat output*.scafSeq > ../final_assemblies/SOAP.fa 
echo "Done!"
