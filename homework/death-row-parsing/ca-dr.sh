pdftotext -layout data-hold/cadr.pdf data-hold/cadr.txt
cat data-hold/cadr.txt | grep -oE "Living         ..." | grep -oE "\b[A-Z]{3}" 
