datafile='data-hold/namesample.txt'
name=Jessie
name_matches=$(cat $datafile | grep "$name,")
m_count=0
f_count=0
for row in $name_matches, do
babies=$(echo $row | cut -d ',' -f '3')
if [[ $row =~ ',M,' ]]
then
m_count=$((m_count + babies))
else
f_count=$((f_count + babies))
fi
done

total_babies=$((m_count + f_count))
pct_female=$((100 * f_count / total_babies))
if [[ $pct_female -ge 50 ]]; then
g_and_pct="F,$pct_female"
else
echo 'You should do something here when boys make up the majority"
fi
echo "$name,$g_and_pct,$total_babies"
