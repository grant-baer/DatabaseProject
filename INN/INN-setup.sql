
/*CREATING TABLE*/

/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  
CREATE TABLE Rooms(
    RoomId VARCHAR(3) PRIMARY KEY,
    roomName VARCHAR(64),
    beds INT,
    bedType VARCHAR(12),
    maxOccupancy INT,
    basePrice FLOAT,
    decor VARCHAR(32)
);

CREATE TABLE Reservations( 
    Code INT PRIMARY KEY,
    Room VARCHAR(3),
    CheckIn VARCHAR(12),
    CheckOut VARCHAR(12),
    Rate INT,
    LastName VARCHAR(32),
    FirstName VARCHAR(32),
    Adults INT,
    Kids INT,
    FOREIGN KEY(Room) REFERENCES Rooms(RoomId)
);


