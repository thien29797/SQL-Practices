#!/usr/bin/bash
 
# SQL Query

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

# 3.1 Display student list and sort by first name.
echo "3.1 Display student list and sort by first name."
mysql -u${username} -p${password} -D${database} <<<'SELECT * FROM student_information ORDER BY first_name DESC;' 2>/dev/null

# 3.2 Display student list who already submitted the 15_minutes test
echo "3.2 Display student list who already submitted the 15_minutes test"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, si.first_name, si.last_name FROM student_information si 
									INNER JOIN test_subject ts ON si.test_result_code = ts.test_result_code
									INNER JOIN testsubject_duration tsd ON ts.test_subject_code = tsd.test_subject_code
									INNER JOIN duration_data d ON tsd.duration_id = d.duration_id 
									AND d.duration_name = "FIFTEEN_MINUTES";' 2>/dev/null

# 3.3 Display student list who didn't submit the 60_minutes test
echo "3.3 Display student list who didn't submit the 60_minutes test"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, si.first_name, si.last_name FROM student_information si 
									INNER JOIN test_subject ts ON si.test_result_code = ts.test_result_code
									INNER JOIN testsubject_duration tsd ON ts.test_subject_code = tsd.test_subject_code
									INNER JOIN duration_data d ON tsd.duration_id = d.duration_id 
									AND d.duration_name != "SIXTY_MINUTES";' 2>/dev/null

# 3.4 Display top ten students who has highest score in 60_minutes
echo "3.4 Display top ten students who has highest score in 60_minutes"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, si.first_name, si.last_name, tr.score FROM test_result tr
				INNER JOIN student_information si ON si.test_result_code = tr.test_result_code
			WHERE si.test_result_code IN (SELECT tr.test_result_code FROM test_subject ts
						INNER JOIN test_result tr ON tr.test_result_code = ts.test_result_code
					WHERE ts.test_subject_code IN (SELECT tsd.test_subject_code FROM testsubject_duration tsd 
												INNER JOIN duration_data d ON d.duration_id = tsd.duration_id 
											WHERE d.duration_name = "SIXTY_MINUTES"))
			ORDER BY tr.score DESC LIMIT 10' 2>/dev/null

# 3.5 Display top ten students who has highest score in specific category (user will input category code for filter)
echo "3.5 Display top ten students who has highest score in specific category (user will input category code for filter)"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, si.first_name, si.last_name, si.email, tr.test_result_code FROM student_information si
			INNER JOIN test_result tr ON tr.test_result_code = si.test_result_code
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN subject_category sc ON sc.test_subject_code = ts.test_subject_code
		WHERE sc.category_code = 1
		ORDER BY tr.score DESC LIMIT 10' 2>/dev/null

# 3.6 Display top ten students who has lowest score in specific category (user will input category code for filter)
echo "3.6 Display top ten students who has lowest score in specific category (user will input category code for filter)"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, si.first_name, si.last_name, si.email, tr.test_result_code FROM student_information si
			INNER JOIN test_result tr ON tr.test_result_code = si.test_result_code
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN subject_category sc ON sc.test_subject_code = ts.test_subject_code
		WHERE sc.category_code = 1
		ORDER BY tr.score ASC LIMIT 10' 2>/dev/null

# 3.7 Count how many test submit do we have for ONLINE_TEST & OFFLINE_TEST
echo "3.7 Count how many test submit do we have for ONLINE_TEST & OFFLINE_TEST"
mysql -u${username} -p${password} -D${database} <<<'SELECT td.type_name, COUNT(ts.test_subject_code)test_submit_amount FROM testsubject_type tst 
													INNER JOIN test_subject ts ON ts.test_subject_code = tst.test_subject_code
													INNER JOIN type_data td ON td.type_id = tst.type_id
												WHERE ts.test_subject_code = tst.test_subject_code
												GROUP BY td.type_name' 2>/dev/null

# 3.8 Calculate average score for a specific student on all subject categories
echo "3.8 Calculate average score for a specific student on all subject categories"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, CONCAT(si.first_name," ", si.last_name)StudentName, AVG(tr.score) AverageScore FROM test_result tr 
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN student_information si ON si.test_result_code = tr.test_result_code
		WHERE si.student_code = "STU-123456" AND si.test_result_code IN	(SELECT tr.test_result_code FROM test_subject ts
														INNER JOIN test_result tr ON	tr.test_result_code = ts.test_result_code
														INNER JOIN subject_category sc ON sc.test_subject_code = ts.test_subject_code
													WHERE ts.test_subject_code = sc.test_subject_code)
		GROUP BY ts.test_name' 2>/dev/null

