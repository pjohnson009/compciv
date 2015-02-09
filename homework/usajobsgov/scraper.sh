cd ~/compciv/homework/usajobsgov/data-hold
date=$(date +%Y-%m-%d_%H00)
mkdir ~/compciv/homework/usajobsgov/data-hold/scrapes/$date
cat OccupationalSeries.xml | hxselect JobFamily | grep -oE "[[:digit:]][[:digit:]][[:digit:]][[:digit:]]" | uniq |
while read line; do
curl -o ~/compciv/homework/usajobsgov/data-hold/scrapes/$date/$line-1.json https://data.usajobs.gov/api/jobs?Series=$line&Page=1
Page_Number=$(cat ./scrapes/$date/$line-1.json | jq -r .Pages)
for x in $(seq 1 $Page_Number);
do curl -o ./scrapes/$date/$line-$x.json https://data.usajobs.gov/api/jobs?Series=$line&Page=$x
done
done
