cd ~/compciv/homework/dallas-ois/tables
cat > dallas.html <<'EOF'
<html>
<body>
<h1>Dallas Police Department Data:  Officer Involved Shootings Since 2003</h1>
EOF

cat >> dallas.html <<'EOF'
<table border="1">
EOF
cat >> dallas.html <<'EOF'
<tr>
<th>Case Number</th>
<th>Date</th>
<th>Location</th>
<th>Suspect Status</th>
<th>Suspect Weapon</th>
<th>Suspect</th>
<th>Officers</th>
<th>Grand Jury</th>
<th>Latitude</th>
<th>Longitude</th>
<th>Narrative</th>
EOF

cat >> dallas.html <<'EOF'
</table>
</body>
</html>
EOF

