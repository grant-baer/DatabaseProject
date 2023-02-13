/*CREATING TABLE*/


/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/
  


CREATE TABLE Albums(
    AId INT PRIMARY KEY,
    Title VARCHAR(32),
    Year INT,
    Label VARCHAR(32),
    Type VARCHAR(32)

);

CREATE TABLE Band( 
    Id INT PRIMARY KEY,
    FirstName VARCHAR(32),
    LastName VARCHAR(32)
);

CREATE TABLE Songs(
    SongId INT PRIMARY KEY,
    Title VARCHAR(32)
    
);

CREATE TABLE Instruments(
    SongId INT,
    BandmateId INT,
    Instrument VARCHAR(32) Primary KEY,

    FOREIGN KEY(SongId) REFERENCES Songs(SongId),
    FOREIGN KEY(BandmateId) REFERENCES Band(Id)


);

CREATE TABLE Performance( 
    SongId INT,
    BandmateId INT,
    StagePosition VARCHAR(32),
    Primary KEY(SongId, BandmateId),
    FOREIGN KEY(SongId) REFERENCES Songs(SongId),
    FOREIGN KEY(BandmateId) REFERENCES Band(Id)
);


CREATE TABLE Tracklists( 
    AlbumId INT,
    Position INT,
    SongId INT,
    Primary KEY(AlbumId, Position),
    FOREIGN KEY(SongId) REFERENCES Songs(SongId),
    FOREIGN KEY(AlbumId) REFERENCES Albums(AId)
);

CREATE TABLE Vocals(
    SongId INT,
    BandmateId INT,
    Type VARCHAR(32),
    Primary KEY(SongId, BandmateId),
    FOREIGN KEY(SongId) REFERENCES Songs(SongId),
    FOREIGN KEY(BandmateId) REFERENCES Band(Id)
);


