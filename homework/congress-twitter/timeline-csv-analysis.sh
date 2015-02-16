username=$1
mkdir -p ./data-hold
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"
t timeline -n 3200 --csv $username > data-hold/$username-timeline.csv
count=$(csvfix order -f 1 data-hold/$username-timeline.csv | wc -l)
lastdate=$(csvfix order -fn 'Posted at' data-hold/$username-timeline.csv | tail -n 1)
echo "Analyzing $count tweets by $1 since $lastdate"
echo "Top 10 hashtags by $1"
cat data-hold/$username-timeline.csv | grep -oiE '#[^ ]*' | tr -d '"' | sort | uniq -c | sort -rn | head -n 10
echo "Top 10 retweeted users by $1"
csvfix order -fn 'Text' data-hold/$username-timeline.csv | grep -oE 'RT @[^ ]*' | grep -oE '@[^ ]*' | tr -d ':' | sort | uniq -c | sort -rn | head -n 10
echo "Top 10 mentioned users (not including retweets) by $1"
csvfix order -fn 'Text' data-hold/$username-timeline.csv | grep -oE '@[^ ]*' | grep -v 'RT @[^ ]*' | grep -v "@$username" | tr -d ':' | tr -d '"' | tr -d '!' | sort | uniq -c | sort -rn | head -n 10
echo "Top tweeted 10 words with 5+ letters by $1"
csvfix order -fn 'Text' data-hold/$username-timeline.csv | sed s/RT// | tr -d '"' | tr -d '.' | tr -d ':' | grep -oE '[[:alpha:]]{5,}' | sort | uniq -c | sort -rn | head -n 10
