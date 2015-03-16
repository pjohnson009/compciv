cd ./data-hold
for x in $(seq 2003 2012); do
cat $x.html | pup 'table table tr json{}' | 
  jq '.[] .children | { 
    case_pdf_href: .[0] .children[0] .href, 
    case_id: .[0] .children[0] .text, 
    date: .[1] .text ,
    address: .[2] .text,
    suspect_status: .[3] .text,
    suspect_weapons: .[4] .text,
    suspects: .[5] .text,
    officers: .[6] .text,
    grand_jury: .[7] .text
  }' > $x.json
done

cat 20132014.html | pup 'table table tr json{}' | 
  jq '.[] .children | { 
    case_pdf_href: .[0] .children[0] .href, 
    case_id: .[0] .children[0] .text, 
    date: .[1] .text ,
    address: .[2] .text,
    suspect_status: .[3] .text,
    suspect_weapons: .[4] .text,
    suspects: .[5] .text,
    officers: .[6] .text,
    grand_jury: .[7] .text
  }' > 2013.json

cat *.json | jq '.address' | grep -v 'Location' | tr -d '"' > addresses.txt
cat addresses.txt | grep -v '2120 52' | grep -v 'Handgun' > addresses.txt
mkdir ./geocodes
printf 'Location|Latitude|Longitude\n' > ~/compciv/homework/dallas-ois/tables/geocodes.psv
cat addresses.txt | while read line; do
some_location=$(echo $line | sed s/' '/+/g)
curl "https://maps.googleapis.com/maps/api/geocode/json?address=$some_location+Dallas+TX" > ./geocodes/$some_location.json
Latitude=$(cat ./geocodes/$some_location.json | jq '.results[0] .geometry .location .lat')
Longitude=$(cat ./geocodes/$some_location.json | jq '.results[0] .geometry .location .lng')
printf '%s|%s|%s\n' "$line" "$Latitude" "$Longitude" >> ~/compciv/homework/dallas-ois/tables/geocodes.psv
sleep 3
done
