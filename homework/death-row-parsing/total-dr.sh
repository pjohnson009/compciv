bash tx-dr.sh | sed 's/White/TX,White/' | sed 's/Black/TX,Black/' | sed 's/Hispanic/TX,Hispanic/' | sed 's/Other/TX,Other/' | sed 's/Native    American/TX,Native American/'
bash fl-dr.sh | sed 's/M//' | sed 's/F//' | sed 's/W/FL,White/' | sed 's/H/FL,Hispanic/' | sed 's/O/FL,Other/' | sed 's/B/FL,Black/'
bash ca-dr.sh | sed 's/WHI/CA,White/' | sed 's/BLA/CA,Black/' | sed 's/HIS/CA,Hispanic/' | sed 's/OTH/CA,Other/'