# 3.9 Calculate average score for a specific student on every subject category
echo "3.9 Calculate average score for a specific student on every subject category"
mysql -u${username} -p${password} -D${database} <<<'SELECT si.student_code, CONCAT(si.first_name," ", si.last_name)StudentName, sc.category_name, AVG(tr.score) AverageScore FROM test_result tr 
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN subject_category sc ON  sc.test_subject_code = ts.test_subject_code
			INNER JOIN student_information si ON si.test_result_code = tr.test_result_code
		WHERE si.student_code = "STU-123456" AND ts.test_subject_code = sc.test_subject_code
		GROUP BY ts.test_name, sc.category_name' 2>/dev/null

# 3.10 Display top five students who has highest score on every subject category
echo "3.10 Display top five students who has highest score on every subject category"
mysql -u${username} -p${password} -D${database} <<<'SELECT sc.category_name, CONCAT(si.first_name, " ", si.last_name)StudentName FROM test_result tr 
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN subject_category sc ON  sc.test_subject_code = ts.test_subject_code
			INNER JOIN student_information si ON si.test_result_code = tr.test_result_code
		WHERE ts.test_subject_code = sc.test_subject_code AND ts.test_result_code = tr.test_result_code 
								AND si.test_result_code = tr.test_result_code 
		ORDER BY tr.score DESC LIMIT 5' 2>/dev/null

# 3.11 Classify student based on average score of all subject categories: EXCELLENT (9, 10), GOOD (7,8), AVERAGE (5,6), WEAK (<5)
echo "3.11 Classify student based on average score of all subject categories: EXCELLENT (9, 10), GOOD (7,8), AVERAGE (5,6), WEAK (<5)"
mysql -u${username} -p${password} -D${database} <<<'SELECT CONCAT(si.first_name," ", si.last_name)StudentName, AVG(tr.score)AS AverageScore,
	(CASE AVG(tr.score)
		WHEN AVG(tr.score) > 9 AND AVG(tr.score) < 10 THEN "EXCELLENT"
		WHEN AVG(tr.score) > 7 AND AVG(tr.score) < 8 THEN "GOOD"
		WHEN AVG(tr.score) > 5 AND AVG(tr.score) < 6 THEN "AVERAGE"
		WHEN AVG(tr.score) < 5 THEN "WEAK"
	END) 
	AS Rank
FROM test_result tr 
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN student_information si ON si.student_code = tr.student_code
WHERE si.student_code = tr.student_code AND tr.test_result_code IN	(SELECT tr.test_result_code FROM test_subject ts
														INNER JOIN test_result tr ON	tr.test_result_code = ts.test_result_code
														INNER JOIN subject_category sc ON sc.test_subject_code = ts.test_subject_code
													WHERE ts.test_subject_code = sc.test_subject_code)
GROUP BY si.student_code, tr.test_result_code;' 2>/dev/null

# 3.12 Count how many student on each classification.
echo "3.12 Count how many student on each classification."
mysql -u${username} -p${password} -D${database} <<<'SELECT sc.category_name, (si.student_code)StudentAmount  
FROM test_result tr 
			INNER JOIN test_subject ts ON ts.test_result_code = tr.test_result_code
			INNER JOIN subject_category sc ON  sc.test_subject_code = ts.test_subject_code
			INNER JOIN student_information si ON si.student_code = tr.student_code
WHERE ts.test_subject_code = sc.test_subject_code 
		AND ts.test_result_code = tr.test_result_code 
		AND si.student_code = tr.student_code 
UNION 
SELECT sc.category_code, sc.category_name
FROM subject_category sc
		INNER JOIN test_subject ts ON ts.test_subject_code = sc.test_subject_code
		INNER JOIN test_result tr ON tr.test_result_code = ts.test_result_code
		INNER JOIN student_information si ON si.student_code = tr.student_code
WHERE ts.test_subject_code = sc.test_subject_code 
		AND ts.test_result_code = tr.test_result_code 
		AND si.student_code = tr.student_code
ORDER BY 2;' 2>/dev/null


