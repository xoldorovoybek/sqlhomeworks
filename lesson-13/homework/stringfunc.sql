--Extract a Substring → Extract the first 4 characters from 'DATABASE'.
select left('DATABASE', 4)
--2 Find Position of a Word → Find position of 'SQL' in 'I love SQL Server'.
  select CHARINDEX('SQL', 'I love SQL Server')
--3 Replace a Word → Replace 'World' with 'SQL' in 'Hello World'.
select replace('Hello World', 'World', 'SQL')
--4Find String Length → Find length of 'Microsoft SQL Server'.
  select len('Microsoft SQL Server')
--5 Extract Last 3 Characters → Get last 3 characters from 'Database'.
   select right('Database', 3)
--6 Count a Character → Count occurrences of 'a' in 'apple', 'banana', 'grape'.
   SELECT 
  LEN('apple') - LEN(REPLACE('apple', 'a', '')) AS apple_a_count,
  LEN('banana') - LEN(REPLACE('banana', 'a', '')) AS banana_a_count,
  LEN('grape') - LEN(REPLACE('grape', 'a', '')) AS grape_a_count;
  
--7 Remove Part of a String → Remove first 5 characters from 'abcdefg'.
   select right('abcdefg', 2)
  
--8 Extract a Word → Extract second word from 'SQL is powerful', 'I love databases'.
  SELECT 
  PARSENAME(REPLACE('SQL is powerful', ' ', '.'), 2) AS second_word_1,
  PARSENAME(REPLACE('I love databases', ' ', '.'), 2) AS second_word_2;

--9Round a Number → Round 15.6789 to 2 decimal places.
   select round(15.6789, 2)
--10 Absolute Value → Find absolute value of -345.67.
       select abs(-345.67)
--
--Intermediate Level (10 Puzzles)
--Find Middle Characters → Extract middle 3 characters from 'ABCDEFGHI'.
  select substring('ABCDEFGHI', 4,3)
   
--Replace Part of String → Replace first 3 chars of 'Microsoft' with 'XXX'.
   select replace('Microsoft', 'Mic', 'XXX')
--Find First Space → Find position of first space in 'SQL Server 2025'.
    select charindex(' ', 'SQL Server 2025')
--Concatenate Names → Join FirstName & LastName with ', '.
    select concat('FirstName',  ' ',  'LastName')
--Find Nth Word → Extract third word from 'The database is very efficient'.
  SELECT PARSENAME(REPLACE('The database is very efficient', ' ', '.'), 3) third_word
  
  
--Extract Only Numbers → Get numeric part from 'INV1234', 'ORD5678'.
DECLARE @string1 VARCHAR(50) = 'INV1234';
DECLARE @string2 VARCHAR(50) = 'ORD5678';

-- Метод с использованием PATINDEX и SUBSTRING

SELECT
    SUBSTRING(@string1, PATINDEX('%[0-9]%', @string1), LEN(@string1) - PATINDEX('%[0-9]%', @string1) + 1) AS NumericPart1,
    SUBSTRING(@string2, PATINDEX('%[0-9]%', @string2), LEN(@string2) - PATINDEX('%[0-9]%', @string2) + 1) AS NumericPart2;

--Round to Nearest Integer → Round 99.5 to the nearest integer.
    select CEILING(99.5)
--Find Day Difference → Days between '2025-01-01' & '2025-03-15'.
 select datediff(day, '2025-01-01', '2025-03-15')
--Find Month Name → Retrieve month name from '2025-06-10'.
select month('2025-06-10')
--Calculate Week Number → Week number for '2025-04-22'.
  select datepart(ISO_WEEK, '2025-04-22')
--Advanced Level (10 Puzzles)
--Extract After '@' → Extract domain from 'user1@gmail.com', 'admin@company.org'.
  DECLARE @email1 VARCHAR(100) = 'user1@gmail.com';
  DECLARE @email2 VARCHAR(100) = 'admin@company.org';

SELECT
    SUBSTRING(@email1, CHARINDEX('@', @email1) + 1, LEN(@email1)) AS Domain1,
    SUBSTRING(@email2, CHARINDEX('@', @email2) + 1, LEN(@email2)) AS Domain2;
--Find Last Occurrence → Last 'e' in 'experience'.
 DECLARE @word VARCHAR(50) = 'experience';
 DECLARE @char CHAR(1) = 'e';

  SELECT
    LEN(@word) - CHARINDEX(REVERSE(@char), REVERSE(@word)) + 1 AS LastOccurrence;

  
--Generate Random Number → Random number between 100-500.
SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100 AS RandomNumber;
--Format with Commas → Format 9876543 as "9,876,543".
DECLARE @number INT = 9876543;

SELECT FORMAT(@number, 'N0') AS FormattedNumber;

--Extract First Name → Get first name from 
CREATE TABLE Customers (FullName VARCHAR(100)); 
INSERT INTO Customers VALUES ('John Doe'), ('Jane Smith');

select left(FullName, CHARINDEX(' ', Fullname) -1) firstname from Customers
--Replace Spaces with Dashes → Change 'SQL Server is great' → 'SQL-Server-is-great'.
  select replace('SQL Server is great', ' ', '-')
--Pad with Zeros → Convert 42 to '00042' (5-digit).
  DECLARE @number INT = 42;
  DECLARE @length INT = 5;

SELECT RIGHT(REPLICATE('0', @length) + CAST(@number AS VARCHAR), @length) AS PaddedNumber;

--Find Longest Word Length → Longest word in 'SQL is fast and efficient'.
  DECLARE @text VARCHAR(255) = 'SQL is fast and efficient';

SELECT MAX(LEN(value)) AS LongestWordLength
FROM STRING_SPLIT(@text, ' ');

--Remove First Word → Remove first word from 'Error: Connection failed'. Output: : 
--Connection failed' 3️⃣0️⃣ Find Time Difference → Minutes between '08:15:00' & '09:45:00'.

DECLARE @text VARCHAR(255) = 'Error: Connection failed';

SELECT SUBSTRING(@text, CHARINDEX(' ', @text) + 1, LEN(@text)) AS RemainingText;

-- Объяснение:

  declare @time1 time = '08:15:00'
  declare @time2 time = '09:45:00'

  select DATEDIFF(minute, @time1, @time2)
