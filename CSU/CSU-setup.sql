



/*CREATING TABLE*/

/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  
CREATE TABLE Campuses(
    Id INT PRIMARY KEY,
    Campus VARCHAR(64) UNIQUE,
    Location VARCHAR(64),
    County VARCHAR(64),
    Year INT
);

/*IDK BOUT PRIMARY*/
CREATE TABLE CSUFees( 
    Campus INT,
    Year INT,
    CampusFee INT,
    FOREIGN KEY(Campus) REFERENCES Campuses(Id)
);

CREATE TABLE Degrees(
    Year INT,
    Campus INT,
    Degrees INT,
    FOREIGN KEY(Campus) REFERENCES Campuses(Id)
);

CREATE TABLE Disciplines( 
    Id INT PRIMARY KEY,
    Name VARCHAR(32)
);




CREATE TABLE Enrollments(
    Campus INT,
    Year INT,
    TotalEnrollment_AY INT,
    FTE_AY INT,
    FOREIGN KEY(Campus) REFERENCES Campuses(Id)
);

CREATE TABLE Faculty(
    Campus INT,
    Year INT,
    Faculty FLOAT,
    FOREIGN KEY(Campus) REFERENCES Campuses(Id)
);


CREATE TABLE DisciplineEnrollments(
    Campus INT,
    Discipline INT,
    Year INT,
    Undergraduate INT,
    Graduate INT,
    FOREIGN KEY(Campus) REFERENCES Campuses(Id),
    FOREIGN KEY(Discipline) REFERENCES Disciplines(Id)
);




























