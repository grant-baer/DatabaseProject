

/*CREATING TABLE*/

/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  

CREATE TABLE Marathon(
    Place INT PRIMARY Key,
    Time TIME,
    Pace TIME,
    GroupPlace INT,
    GroupNumber INT,
    Age INT,
    Sex VARCHAR(12),
    BIBNumber VARCHAR(32),
    FirstName VARCHAR(32),
    LastName VARCHAR(32),
    Town VARCHAR(32),
    State VARCHAR(32),
    UNIQUE(Time, LastName),
    UNIQUE(GroupNumber, BIBNumber)
);  
