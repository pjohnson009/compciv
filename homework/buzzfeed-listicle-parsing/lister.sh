for x in $(seq 1 12); do
cd ~/compciv/homework/buzzfeed-listicle-parsing/data-hold/buzzfeed-archive-2014/$x
cat *.html
done | pup 'a attr{href}' | grep '[[:digit:]]-[[:alpha:]]' | sed -E s/....$// | grep -oE '[[:digit:]]{1,2}-[[:alpha:]]' | sed -E s/..$// | sort | uniq -c | sort -rn | grep -v '0[[:digit:]]' | grep -oE '[[:digit:]]+ [[:digit:]]+' | sed -E s/[[:space:]]/,/ | sed -E s/[[:space:]]/,/ | awk 'BEGIN{FS=",[ ]*"; OFS=","}
{
for (i=NF; i>0; i--) {
printf "%s",$i;
if (i>1) {
printf "%s", OFS;
}
}
printf "\n"
}'
