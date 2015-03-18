cd ./data-hold/Stanford-Daily
if [[ $1 -ge 4 ]] && [[ $1 -le 9 ]]; then
csvfix order -fn Text tweets.csv | tr '[:upper:]' '[:lower:]' | sed -E 's/@[[:alnum:]]+//g' | sed -E 's/#[[:alnum:]]+//g' | sed -E 's/http[^ ]+//g' | grep -oE "[[:alpha:]]{$1,}" | sort | uniq -c | sort -rn | head -n 25
else
echo 'Please enter a number between 4-9'
fi
