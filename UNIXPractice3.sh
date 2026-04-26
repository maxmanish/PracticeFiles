# 21-Apr-26 [DIFF, CHMOD, PS, DF, DU, KILL, FIND, MV, RM, CP]
# Write a UNIX command to compare orders_day1.csv and orders_day2.csv and show the differences
diff orders_day1.csv orders_day2.csv

# More diff commands [diff is row-by-row/line-by-line comparison]
diff -i orders_day1.csv orders_day2.csv #i-ignore case
diff -y orders_day1.csv orders_day2.csv #y-side by side comparison
diff -u file1 file2 #u-unified format
sort file1.csv | diff - file2.csv #sort the file1 then compare with file2
sort file1.csv > a
sort file2.csv > b
diff -w -i a b #w-ignore whitespaces. i-ignore case

# CHMOD [Change Mode]
# Write a UNIX command to give/add execute permission to the owner of run_etl.sh
chmod u+x run_etl.sh #symbolic mode [who:u-user,g-group,o-owner,a-all][operation:+,-,=][permission:r,w,x]

# More chmod commands [octal and symbolic]
chmod 755 run_etl.sh #user-7(rwx);group-5(r-x);other-5(r-x) [octal mode]
chmod 600 secrets.conf #owner read/write, others no access
chmod o-w orders.csv #remove write permission from other
chmod g+r orders.csv #give read permission to group
chmod a+r data.csv #give read permission to all
chmod u=rwx,g=rx,o=r run_daily_job.sh #set ugo=754 permission using symbolic mode

# PS [Process Status]
# Write a UNIX command to display all running processes in full detail
ps -ef # ps-process status. e-shows all running processes. f-full format
UID     PID   PPID  C STIME TTY   TIME     CMD
etl     2345  1020  0 10:15 ?     00:02:30 ./run_etl.sh

# Find the process ID of an ETL script (e.g. load_orders.sh)
ps -ef | grep load_orders.sh
ps -ef | grep load_orders.sh | grep -v grep #remove the grep command itself from appearing in the output

# DF and DU [Disk freespace and Disk Usage]
# Write a UNIX command to display disk space usage/available on the filesystem in a human‑readable format
df -h #h-human‑readable format (filesystem level)

# More df commands
df -h /data #only show information for the filesystem where /data is located. h-human‑readable format
df -hT # T-filesystem type


# Write a UNIX command to display disk usage of directory/files in the current location in a human‑readable format
du -h #h-human‑readable format (folder/file usage level) (files/directories/sub-directories in current directory)
du -sh #h-human‑readable format. s-summary only (files/directories in current directory)
du -sh staging #disk usage of a single directory (relative path to current working directory)
du -sh * | sort -h #s-summary. h-sort directories by size

# KILL Command
# Write a UNIX command to terminate a running process with PID 4567 gracefully
kill 4567 #gracefully (Allows the process to: close files, release resources, Write logs)
kill -9 4567 #forcefully/immediate process termination

# Write a UNIX command to find the PID of load_orders.sh and gracefully stop the process
ps -ef | grep load_orders.sh
kill <PID>

# FIND Command
# Write a UNIX command to find all .log files in the current directory and its subdirectories
find . -name "*.log" # find-find files with name, recursively. dot-start searching from current directory

# More find commands
find . -iname "*.log" #ignores case in name
find . -type f -name "*.csv" #type f - files only
find . -type d -name "staging" #type f - directories only
find . -type f -size +1G #find files with size > 1GB
find . -type f -mtime -1 #find files modified within last 1 day

# Count how many .csv files exist
find . -type f -name "*.csv" | wc -l

# Find files with 777 permissions (files with security risk)
find . -type f -perm 777

# Write a UNIX command to move orders.csv into the archive directory
mv orders.csv archive/ #path is relative to current directory
mv orders.csv ./archive/ #path is relative (explicitely mentioned) to current directory
mv orders.csv .archive/ #path is relative to current directory, however, [.archive] is a hidden directory

# More use cases of mv [with options]
mv *.csv archive/ #Move all CSV files to archive location
mv run_20260419 archive/ #move a directory to archive location

# More use cases of mv for RENAMING files/folders [with options]
mv orders.csv orders_20260419.csv #renames the file
mv staging staging_validated #renames a directory
mv orders.csv archive/orders_$(date +%Y%m%d).csv #archive and renaming both together
mv -i new_orders.csv orders.csv # i-prompt to overwrite orders.csv? (y/n)
mv -n orders.csv archive/ #n-prevents overwriting, file is skipped if already exists

# Write a UNIX command to delete the file orders.tmp
rm orders.tmp #permanent delete, no recycle bin
rm -i orders.tmp #i-prompt/asks for confirmation before deletion

# More use cases of rm [with options]
rm -r temp_dir #r-removes directory and all it's contents recursively
rm -ri temp_dir #r-removes directory and all it's contents recursively. i-asks for confirmation for each file/subfolder
rm -rf temp_dir #r-removes recursively. f-force removal, no warnings
rm file1.csv file2.csv file3.csv #remove multiple files
rm *.tmp #removing files using wildcard
rm staging/*.tmp #removing files (with tmp extension) inside a folder using wildcard
rm dir/* #remove files inside a directory (keeps directory intact)
rm -rfi temp_dir #when both -i and -f are used, -i takes precedence over -f (will ask for confirmation)

# CP [COPY]
# Write a UNIX command to create a backup copy of orders.csv as orders_backup.csv
cp orders.csv orders_backup.csv #original file remains unchanged

# More use cases of cp [with options]
cp orders.csv backup/ #copy the file into a directory
cp -v orders.csv backup/ #gives a verbose
cp -n orders.csv orders_backup.csv #n-prevents overwriting, file is not copied if already exists
cp -i orders.csv orders_backup.csv #i-prompt to overwrite orders_backup.csv? (y/n)
cp -r staging staging_backup #copy folder/sub-folders recursively
cp -p orders.csv orders_backup.csv #preserves file permission
cp orders.csv customers.csv payments.csv backup/ #copy multiple files using one command
cp *.csv backup/ #copy all csv files to a destination folder
cp -n *.csv backup/ #n-prevents overwriting, file is not copied if already exists
cp orders.csv orders_$(date +%Y%m%d).csv #copy file AND rename at same time
cp -a . backup/ #copy hidden files at current location also to target location
cp -r data backup #r-copy folders to another folder recursively (with folders always use -r)
