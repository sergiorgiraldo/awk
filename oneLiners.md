### Split up the lines of the file file.txt with ":" (colon) separated fields and print the second field ($2) of each line:

awk -F":" '{print $2}' file.txt

### Same as above but print only output if the second field ($2) exists and is not empty:

awk -F":" '{if ($2)print $2}' file.txt

### Print selected fields from each line separated by a dash:

awk -F: '{ print $1 "-" $4 "-" $6 }' file.txt

### Print the last field in each line:

awk -F: '{ print $NF }' file.txt

### Print every line and delete the second field:

awk '{ $2 = ""; print }'

### Print field number two ($2) only on lines matching "some regexp":

awk -F":" '/some regexp/{print $2}' file.txt

### Print field number two ($2) only on lines matching "some regexp" otherwise print field number three ($3):

awk -F":" '/some regexp/{print $2;next}{print $3}' file.txt

### Print the next two (i=2) lines after the line matching regexp:

awk '/regexp/{i=2;next;}{if(i){i–; print;}}' file.txt

### Print the line and the next two (i=2) lines after the line matching regexp:

awk '/regexp/{i=2+1;}{if(i){i–; print;}}' file.txt

### Print the lines from a file starting at the line matching "start" until the line matching "stop":

awk '/start/,/stop/' file.txt

### Count lines (wc -l):

awk 'END{print NR}'

### Search for matching lines (egrep regexp):

awk '/regexp/'

### Print non matching lines (egrep -v regexp):

awk '!/regexp/'

### Print matching lines and ignore case (egrep -i regexp):

awk 'BEGIN {IGNORECASE=1};/regexp/'

### Number lines (cat -n):

awk '{print FNR "\t" $0}'

### Remove duplicate consecutive lines (uniq):

awk 'a !~ $0{print}; {a=$0}'

### Print first 5 lines of file (head -5):

awk 'NR < 6'

### This prints all lines and adds a line number to non empty lines:

awk '/^..*$/{ print NR ":" $0 ;next}{print}' file.txt

### Substitute foo for bar on lines matching regexp

awk '/regexp/{gsub(/foo/, "bar")};{print}' file.txt

### Delete trailing white space (spaces, tabs)

awk '{sub(/[ \t]*$/, "");print}' file.txt

### Delete leading white space

awk '{sub(/^[ \t]+/, ""); print}' file.txt

### Add ++++ at lines matching regexp.

awk '/regexp/{sub(/^/, "++++"); print;next;}{print}' file.txt

### Color gcc warnings in red

gcc -Wall main.c |& awk '/: warning:/{print "\x1B[01;31m" $0 "\x1B[m";next;}{print}'

### Print only lines of less than 80 characters

awk 'length < 80' file.txt

### Print every line that is longer than 80 characters:

awk 'length($0) > 80' data

### Print the length of the longest input line:

awk '{ if (length($0) > max) max = length($0) }
END { print max }' data

### Print every line that has at least one field:

awk 'NF > 0' data

### Print seven random numbers from 0 to 100, inclusive:

awk 'BEGIN { for (i = 1; i <= 7; i++)
print int(101 * rand()) }'

### Print the total number of bytes used by files:

ls -l files | awk '{ x += $5 }
END { print "total bytes: " x }'

### Print the total number of kilobytes used by files:

ls -l files | awk '{ x += $5 }
END { print "total K-bytes:", x / 1024 }'

### Print a sorted list of the login names of all users:

awk -F: '{ print $1 }' /etc/passwd | sort

### Count the lines in a file:

awk 'END { print NR }' data

### Print the even-numbered lines in the data file:

awk 'NR % 2 == 0' data