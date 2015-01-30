cat data-hold/fldr.html | pup 'td:nth-of-type(3) text{}' | grep -oE "[A-Z]{2}"
cat data-hold/fldead.html | pup 'td:nth-of-type(3) text{}' | grep -oE "[A-Z]{2}"
cat data-hold/fldead2.html | pup 'td:nth-of-type(3) text{}' | grep -oE "[A-Z]{2}"
