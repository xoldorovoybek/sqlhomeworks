CREATE TABLE InputTbl 
( col1 VARCHAR(10), col2 VARCHAR(10) ); INSERT INTO InputTbl (col1, col2) 
VALUES ('a', 'b'), ('a', 'b'), ('b', 'a'), ('c', 'd'), ('c', 'd'), ('m', 'n'), ('n', 'm');


SELECT DISTINCT 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS colA,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS colB
FROM InputTbl;


CREATE TABLE TestMultipleZero ( A INT NULL, B INT NULL, C INT NULL, D INT NULL );


INSERT INTO TestMultipleZero(A,B,C,D) VALUES (0,0,0,1), (0,0,1,0), (0,1,0,0), (1,0,0,0), (0,0,0,0), (1,1,1,0);

select * from TestMultipleZero
where (A + B + C + D) > 0


create table section1(id int, name varchar(20)) insert into section1 values 
(1, 'Been'), (2, 'Roma'), (3, 'Steven'), (4, 'Paulo'), (5, 'Genryh'), (6, 'Bruno'), (7, 'Fred'), (8, 'Andro')

select min(id) id  from section1

select max(id) id from section1


select * from section1
where name like 'b_%'

CREATE TABLE ProductCodes ( Code VARCHAR(20) );

INSERT INTO ProductCodes (Code) VALUES 
('X-123'), ('X_456'), ('X#789'), ('X-001'), ('X%202'), ('X_ABC'), ('X#DEF'), ('X-999');

select * from ProductCodes
where Code like '%\_%' escape '\'
