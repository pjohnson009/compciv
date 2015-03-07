cd ./data-hold/Stanford-Daily
if [[ $1 == '4' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{4,}' | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 == '5' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 == '6' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{6,}' | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 == '7' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{7,}' | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 == '8' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{8,}' | sort | uniq -c | sort -rn | head -n 25
elif [[ $1 == '9' ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' |sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE '[[:alpha:]]{9,}' | sort | uniq -c | sort -rn | head -n 25
else
echo 'Please enter a number between 4-9'
fi
