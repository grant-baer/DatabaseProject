

/*CREATING TABLE*/

/*NAME: GRANT BAER
  EMAIL: grbaer@calpoly.edu*/

CREATE TABLE Customers(
    Id INT PRIMARY KEY,
    LastName VARCHAR(32),
    FirstName VARCHAR(32)
);

CREATE TABLE Goods( 
    Id VARCHAR(32) PRIMARY KEY,
    Flavor VARCHAR(32),
    Food VARCHAR(32),
    Price FLOAT
);


CREATE TABLE Items(
    Reciept INT,
    Ordinal INT,
    Item VARCHAR(32),
    FOREIGN KEY(Item) REFERENCES Goods(Id)
);


CREATE TABLE Receipts( 
    RecieptNumber INT PRIMARY KEY,
    Date DATE,
    CustomerId INT,
    FOREIGN KEY(CustomerId) REFERENCES Customers(Id)
);



