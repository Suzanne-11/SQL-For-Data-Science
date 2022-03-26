---Practice Quiz - Writing Queries---

/*
All of the questions in this quiz pull from the open source Chinook Database. Please refer to the ER Diagram below and familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.
*/

/*

Q1. How many albums does the artist Led Zeppelin have? 

*/

SELECT COUNT(DISTINCT(albums.AlbumId)), artists.Name
FROM artists INNER JOIN albums 
ON artists. ArtistId = albums.ArtistId
WHERE Name = 'Led Zeppelin'

/*

+---------------------------------+--------------+
| count(distinct(albums.AlbumId)) | Name         |
+---------------------------------+--------------+
|                              14 | Led Zeppelin |
+---------------------------------+--------------+

Ans: 14

*/


/*
Q2. Create a list of album titles and the unit prices for the artist "Audioslave".
*/

SELECT t.UnitPrice, a.Title, ar.Name
FROM tracks t INNER JOIN albums a ON t.AlbumId = a.AlbumId
INNER JOIN artists ar ON ar.ArtistId = a.ArtistId
WHERE ar.Name = 'Audioslave'

/*

+-----------+--------------+------------+
| UnitPrice | Title        | Name       |
+-----------+--------------+------------+
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Audioslave   | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
|      0.99 | Out Of Exile | Audioslave |
+-----------+--------------+------------+
(Output limit exceeded, 25 of 40 total rows shown)

How many records are returned?

Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.

Ans: 40

*/

/*
Q3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  
*/

SELECT DISTINCT(i.InvoiceId), c.FirstName, c.LastName
FROM invoices i INNER JOIN customers c 
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL

/*

+-----------+-----------+----------+
| InvoiceId | FirstName | LastName |
+-----------+-----------+----------+
+-----------+-----------+----------+
(Zero rows)

Ans: No

*/

/*
Q4. Find the total price for each album.
*/

SELECT sum(t.UnitPrice), a.AlbumId
FROM tracks t INNER JOIN albums a ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId

/*

+------------------+---------+
| sum(t.UnitPrice) | AlbumId |
+------------------+---------+
|              9.9 |       1 |
|             0.99 |       2 |
|             2.97 |       3 |
|             7.92 |       4 |
|            14.85 |       5 |
|            12.87 |       6 |
|            11.88 |       7 |
|            13.86 |       8 |
|             7.92 |       9 |
|            13.86 |      10 |
|            11.88 |      11 |
|            11.88 |      12 |
|             7.92 |      13 |
|            12.87 |      14 |
|             4.95 |      15 |
|             6.93 |      16 |
|              9.9 |      17 |
|            16.83 |      18 |
|            10.89 |      19 |
|            10.89 |      20 |
|            17.82 |      21 |
|             2.97 |      22 |
|            33.66 |      23 |
|            22.77 |      24 |
|            12.87 |      25 |
+------------------+---------+
(Output limit exceeded, 25 of 347 total rows shown)

*/

SELECT sum(t.UnitPrice), a.AlbumId
FROM tracks t INNER JOIN albums a ON a.AlbumId = t.AlbumId
WHERE a.Title = 'Big Ones'

/*

+------------------+---------+
| sum(t.UnitPrice) | AlbumId |
+------------------+---------+
|            14.85 |       5 |
+------------------+---------+

What is the total price for the album “Big Ones”?

Ans: 14.85

*/

/*
Q5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?
*/

SELECT i.InvoiceId, ii.InvoiceId
FROM invoices i CROSS JOIN invoice_items ii

/*

+-----------+------------+
| InvoiceId | InvoiceId  |
+-----------+------------+
|         1 |          1 |
|         1 |          1 |
|         1 |          2 |
|         1 |          2 |
|         1 |          2 |
|         1 |          2 |
|         1 |          3 |
|         1 |          3 |
|         1 |          3 |
|         1 |          3 |
|         1 |          3 |
|         1 |          3 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          4 |
|         1 |          5 |
|         1 |          5 |
|         1 |          5 |
|         1 |          5 |
+-----------+------------+
(Output limit exceeded, 25 of 922880 total rows shown)

Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.

Ans: 922880

*/
/**/
/**/
/**/