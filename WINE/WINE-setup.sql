
/*CREATING TABLE*/

/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  


CREATE TABLE Appellations(
    Id INT PRIMARY KEY,
    Appellation VARCHAR(32) UNIQUE,
    County VARCHAR(32),
    State  VARCHAR(32),
    Area VARCHAR(32),
    isAVA VARCHAR(32)
);

CREATE TABLE Grapes( 
    Id INT PRIMARY KEY,
    Grape VARCHAR(32) UNIQUE,
    Color VARCHAR(12)

);

CREATE TABLE Wine( 
    Id INT PRIMARY KEY,
    Grape VARCHAR(32),
    Winery VARCHAR(32),
    Appellation  VARCHAR(32),
    Name VARCHAR(32),
    Year INT,
    Price INT,
    Score INT,
    Cases INT,
    FOREIGN KEY(Grape) REFERENCES Grapes(Grape)
    /*FOREIGN KEY(Appellation) REFERENCES Appellations(Appellation)*/

);
