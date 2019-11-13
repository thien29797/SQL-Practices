#!/usr/bin/bash
# Generate data into mysql

# Assign user and password
username="${1}"
password="${2}"
database="${3}"
 
# List the parameter values passed.
echo "Username:  " ${username}
echo "Password:  " ${password}
echo "Database:  " ${database}
echo ""

# Connect and pipe the query result minus errors and warnings to the while loop.
mysql -u${username} -p${password} -D${database} <<<'show tables' 2>/dev/null |

# Read through the piped result until it's empty but format the title.
while IFS='\n' read list; do
  if [[ ${list} = "Tables_in_scoremanagement" ]]; then
    echo $list
    echo "----------------------------------------"
  else
    echo $list
  fi
done
echo ""

# Insert Test Result: 200 rows
echo "Start Insert test_result Table"
#for i in {1..200};
#do
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (10, "2019-10-31", "STU-11111");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (9, "2019-10-31", "STU-11112");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (8, "2019-10-31", "STU-11110");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (5, "2019-10-31", "STU-11114");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (1, "2019-10-31", "STU-11113");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (4, "2019-10-31", "STU-11112");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (3, "2019-10-31", "STU-11111");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (2, "2019-10-31", "STU-11115");' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (10, "2019-10-31", "STU-11110");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (9, "2019-10-31", "STU-11119");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (8, "2019-10-31", "STU-11118");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (6, "2019-10-31", "STU-11116");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (7, "2019-10-31", "STU-11117");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (10, "2019-10-31", "STU-11116");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (4, "2019-10-31", "STU-11115");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (9, "2019-10-31", "STU-11114");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (8, "2019-10-31", "STU-11113");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_result (score, submit_date, student_code) VALUES (7, "2019-10-31", "STU-11112");' 2>/dev/null
#done 
echo "End Insert"

# Insert Test Subject: 20 rows (4 subjects for each category)
echo "Start Insert test_subject Table"
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Java", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("C#", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("C/C++", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Python", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Machine Learning", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Deep Learning", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Nature Language Generation", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Robotic Process Automation", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Android", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Swift", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Objective-C", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Window Phone", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("PHP", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("ReactJS", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Angular", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("NodeJS", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("English", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Germany", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Japanese", FLOOR(RAND()*(200)+1));' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO test_subject (test_name, test_result_code) VALUES ("Chinese", FLOOR(RAND()*(200)+1));' 2>/dev/null 
echo "End Insert"

# Insert Subject Category: 5 rows
echo "Start Insert subject_category Table"
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO subject_category (category_name, test_subject_code) VALUES ("Base Programming", 55);' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO subject_category (category_name, test_subject_code) VALUES ("Web Programming", 64);' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO subject_category (category_name, test_subject_code) VALUES ("AI", 73);' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO subject_category (category_name, test_subject_code) VALUES ("Mobile Programming", 77);' 2>/dev/null
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO subject_category (category_name, test_subject_code) VALUES ("Language", 77);' 2>/dev/null
echo "End Insert"

# Insert Student: 50 rows
echo "Start Insert student_information Table"
#for i in {1..50};
#do
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, mail, first_name, last_name) VALUES ("STU-11111", "thiendang0@gmail.com", "Dang", "Thien");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11112", "thiendang1@gmail.com", "Dang", "Huy");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11113", "thiendang2@gmail.com", "Dang", "Hoang");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11114", "thiendang3@gmail.com", "Dang", "Duc");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11115", "thiendang4@gmail.com", "Dang", "Long");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11116", "thiendang5@gmail.com", "Dang", "An");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11117", "thiendang6@gmail.com", "Dang", "Duong");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11118", "thiendang7@gmail.com", "Dang", "Giang");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11119", "thiendang8@gmail.com", "Dang", "Ngoc");' 2>/dev/null
mysql -u${username} -p${password} -D${database} <<<'INSERT INTO student_information (student_code, email, first_name, last_name) VALUES ("STU-11110", "thiendang9@gmail.com", "Dang", "Nhu");' 2>/dev/null
#done 
echo "End Insert"

# Insert testsubject_duration Table
echo "Start Insert testsubject_duration"
for i in {1..20};
do
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO testsubject_duration (test_subject_code, duration_id) VALUES (FLOOR(RAND()*(20)+1), FLOOR(RAND()*(3)+1));' 2>/dev/null
done  
echo "End Insert"

# Insert testsubject_type Table
echo "Start Insert testsubject_type"
for i in {1..20};
do
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO testsubject_type (test_subject_code, type_id) VALUES (FLOOR(RAND()*(20)+1), FLOOR(RAND()*(2)+1));' 2>/dev/null
done 
echo "End Insert"

# Insert testsubject_result Table
echo "Start Insert testresult_result"
 for i in {1..15};
do
 mysql -u${username} -p${password} -D${database} <<<'INSERT INTO testresult_result (test_result_code, result_id) VALUES (FLOOR(RAND()*(18)+1), FLOOR(RAND()*(2)+1));' 2>/dev/null
done
echo "End Insert"

