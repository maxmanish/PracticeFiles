# 19-Apr-26 (Day #1 WC HEAD TAIL SORT)
# Write a UNIX command to display the total number of records (rows) present in orders.csv
wc -l orders.csv

# You want to quickly view the first 5 records of the file orders.csv to do a sanity check on data format and values
head -5 orders.csv

# Write a UNIX command to display the last 5 lines of orders.csv
tail -5 orders.csv

# More HEAD and TAIL commands
head -1 orders.csv #shows only the first row/header
head orders.csv #first 10 rows by default
head orders.csv | nl #nl-shows numbered line
tail -1 orders.csv #shows only the last row/header
tail -f etl.log #f-follow file live updates in realtime
head -20 orders.csv | tail -10 #print line 11 to 20


# SORT
# Write a UNIX command to display only duplicate rows from orders.csv
sort orders.csv | uniq -d

# Write a UNIX command to display only unique rows from orders.csv
sort orders.csv | uniq

# Some more SORT commands
sort -r orders.csv #r-sort reverse order
sort -u customers.txt #u-unique. sort and remove duplicates [same as sort customers.txt | uniq]
sort -n amounts.txt #n-numeric sort (use n for sorting numbers)
sort -k2 orders.csv #sort be specific column. k-sort by column#2
sort -t',' -k2 orders.csv #t-sort with custom delimeter (e.g. comma)

# Write a UNIX command to display all rows that contain the string CUST1005
grep CUST1005 orders.csv

# Write a UNIX command to display the content of orders.csv with commas replaced by |
cat orders.csv | tr ',' '|'
sed 's/,/|/g' orders.csv #sed is a Stream EDitor (SED). Processes text line by line. s-substitute

# Count the number of lines that contain NULL in orders.csv
grep -c NULL orders.csv
grep NULL orders.csv | wc -l
