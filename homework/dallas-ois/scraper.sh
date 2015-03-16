mkdir tables
cd ./data-hold
curl www.dallaspolice.net/ois/ois.html -o 20132014.html
for x in $(seq 2003 2012); do
curl www.dallaspolice.net/ois/ois_$x.html -o $x.html
done

cat *.html | pup 'a attr{href}' | grep '.pdf' | sed 's/^/www.dallaspolice.net/' |
while read line; do
cd ./pdfs
curl $line -O
cd ..
done
