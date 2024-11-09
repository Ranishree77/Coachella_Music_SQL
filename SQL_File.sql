Create schema BAND;

CREATE TABLE Bands (
    BandID INT PRIMARY KEY,
    BandName VARCHAR(50) NOT NULL,
    Genre VARCHAR(30),
    FormedYear INT,
    Country VARCHAR(30)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    BandID INT,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Instrument VARCHAR(30),
    JoinYear INT,
    FOREIGN KEY (BandID) REFERENCES Bands(BandID)
);

CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    BandID INT,
    AlbumName VARCHAR(50),
    ReleaseYear INT,
    Genre VARCHAR(30),
    FOREIGN KEY (BandID) REFERENCES Bands(BandID)
);

CREATE TABLE Songs (
    SongID INT PRIMARY KEY,
    AlbumID INT,
    SongTitle VARCHAR(50),
    Duration TIME,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Performances (
    PerformanceID INT PRIMARY KEY,
    BandID INT,
    Stage VARCHAR(30),
    PerformanceDate DATE,
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (BandID) REFERENCES Bands(BandID)
);

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY,
    PerformanceID INT,
    Price DECIMAL(8,2),
    SeatNumber VARCHAR(10),
    PurchaseDate DATE,
    FOREIGN KEY (PerformanceID) REFERENCES Performances(PerformanceID)
);

CREATE TABLE Fans (
    FanID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Email VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE TicketSales (
    SaleID INT PRIMARY KEY,
    TicketID INT,
    FanID INT,
    SaleDate DATE,
    FOREIGN KEY (TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY (FanID) REFERENCES Fans(FanID)
);