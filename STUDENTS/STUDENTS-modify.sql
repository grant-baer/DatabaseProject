
/*Grant Baer
  grbaer@calpoly.edu*/


--Add GPA attribute
ALTER TABLE List
    ADD (GPA FLOAT);

--keep only grades 0 and 1
DELETE FROM List
WHERE (Grade > 1);

--add class 115 Ernesto Valdez
INSERT INTO Teachers
VALUES ('Valdez', 'Ernesto', 115);


--move SHERMAN DROP, THEO HUTCHENS, AND FRANKLYN BRINE to class 120
UPDATE List
SET Classroom = 120
WHERE (FirstName = 'SHERMAN' AND LastName = 'DROP') OR (FirstName = 'THEO' AND LastName = 'HUTCHENS') OR (FirstName = 'FRANKLYN' AND LastName = 'BRINE');


--Set GPA of first graders to 3.25
UPDATE List
SET GPA = 3.25
WHERE (Grade = 1);


--Set GPA of kindergardeners from 105 to 2.9
UPDATE List
SET GPA = 2.9
WHERE ((Grade = 0) AND (Classroom = 105));

--Set GPA of kindergardeners from 106 to 3.5
UPDATE List
SET GPA = 3.5
WHERE ((Grade = 0) AND (Classroom = 106));

--Add new kindergarden students to 115: YORAM LEVY, JUSTING WASHINGTON, ASTRIF NG
-- with GPA of 3.2
INSERT INTO List(LastName, FirstName, Grade, Classroom, GPA)
VALUES ('LEVY', 'YORAM', 0, 115, 3.2);
INSERT INTO List(LastName, FirstName, Grade, Classroom, GPA)
VALUES ('WASHINGTON', 'JUSTING', 0, 115, 3.2);
INSERT INTO List(LastName, FirstName, Grade, Classroom, GPA)
VALUES ('NG', 'ASTRIF', 0, 115, 3.2);


--GPA of COLLIN VANVLIET to 4.0
UPDATE List
SET GPA = 4.0
WHERE (FirstName = 'COLLIN' AND LastName = 'VANVLIET') ;

--GPA of KITTLE MOWAT to current+.3
UPDATE List
SET GPA = GPA + .3
WHERE (FirstName = 'KITTLE' AND LastName = 'MOWAT') ;

--GPA of SHERON NAKAHARA and BENNIE BYRUM to 10% higher than current

UPDATE List
SET GPA = GPA + (GPA*.1)
WHERE (FirstName = 'SHERON' AND LastName = 'NAKAHARA') OR (FirstName = 'BENNIE' AND LastName = 'BYRUM');



SELECT * FROM List
ORDER BY GPA, Grade, LastName;


SELECT *
FROM Teachers;