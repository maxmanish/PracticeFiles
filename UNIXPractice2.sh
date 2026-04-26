# 20-Apr-26 [CUT, AWK, GREP, SED]
# CUT [Simple, fixed delimiter, direct column extraction]
# Write a cut command to display only the customer_id column from orders.csv
cut -d',' -f2 orders.csv #d-delimiter
awk -F',' '{print $2}' orders.csv #bonus solution. F-field separator

# Write a cut command to display only the 1st and 4th columns from orders.csv
cut -d',' -f1,4 orders.csv
awk -F',' '{print $1, $4}' orders.csv #bonus solution

# Write a cut command to display columns 2 to 4 from orders.csv
cut -d',' -f2-4 orders.csv
awk -F',' '{print $2, $3, $4}' orders.csv #bonus solution. AWK column ranges require a loop

# Write a cut command to display only the first 3 characters of the customer_id column from orders.csv
cut -d',' -f2 orders.csv | cut -c1-3 # c - character based cut (first 3 chars)
cut -d',' -fN file | cut -cX-Y #General syntax


# AWK [AWK programs are a sequence of pattern–action rules e.g. conditional logic, calculations]
# Write a UNIX command to display customer_id along with the count of records for each customer
awk -F',' '{print $2}' orders.csv | sort | uniq -c

# Write a UNIX command to display customer_id and count, for customers having more than 1 record
awk -F',' '{print $2}' orders.csv | sort | uniq -c | awk '$1 > 1'

# Display only the 2nd column (customer_id) from orders.csv
awk -F',' '{print $2}' orders.csv #since no pattern is given, it needs action command(print)

# You want to extract order_id and amount from orders.csv, and display them separated by a pipe (|)
awk -F',' '{print $1 | $4}' orders.csv

# Write an awk command to display only records with amount greater than 5000
awk -F',' '$4>5000' orders.csv #since pattern is given, printing full line ($0) is default behavior
awk -F',' '$4>5000 {print $0}' orders.csv # this is also correct

# You want to display customer_id and order_date only for records where payment_mode = CARD
awk -F',' '$6=="CARD" {print $2 "|" $5}' orders.csv

# Write an awk command to print only order_id and customer_id, separated by a comma
awk -F',' '{print $1 , $2}' orders.csv # F is field separator. Default output field separator (space) used when fields separated by comma
awk -F',' '{print $1 "," $2}' orders.csv # F is field separator. Enforced output field separator is comma

# Write an awk command to print the total number of records in orders.csv (awk only)
awk 'END {print NR}' orders.csv # NR - built-in AWK variable, holds the total number of lines read. END block run once at the end

# Write an awk command to print the total sum of the amount column
awk -F',' '{sum+=$4} END{print sum}' orders.csv
awk -F',' '{sum+=$4}; END{print sum}' orders.csv #both commands are correct

# Write a UNIX command to count the number of distinct customer IDs
awk -F',' '{print $2}' orders.csv | sort | uniq | wc -l #sorting needed first because uniq only works on adjacent lines
awk -F',' '{print $2}' | sort -u | wc -l #u-sort and keep only unique (in one command). count of unique values
awk -F',' '{print $2}' orders.csv | sort | uniq -d #display only duplicates in column #2

# Write an awk command to print each customer_id along with the count of orders for that customer
awk -F',' '{count[$2]++} END {for (c in count) print c, count[c]}' orders.csv


# GREP [Global Regular Expression Print]
# You received a data file orders.csv. During validation, you want to find all records related to customer CUST1005
grep CUST1005 orders.csv #displays rows containing CUST1005
cat orders.csv | grep CUST1005 #UUOC (Useless Use of cat)

# You want to count how many records in orders.csv contain the string NULL. Write command to print only the count of lines containing NULL
grep NULL orders.csv | wc -l
grep -c NULL orders.csv # c-count of matching lines

# You want to search for the word error in a log file etl.log, but the case may vary (ERROR, Error, error)
grep -i error etl.log #ignore case

# You want to find all records that DO NOT contain the string SUCCESS in etl.log
grep -v SUCCESS etl.log # v -> invert match

# Write a grep command to find all records that start with ORD in orders.csv
grep ^ORD orders.csv # ^ start of the line
awk -F',' '$1 ~ /^ORD/ {print $0}' orders.csv

# Write a grep command to display only the lines where FAILED appears as a complete word in orders.csv
grep -w FAILED orders.csv # w-match whole word (as a complete word)

# Display line numbers along with all lines that contain the word ERROR in etl.log
grep -n ERROR etl.log # n-print line numbers of matching lines

# Check whether orders.csv contains the word CANCELLED at all, but you do not want to print any file content
grep -q CANCELLED orders.csv #q-quite mode/checks existence of the word CANCELLED
echo $?

# Write a grep command to search for the word timeout in etl.log and display matching 2 lines of surrounding context
grep -i -C 2 timeout etl.log #i-ignore case. C-context matching. C 2 (number of lines) (UPPERCASE C)

# Write a grep command to display only the matched word FAILED (not the entire line), ignoring case
grep -i -w -o FAILED orders.csv #o-print only matching part


# SED - STREAM EDITOR
# Write a sed command to replace all commas with | and display the output
sed 's/,/|/g' orders.csv #sed processes text line by line. s-substitute, g-global

# Write a sed command to display only the first line of orders.csv
sed -n '1p' orders.csv # n-suppresses default output. Nothing is printed unless explicitly say p. If you use p in sed, you almost always need -n
sed '1q' orders.csv #quit after 1 line

# Write a sed command to display all lines except the first line from orders.csv
sed '1d' orders.csv #delete line 1, prints remaining lines by default (sed prints every line by default unless told otherwise or if default output is suppressed using n)
sed -n '2,$p' orders.csv #suppresses default output. print from line 2 to the end

# Write a sed command to display the file without empty lines
sed '/^$/d' orders.csv # ^$ → A line that has nothing in it (empty line. ^-line start. $-line end), deleted. Prints remaining lines by default

# Write a sed command to replace all customer IDs (CUST + digits e.g. CUST1005) with CUSTXXXX
sed 's/CUST[0-9]\+/CUSTXXXX/g' orders.csv # substitute: s/pattern/replacement/g

# Write a sed command to display only lines 5 through 10 from orders.csv
sed -n '5,10p' orders.csv #comma is a range separater

# Write a sed command to remove lines 3 to 6 and display the rest
sed '3,6d' orders.csv #n not required. prints remaining lines (non-deleted) by default

# Write a sed command to display only the first line and the last line of orders.csv
sed -n '1p;$p' orders.csv #Multiple sed commands are separated using semicolon

# Write a sed command to display all lines except the first and the last line of orders.csv
sed '1d;$d' orders.csv
sed -n '2,$p' orders.csv | sed '$d'

# write a sed command to Remove the header line (first line), replace all commas (,) with pipes (|) in the remaining data
sed '1d' orders.csv | sed 's/,/|/g'
sed '1d; s/,/|/g' orders.csv
