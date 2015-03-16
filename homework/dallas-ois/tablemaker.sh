cd ./data-hold/pdfs
mkdir narratives
for f in *.pdf; do
pdftotext -layout $f
done
for f in *.txt; do
cat $f | tr '[:space:]' ' ' > ~/compciv/homework/dallas-ois/data-hold/pdfs/narratives/$f
done
cd ..
printf 'case_number|date|location|suspect_status|suspect_weapon|suspects|officers|grand_jury|latitude|longitude|narrative\n' > ~/compciv/homework/dallas-ois/tables/incidents.psv

cat addresses.txt | while read line; do
location=$(echo $line)
case_number=$(cat *.json | grep -A 5 -B 2 "$location" | head -1 | sed s/"case_id"// | tr -d '"' | tr -d ':' | tr -d ',' | sed s/"   "//)
date=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'date' | sed s/"date"// | tr -d '"' | tr -d ':' | tr -d ',' | sed s/"   "//)
suspect_status=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'suspect_status' | sed s/"suspect_status"// | tr -d '"' | tr -d ':' | tr -d ',' | sed s/"   "//)
suspect_weapons=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'suspect_weapons' | sed s/"suspect_weapons"// | tr -d '"' | tr -d ':' | tr -d ',' | sed s/"   "//)
suspects=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'suspects' | sed s/"suspects"// | tr -d '"' | tr -d ':' | sed 's/,$//' | sed s/"   "//)
officers=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'officers' | sed s/"officers"// | tr -d '"' | tr -d ':' | sed 's/,$//' | sed s/"   "//)
grand_jury=$(cat *.json | grep -A 5 -B 2 "$location" | grep 'grand_jury' | sed s/"grand_jury"// | tr -d '"' | tr -d ':' | tr -d ',' | sed s/"   "//)
cd ~/compciv/homework/dallas-ois/tables
latitude=$(cat geocodes.psv | grep "$location" | grep -o '[3,4][[:digit:]]\.\w*')
longitude=$(cat geocodes.psv | grep "$location" | grep -o '.9[[:digit:]]\.\w*')
cd ~/compciv/homework/dallas-ois/data-hold/pdfs/narratives
narrative_case=$(echo $case_number | sed s/"2014"// | grep -o '[[:alnum:]]\w*')
narrative=$(ls | grep "$narrative_case" | while read line; do
cat $line
done)
printf '%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s\n' "$case_number" "$date" "$location" "$suspect_status" "$suspect_weapons" "$suspects" "$officers" "$grand_jury" "$latitude" "$longitude" "$narrative" >> ~/compciv/homework/dallas-ois/tables/incidents.psv
cd ~/compciv/homework/dallas-ois/data-hold
done

cd ~/compciv/homework/dallas-ois/data-hold
printf 'last_name|first_name\n' > officers.psv
officernames=$(cat *.json | jq '.officers' | tr -d '"')
echo $officernames | sed "s/\/M/\/M#/g" | sed "s/\/F/\/M#/g" | grep -oE "[^#]+" | sed "s/(//g" | sed "s/)//g" | sed "s/"Officers"//g" | while read line; do
last_name=$(echo $line | grep -oiE '\b[^,]+,' | tr -d ',')
first_name=$(echo $line | grep -oiE ',..[[:alpha:]]+\b' | grep -oiE '[[:alpha:]]+$')
printf '%s|%s\n' "$last_number" "$first_name" >> officers.psv 
done

