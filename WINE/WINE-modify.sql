

/*Grant Baer
  grbaer@calpoly.edu*/


--remove columns storing appelation names and name of wine from the wine table

/*ALTER TABLE Wine
DROP FOREIGN KEY Appellation;
*/
ALTER TABLE Wine
    DROP COLUMN Appellation;
ALTER TABLE Wine
    Drop Name;

--keep in the wine table only Zinfandels with score >= 92
DELETE FROM Wine
WHERE ((Grape != 'Zinfandels') And (Score < 92));


--Create revenue  attribute
ALTER TABLE Wine
    ADD (Revenue INT);


--Set revenue: cases * cost of case
UPDATE Wine
SET Revenue = Cases * Price
