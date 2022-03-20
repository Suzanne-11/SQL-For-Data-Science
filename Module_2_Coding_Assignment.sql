/*
Link to ER Diagram: https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
*/

/*
1.
Question 1
All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
*/
SELECT TrackID, Milliseconds
FROM Tracks
WHERE Milliseconds >= 5000000

/*
+---------+--------------+
| TrackId | Milliseconds |
+---------+--------------+
|    2820 |      5286953 |
|    3224 |      5088838 |
+---------+--------------+

How many tracks are returned?

Ans: 2

Q2. Run Query: Find all the invoices whose total is between $5 and $15 dollars.
*/

SELECT count(InvoiceId), Total
FROM Invoices
WHERE Total BETWEEN 5 AND 15

/*
+------------------+-------+
| count(InvoiceId) | Total |
+------------------+-------+
|              168 | 13.86 |
+------------------+-------+

While the query in this example is limited to 10 records, running the query correctly will indicate how many total 
records there are - enter that number below.

Ans: 168

Q3. Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
*/

SELECT CustomerId, FirstName, LastName, State, Company
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')

/*
+------------+-----------+----------+-------+-----------------------+
| CustomerId | FirstName | LastName | State | Company               |
+------------+-----------+----------+-------+-----------------------+
|         12 | Roberto   | Almeida  | RJ    | Riotur                |
|         13 | Fernanda  | Ramos    | DF    | None                  |
|         14 | Mark      | Philips  | AB    | Telus                 |
|         15 | Jennifer  | Peterson | BC    | Rogers Canada         |
|         16 | Frank     | Harris   | CA    | Google Inc.           |
|         17 | Jack      | Smith    | WA    | Microsoft Corporation |
|         18 | Michelle  | Brooks   | NY    | None                  |
|         19 | Tim       | Goyer    | CA    | Apple Inc.            |
|         20 | Dan       | Miller   | CA    | None                  |
+------------+-----------+----------+-------+-----------------------+

What company does Jack Smith work for?
Ans: Microsoft Corp

Q4. Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
*/

SELECT InvoiceId, Total, CustomerId, InvoiceDate
FROM Invoices
WHERE CustomerId IN (56,58) AND (Total BETWEEN 1 AND 5);

/*
+-----------+-------+------------+---------------------+
| InvoiceId | Total | CustomerId | InvoiceDate         |
+-----------+-------+------------+---------------------+
|       119 |  1.98 |         56 | 2010-06-12 00:00:00 |
|       142 |  3.96 |         56 | 2010-09-14 00:00:00 |
|       337 |  1.98 |         56 | 2013-01-28 00:00:00 |
|       120 |  1.98 |         58 | 2010-06-12 00:00:00 |
|       315 |  1.98 |         58 | 2012-10-27 00:00:00 |
|       338 |  3.96 |         58 | 2013-01-29 00:00:00 |
|       412 |  1.99 |         58 | 2013-12-22 00:00:00 |
+-----------+-------+------------+---------------------+

What was the invoice date for invoice ID 315?
Ans: 10-27-2012

Q5. Run Query: Find all the tracks whose name starts with 'All'.
*/

SELECT count(TrackId)
FROM Tracks
WHERE Name LIKE 'All%'

/*
+----------------+
| count(TrackId) |
+----------------+
|             15 |
+----------------+

While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.

Ans: 15

Q6. Run Query: Find all the customer emails that start with "J" and are from gmail.com.
*/

SELECT CustomerId, Email
FROM Customers
WHERE Email LIKE 'J%gmail.com'

/*

+------------+---------------------+
| CustomerId | Email               |
+------------+---------------------+
|         28 | jubarnett@gmail.com |
+------------+---------------------+

Enter the one email address returned (you will likely need to scroll to the right) below.

Ans: jubarnett@gmail.com


Q7. Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

*/
SELECT InvoiceId, BillingCity, Total
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC

/*
+-----------+-------------+-------+
| InvoiceId | BillingCity | Total |
+-----------+-------------+-------+
|       362 | Edmonton    | 13.86 |
|       351 | Edmonton    |  1.98 |
|       328 | Vancouver   |  0.99 |
|       319 | Brasília    |  8.91 |
|       276 | Vancouver   |  5.94 |
|       264 | Brasília    | 13.86 |
|       254 | Vancouver   |  3.96 |
|       253 | Brasília    |  1.98 |
|       231 | Vancouver   |  1.98 |
|       230 | Edmonton    |  0.99 |
+-----------+-------------+-------+
(Output limit exceeded, 10 of 21 total rows shown)

What is the total invoice amount of the first record returned? Enter the number below without a $ sign. Remember to sort in descending order to get the correct answer.

Ans: 13.86


Q8. Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
*/

SELECT CustomerId, COUNT(*) AS Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Orders DESC

/*
+------------+--------+
| CustomerId | Orders |
+------------+--------+
|          1 |      7 |
|          2 |      7 |
|          3 |      7 |
|          4 |      7 |
|          5 |      7 |
|          6 |      7 |
|          7 |      7 |
|          8 |      7 |
|          9 |      7 |
|         10 |      7 |
+------------+--------+
(Output limit exceeded, 10 of 59 total rows shown)

What is the number of items placed for the 8th person on this list? Enter that number below.

Ans: 7

Q9. Run Query: Find the albums with 12 or more tracks.
*/

SELECT TrackId, AlbumId
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(DISTINCT TrackId) >= 12;

/*
+---------+---------+
| TrackId | AlbumId |
+---------+---------+
|      37 |       5 |
|      50 |       6 |
|      62 |       7 |
|      76 |       8 |
|      98 |      10 |
|     110 |      11 |
|     122 |      12 |
|     143 |      14 |
|     182 |      18 |
|     222 |      21 |
+---------+---------+
(Output limit exceeded, 10 of 158 total rows shown)
While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.
Ans: 158
*/