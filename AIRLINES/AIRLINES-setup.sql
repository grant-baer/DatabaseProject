
/*
--NAME: GRANT BAER
--EMAIL: grbaer@calpoly.edu
*/
/*CREATING TABLE*/


CREATE TABLE Airlines(
    Id INT PRIMARY KEY,
    Airline VARCHAR(32),
    Abbreviation VARCHAR(16),
    Country VARCHAR(32)
);

CREATE TABLE Airports( 
    City VARCHAR(32),
    AirportCode VARCHAR(12) PRIMARY KEY,
    AirportName VARCHAR(64),
    Country VARCHAR(32),
    CountryAbbrev VARCHAR(12)
);

CREATE TABLE Flights(
    Airline INT,
    FlightNo INT,
    SourceAirport VARCHAR(12),
    DestAirport VARCHAR(12),
    PRIMARY KEY (Airline, FlightNo, SourceAirport),
    FOREIGN KEY (Airline) REFERENCES Airlines(Id),
    FOREIGN KEY (SourceAirport) REFERENCES Airports(AirportCode),
    FOREIGN KEY (DestAirport) REFERENCES Airports(AirportCode)
);















