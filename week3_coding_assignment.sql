---Module 3 Coding Assignment---

---Link to ER DIAGRAM: https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png

/*
All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.
*/

---Q1. Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name, AlbumId 
FROM Tracks
WHERE AlbumId IN 
    (SELECT AlbumId 
        FROM Albums 
            WHERE Title = 'Californication')

/*
+-------------------+---------+
| Name              | AlbumId |
+-------------------+---------+
| Around The World  |     195 |
| Parallel Universe |     195 |
| Scar Tissue       |     195 |
| Otherside         |     195 |
| Get On Top        |     195 |
| Californication   |     195 |
| Easily            |     195 |
| Porcelain         |     195 |
| Emit Remmus       |     195 |
| I Like Dirt       |     195 |
+-------------------+---------+
(Output limit exceeded, 10 of 15 total rows shown)
What is the title of the 8th track?

Ans: Porcelain
*/

---Q2. Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT c.CustomerId, c.FirstName, c.LastName, c.City, c.Email, COUNT(i.InvoiceId)
FROM Customers c INNER JOIN Invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId

/*
+------------+-----------+-------------+---------------------+--------------------------+--------------------+
| CustomerId | FirstName | LastName    | City                | Email                    | COUNT(i.InvoiceId) |
+------------+-----------+-------------+---------------------+--------------------------+--------------------+
|          1 | Luís      | Gonçalves   | São José dos Campos | luisg@embraer.com.br     |                  7 |
|          2 | Leonie    | Köhler      | Stuttgart           | leonekohler@surfeu.de    |                  7 |
|          3 | François  | Tremblay    | Montréal            | ftremblay@gmail.com      |                  7 |
|          4 | Bjørn     | Hansen      | Oslo                | bjorn.hansen@yahoo.no    |                  7 |
|          5 | František | Wichterlová | Prague              | frantisekw@jetbrains.com |                  7 |
|          6 | Helena    | Holý        | Prague              | hholy@gmail.com          |                  7 |
|          7 | Astrid    | Gruber      | Vienne              | astrid.gruber@apple.at   |                  7 |
|          8 | Daan      | Peeters     | Brussels            | daan_peeters@apple.be    |                  7 |
|          9 | Kara      | Nielsen     | Copenhagen          | kara.nielsen@jubii.dk    |                  7 |
|         10 | Eduardo   | Martins     | São Paulo           | eduardo@woodstock.com.br |                  7 |
+------------+-----------+-------------+---------------------+--------------------------+--------------------+
(Output limit exceeded, 10 of 59 total rows shown)
After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).

Ans: frantisekw@jetbrains.com
*/

---Q3. Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT t.Name, a.Title, a.ArtistId, t.TrackId
FROM Tracks t INNER JOIN Albums a 
ON t.AlbumId = a.AlbumId

/*

+-----------------------------------------+---------------------------------------+----------+---------+
| Name                                    | Title                                 | ArtistId | TrackId |
+-----------------------------------------+---------------------------------------+----------+---------+
| For Those About To Rock (We Salute You) | For Those About To Rock We Salute You |        1 |       1 |
| Put The Finger On You                   | For Those About To Rock We Salute You |        1 |       6 |
| Let's Get It Up                         | For Those About To Rock We Salute You |        1 |       7 |
| Inject The Venom                        | For Those About To Rock We Salute You |        1 |       8 |
| Snowballed                              | For Those About To Rock We Salute You |        1 |       9 |
| Evil Walks                              | For Those About To Rock We Salute You |        1 |      10 |
| C.O.D.                                  | For Those About To Rock We Salute You |        1 |      11 |
| Breaking The Rules                      | For Those About To Rock We Salute You |        1 |      12 |
| Night Of The Long Knives                | For Those About To Rock We Salute You |        1 |      13 |
| Spellbound                              | For Those About To Rock We Salute You |        1 |      14 |
+-----------------------------------------+---------------------------------------+----------+---------+
(Output limit exceeded, 10 of 3503 total rows shown)

What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.

Ans: Breaking The Rules

*/

---Q4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT e.LastName as EmpName, m.LastName as ManagerName 
FROM Employees e INNER JOIN Employees m
ON e.ReportsTo = m.EmployeeId

/*

+----------+-------------+
| EmpName  | ManagerName |
+----------+-------------+
| Edwards  | Adams       |
| Peacock  | Edwards     |
| Park     | Edwards     |
| Johnson  | Edwards     |
| Mitchell | Adams       |
| King     | Mitchell    |
| Callahan | Mitchell    |
+----------+-------------+
After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?

Ans:
Callahan
King

*/

---Q5. Find the name and ID of the artists who do not have albums. 

SELECT a.ArtistId, a.Name 
FROM Artists a left JOIN Albums al
ON a.ArtistId = al.ArtistId
WHERE al.Title is NULL

/*

+----------+----------------------------+
| ArtistId | Name                       |
+----------+----------------------------+
|       25 | Milton Nascimento & Bebeto |
|       26 | Azymuth                    |
|       28 | João Gilberto              |
|       29 | Bebel Gilberto             |
|       30 | Jorge Vercilo              |
|       31 | Baby Consuelo              |
|       32 | Ney Matogrosso             |
|       33 | Luiz Melodia               |
|       34 | Nando Reis                 |
|       35 | Pedro Luís & A Parede      |
+----------+----------------------------+
(Output limit exceeded, 10 of 71 total rows shown)
After running the query described above, two of the records returned have the same last name. Enter that name below.

Ans: Gilberto

*/

---Q7. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC

/*

+-----------+--------------+
| FirstName | LastName     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)
After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.

Ans: Taylor

*/

---Q7. See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT c.CustomerId, c.FirstName, c.LastName, c.City AS CustomerCity, i.BillingCity
FROM Customers c INNER JOIN Invoices i
ON c.CustomerId = i.CustomerId
WHERE c.City != i.BillingCity

/*

+------------+-----------+----------+--------------+-------------+
| CustomerId | FirstName | LastName | CustomerCity | BillingCity |
+------------+-----------+----------+--------------+-------------+
+------------+-----------+----------+--------------+-------------+
(Zero rows)
Indicate your answer below.

Ans: No customers have a different city listed in their billing city versus customer city.

*/