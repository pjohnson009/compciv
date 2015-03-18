cd ./data-hold/Stanford-Report/2010-2012/finaldata
cat *.html | pup 'h3' | grep -v '<' | grep -oE '[[:alpha:]]{4,}' > ~/compciv/homework/final-project/data-hold/Stanford-Report/words.txt

cd ..
cd ..
cd ./2013-2015/finaldata
cat *.html | sed -r 's/(")/\n\1/g' | grep 'div' | grep -v '^"[[:alpha:]]' | sed "s/\bclass\b//g" | grep -oE '[[:alpha:]]{4,}' >> ~/compciv/homework/final-project/data-hold/Stanford-Report/words.txt

cd ..
cd ..
if [[ $1 == '4' ]]; then
cat words.txt | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 -ge 5 ]] && [[ $1 -le 9 ]]; then
cat words.txt | grep -oE "[[:alpha:]]{$1,}" | sort | uniq -c | sort -rn | head -n 25
else
echo 'Please enter a number between 4-9'
fi
