/*
1.
Question 1
For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a
single table titled: salary_range_by_job_classification. This table contains the
following columns:

SetID

Job_Code 

Eff_Date 

Sal_End_Date 

Salary_setID 

Sal_Plan 

Grade 

Step 

Biweekly_High_Rate 

Biweekly_Low_Rate 

Union_Code 

Extended_Step 

Pay_Type

Please refer to this information to write queries to answer the questions. Are you ready to get started?

Yes, I am ready to begin.

2.
Question 2
Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query. */

SELECT 
DISTINCT Extended_step
FROM salary_range_by_job_classification

/*

+---------------+
| Extended_Step |
+---------------+
| 0             |
| 11            |
| 6             |
| 2             |
+---------------+

Which of the following values is not a distinct value?

Ans: 5

3.
Question 3
Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.

*/

SELECT min(Biweekly_high_Rate)
From salary_range_by_job_classification
WHERE Biweekly_High_Rate <> '$0.00'

/*

+-------------------------+
| min(Biweekly_high_Rate) |
+-------------------------+
| $100.00                 |
+-------------------------+

Ans: $100

4.
Question 4
What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
*/

SELECT 
Max(Biweekly_high_Rate) 
FROM salary_range_by_job_classification

/*

+-------------------------+
| Max(Biweekly_high_Rate) |
+-------------------------+
| $9726.38                |
+-------------------------+

Ans: $9726.38 

5.
Question 5
What is the pay type for all the job codes that start with '03'? The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.
*/

SELECT job_code, pay_type
FROM salary_range_by_job_classification
WHERE job_code like '03%'

/*

+----------+----------+
| Job_Code | Pay_Type |
+----------+----------+
| 0380     | B        |
| 0381     | B        |
| 0382     | B        |
| 0390     | B        |
| 0395     | B        |
| 0380     | B        |
| 0381     | B        |
| 0382     | B        |
+----------+----------+

Ans: B

6.
Question 6
Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query. 

*/
SELECT grade, eff_date, sal_end_date
FROM salary_range_by_job_classification
WHERE grade = 'Q90H0'

/*

+-------+------------------------+------------------------+
| Grade | Eff_Date               | Sal_End_Date           |
+-------+------------------------+------------------------+
| Q90H0 | 12/26/2009 12:00:00 AM | 06/30/2010 12:00:00 AM |
+-------+------------------------+------------------------+
What is the Salary End Date (sal_end_date) for grade Q90H0? (Enter date format as follows: mm/dd/yyyy)

Ans: 06/30/2010

7.
Question 7
Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query.
*/

SELECT Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC

/*

+-------------------+
| Biweekly_Low_Rate |
+-------------------+
| $0.00             |
| $0.00             |
| $0.00             |
| $0.00             |
| $100.00           |
| $100.00           |
| $10059.00         |
| $10376.00         |
| $1052.00          |
| $10630.00         |
| $10843.00         |
| $1088.00          |
| $1112.00          |
| $11255.00         |
| $11405.00         |
| $1162.00          |
| $12120.77         |
| $1280.00          |
| $1284.00          |
| $1298.00          |
| $1299.00          |
| $1381.00          |
| $1384.00          |
| $1405.00          |
| $1464.00          |
+-------------------+
(Output limit exceeded, 25 of 1356 total rows shown)

Are these values properly sorted? 
Ans: No

8.
Question 8
Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? Hint: there are 6 lines to run this query.

*/

SELECT step, Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code BETWEEN 0100 AND 0400

/*

+------+----------+
| Step | Job_Code |
+------+----------+
| 1    | 1002     |
| 1    | 1003     |
| 1    | 1004     |
| 1    | 1005     |
| 1    | 1011     |
| 1    | 1012     |
| 1    | 1013     |
| 1    | 1014     |
| 1    | 1021     |
| 1    | 1022     |
| 1    | 1023     |
| 1    | 1024     |
| 1    | 1031     |
| 1    | 1032     |
| 1    | 1033     |
| 1    | 1041     |
| 1    | 1042     |
| 1    | 1043     |
| 1    | 1044     |
| 1    | 1051     |
| 1    | 1052     |
| 1    | 1053     |
| 1    | 1054     |
| 1    | 1061     |
| 1    | 1062     |
+------+----------+
(Output limit exceeded, 25 of 570 total rows shown)

Ans: 1

9.
Question 9
Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the
Biweekly Low Rate for job Code 0170?
*/

SELECT (Biweekly_high_Rate - Biweekly_Low_Rate) AS diff_in_rates, Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code = '0170'

/*

+---------------+----------+
| diff_in_rates | Job_Code |
+---------------+----------+
|             0 | 0170     |
+---------------+----------+
Ans: 0

10.
Question 10

Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 

*/

SELECT Extended_Step, Pay_Type
FROM salary_range_by_job_classification
WHERE Pay_Type IN ('M','H','D')

/*

+---------------+----------+
| Extended_Step | Pay_Type |
+---------------+----------+
| 0             | D        |
| 0             | D        |
| 0             | D        |
| 0             | M        |
| 0             | D        |
| 0             | D        |
| 0             | M        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
| 0             | H        |
+---------------+----------+

Ans: 0

11.
Question 11
Write and run a query, with no starter code or hints to answer this question: What is the step for
Union Code 990 and a Set ID of SFMTA or COMMN? 

*/

SELECT step, Union_Code, SetID
FROM salary_range_by_job_classification
WHERE Union_Code = '990' AND (SetID = 'SFMTA' OR SetID='COMMN')

/*

+------+------------+-------+
| Step | Union_Code | SetID |
+------+------------+-------+
| 1    | 990        | COMMN |
+------+------------+-------+
Ans: 1

*/