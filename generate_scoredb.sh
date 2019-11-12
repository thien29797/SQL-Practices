#!/usr/bin/bash
 
# Assign user and password
username="${1}"
password="${2}"
database="${3}"
directory="${4}"
 
# List the parameter values passed.
echo "Username:  " ${username}
echo "Password:  " ${password}
echo "Database:  " ${database}
echo "Directory: " ${directory}
echo ""
 
# Define an array.
declare -a cmd
 
# Assign elements to an array.
cmd[0]="duration_data.sql"
cmd[1]="type_data.sql"
cmd[2]="result_data.sql"
cmd[3]="test_result.sql"
cmd[4]="test_subject.sql"
cmd[5]="subject_category.sql"
cmd[6]="student_information.sql"
cmd[7]="testresult_result.sql"
cmd[8]="testsubject_type.sql"
cmd[9]="testsubject_duration.sql"
 
# Call the array elements.
for i in ${cmd[*]}; do
  mysql -s -u${username} -p${password} -D${database} < ${directory}/${i} > /dev/null 2>/dev/null
done
 
# Connect and pipe the query result minus errors and warnings to the while loop.
mysql -u${username} -p${password} -D${database} <<<'show tables' 2>/dev/null |
 
# Read through the piped result until it's empty but format the title.
while IFS='\n' read list; do
  if [[ ${list} = "Tables_in_sampledb" ]]; then
    echo $list
    echo "----------------------------------------"
  else
    echo $list
  fi
done
echo ""
