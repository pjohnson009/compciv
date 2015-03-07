cd ./data-hold/Stanford-Report/2010-2012/finaldata
cat *.html | pup 'h3' | grep -v '<' | grep -oE '[[:alpha:]]{4,}' > ~/compciv/homework/final-project/data-hold/Stanford-Report/words.txt

cd ..
cd ..
cd ./2013-2015/finaldata
cat *.html | sed -r 's/(")/\n\1/g' | grep 'div' | grep -v '^"[[:alpha:]]' | sed "s/\bclass\b//g" | grep -oE '[[:alpha:]]{4,}' >> ~/compciv/homework/fina$

cd ..
cd ..

report=$(cat words.txt | grep -i $1 | wc -l)
echo Stanford Report headlines since 2011 have used this word: $report times.

cd ..
cd ./Stanford-Daily

daily=$(csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -i $1 | wc -l)
echo Stanford Daily headlines since 2011 have used this word: $daily times.
