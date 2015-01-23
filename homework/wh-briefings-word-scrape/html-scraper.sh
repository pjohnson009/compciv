cat data-hold/* | pup 'div#content text{}' | grep -Eow '\w{7}+' | sort | uniq -c | sort -rn | head -n 10
