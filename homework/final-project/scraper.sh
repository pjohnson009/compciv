mkdir data-hold
mkdir data-hold/Stanford-Report
mkdir data-hold/Stanford-Report/2010-2012
mkdir data-hold/Stanford-Report/2010-2012/finaldata
mkdir data-hold/Stanford-Report/2013-2015
mkdir data-hold/Stanford-Report/2013-2015/finaldata
mkdir data-hold/Stanford-Daily
cd ./data-hold/Stanford-Report
for x in $(seq 2010 2015); do
curl -o $x.html http://news.stanford.edu/sr/$x/
done

for y in $(seq 2013 2015); do
cat $y.html | pup 'a attr{href}' | grep -v '?' | grep -v 'sr' | tr -d '/' | while read line; do
curl -o ./2013-2015/$y-$line.html http://news.stanford.edu/sr/$y/$line/
done
done

for a in $(seq 2010 2012); do
cat $a.html | pup 'a attr{href}' | grep -v '?' | grep -v 'sr' | tr  -d '/' | while read line; do
curl -o ./2010-2012/$a-$line.html http://news.stanford.edu/sr/$a/$line/
done
done

cd ./2010-2012
k=231
for c in $(seq 2010 2011); do
cat *.html | pup 'a attr{href}' | grep $c | grep '.html' | while read line; do
curl "$line" -o ~/compciv/homework/final-project/data-hold/Stanford-Report/2010-2012/finaldata/$c-$k.html
k=$((k - 1))
done
k=231
done

k=232
cat *.html | pup 'a attr{href}' | grep '2012' | grep '.html' | while read line; do
curl "$line" -o ~/compciv/homework/final-project/data-hold/Stanford-Report/2010-2012/finaldata/2012-$k.html
k=$((k - 1))
done

cd ..
cd ./2013-2015
h=27
cat *.html | pup 'script attr{src}' | while read line; do
curl "$line" -o ~/compciv/homework/final-project/data-hold/Stanford-Report/2013-2015/finaldata/$h.html
h=$((h - 1))
done

t timeline @Stanford_Daily --csv -n 3200 > ~/compciv/homework/final-project/data-hold/Stanford-Daily/tweets.csv
