
/*Grant Baer
  grbaer@calpoly.edu*/


--Keep in the table the cars that 
   --were made in 1978 or 1979 & MPG >= 20
   --have MPG >= 26 & Horsepower > 110
   --Cylinders = 8 & Accelerate <= 60

DELETE FROM CarsData
WHERE (((Year != 1978) OR (Year != 1979)) AND (MPG < 20)) OR ((MPG<26) AND (Horsepower <= 110)) OR ((Cylinders != 8) AND (Accelerate > 60));
