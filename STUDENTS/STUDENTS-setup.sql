/*CREATING TABLE*/


/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  

CREATE TABLE Teachers( 
    LastName VARCHAR(32),
    FirstName VARCHAR(32),
    Classroom INT PRIMARY KEY
);

CREATE TABLE List(
    LastName VARCHAR(32),
    FirstName VARCHAR(32),
    Grade INT,
    Classroom INT,
    PRIMARY KEY(Classroom, LastName),
    FOREIGN KEY(Classroom) REFERENCES Teachers(Classroom)
);


