


/*GRANT BAER 
grbaer@calpoly.edu*/


CREATE TABLE Continents(
    ContId INT PRIMARY KEY,
    Continent VARCHAR(32)
);

CREATE TABLE Countries( 
    CountryId INT PRIMARY KEY,
    CountryName VARCHAR(32),
    Continent INT,
    FOREIGN KEY (Continent) REFERENCES Continents(ContId)
);

CREATE TABLE CarMakers(
    Id INT PRIMARY KEY,
    Maker VARCHAR(64),
    FullName VARCHAR(32),
    Country INT,
    FOREIGN KEY(Country) REFERENCES Countries(CountryId)
);

CREATE TABLE ModelList(
    ModelId INT PRIMARY KEY,
    Maker INT,
    Model VARCHAR(32) UNIQUE,
    FOREIGN KEY(Maker) REFERENCES CarMakers(Id)

);

CREATE TABLE CarNames( 
    Id INT PRIMARY KEY,
    Model VARCHAR(32),
    Make VARCHAR(32),
    FOREIGN KEY(Model) REFERENCES ModelList(Model)

);

CREATE TABLE CarsData(
    Id INT PRIMARY KEY,
    MPG FLOAT,
    Cylinders INT,
    Edispl INT,
    Horsepower INT,
    Weight INT,
    Accelerate FLOAT,
    Year INT,
    FOREIGN KEY(Id) REFERENCES CarNames(Id)

);































