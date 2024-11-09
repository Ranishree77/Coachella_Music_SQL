-- Inserting data into Bands table
INSERT INTO Bands (BandID, BandName, Genre, FormedYear, Country) VALUES
(1, 'The Beatles', 'Rock', 1960, 'UK'),
(2, 'Queen', 'Rock', 1970, 'UK'),
(3, 'Metallica', 'Metal', 1981, 'USA'),
(4, 'Nirvana', 'Grunge', 1987, 'USA'),
(5, 'Pink Floyd', 'Progressive Rock', 1965, 'UK'),
(6, 'AC/DC', 'Hard Rock', 1973, 'Australia'),
(7, 'Led Zeppelin', 'Rock', 1968, 'UK'),
(8, 'The Rolling Stones', 'Rock', 1962, 'UK'),
(9, 'U2', 'Rock', 1976, 'Ireland'),
(10, 'Radiohead', 'Alternative Rock', 1985, 'UK'),
(11, 'Coldplay', 'Alternative Rock', 1996, 'UK'),
(12, 'Red Hot Chili Peppers', 'Funk Rock', 1983, 'USA'),
(13, 'Guns N Roses', 'Hard Rock', 1985, 'USA'),
(14, 'The Doors', 'Psychedelic Rock', 1965, 'USA'),
(15, 'The Eagles', 'Rock', 1971, 'USA');

-- Inserting data into Members table
INSERT INTO Members (MemberID, BandID, FirstName, LastName, Instrument, JoinYear) VALUES
(1, 1, 'John', 'Lennon', 'Vocals', 1960),
(2, 1, 'Paul', 'McCartney', 'Bass', 1960),
(3, 2, 'Freddie', 'Mercury', 'Vocals', 1970),
(4, 2, 'Brian', 'May', 'Guitar', 1970),
(5, 3, 'James', 'Hetfield', 'Vocals', 1981),
(6, 3, 'Lars', 'Ulrich', 'Drums', 1981),
(7, 4, 'Kurt', 'Cobain', 'Vocals', 1987),
(8, 4, 'Krist', 'Novoselic', 'Bass', 1987),
(9, 5, 'David', 'Gilmour', 'Guitar', 1968),
(10, 6, 'Angus', 'Young', 'Guitar', 1973),
(11, 7, 'Robert', 'Plant', 'Vocals', 1968),
(12, 7, 'Jimmy', 'Page', 'Guitar', 1968),
(13, 8, 'Mick', 'Jagger', 'Vocals', 1962),
(14, 9, 'Bono', 'Simre', 'Vocals', 1976),
(15, 10, 'Thom', 'Yorke', 'Vocals', 1985);

-- Inserting data into Albums table
INSERT INTO Albums (AlbumID, BandID, AlbumName, ReleaseYear, Genre) VALUES
(1, 1, 'Abbey Road', 1969, 'Rock'),
(2, 2, 'A Night at the Opera', 1975, 'Rock'),
(3, 3, 'Master of Puppets', 1986, 'Metal'),
(4, 4, 'Nevermind', 1991, 'Grunge'),
(5, 5, 'The Dark Side of the Moon', 1973, 'Progressive Rock'),
(6, 6, 'Back in Black', 1980, 'Hard Rock'),
(7, 7, 'Led Zeppelin IV', 1971, 'Rock'),
(8, 8, 'Sticky Fingers', 1971, 'Rock'),
(9, 9, 'The Joshua Tree', 1987, 'Rock'),
(10, 10, 'OK Computer', 1997, 'Alternative Rock'),
(11, 11, 'A Rush of Blood to the Head', 2002, 'Alternative Rock'),
(12, 12, 'Californication', 1999, 'Funk Rock'),
(13, 13, 'Appetite for Destruction', 1987, 'Hard Rock'),
(14, 14, 'L.A. Woman', 1971, 'Psychedelic Rock'),
(15, 15, 'Hotel California', 1976, 'Rock');

-- Inserting data into Songs table
INSERT INTO Songs (SongID, AlbumID, SongTitle, Duration) VALUES
(1, 1, 'Come Together', '00:04:20'),
(2, 2, 'Bohemian Rhapsody', '00:05:55'),
(3, 3, 'Battery', '00:05:12'),
(4, 4, 'Smells Like Teen Spirit', '00:05:01'),
(5, 5, 'Money', '00:06:22'),
(6, 6, 'Hells Bells', '00:05:12'),
(7, 7, 'Stairway to Heaven', '00:08:02'),
(8, 8, 'Brown Sugar', '00:03:49'),
(9, 9, 'With or Without You', '00:04:56'),
(10, 10, 'Paranoid Android', '00:06:23'),
(11, 11, 'The Scientist', '00:05:09'),
(12, 12, 'Scar Tissue', '00:03:37'),
(13, 13, 'Sweet Child o Mine', '00:05:56'),
(14, 14, 'Riders on the Storm', '00:07:09'),
(15, 15, 'Hotel California', '00:06:31');

-- Inserting data into Performances table
INSERT INTO Performances (PerformanceID, BandID, Stage, PerformanceDate, StartTime, EndTime) VALUES
(1, 1, 'Wembley', '1965-08-15', '18:00:00', '20:00:00'),
(2, 2, 'Madison Square Garden', '1977-12-02', '20:00:00', '22:30:00'),
(3, 3, 'O2 Arena', '2008-09-12', '19:00:00', '21:00:00'),
(4, 4, 'Reading Festival', '1992-08-30', '21:00:00', '22:30:00'),
(5, 5, 'Earls Court', '1973-05-18', '19:30:00', '22:00:00'),
(6, 6, 'Sydney Opera House', '1981-02-13', '20:00:00', '22:00:00'),
(7, 7, 'Madison Square Garden', '1973-07-27', '20:00:00', '22:30:00'),
(8, 8, 'Hyde Park', '1969-07-05', '17:00:00', '19:00:00'),
(9, 9, 'Slane Castle', '2001-09-01', '20:00:00', '22:30:00'),
(10, 10, 'Glastonbury', '2003-06-28', '21:30:00', '23:30:00'),
(11, 11, 'Estadio do Dragao', '2017-07-15', '20:00:00', '22:00:00'),
(12, 12, 'Woodstock', '1994-08-12', '21:00:00', '23:30:00'),
(13, 13, 'Rock in Rio', '1991-01-20', '20:00:00', '22:30:00'),
(14, 14, 'The Matrix', '1967-03-10', '20:30:00', '22:30:00'),
(15, 15, 'The Forum', '1977-08-05', '19:30:00', '22:00:00'),
(16, 1, 'Coachella', '2024-04-12', '20:00:00', '22:00:00'),
(17, 1, 'Lollapalooza', '2024-07-20', '18:00:00', '20:00:00');

-- Inserting data into Tickets table
INSERT INTO Tickets (TicketID, PerformanceID, Price, SeatNumber, PurchaseDate) VALUES
(1, 1, 25.00, 'A12', '1965-07-20'),
(2, 2, 50.00, 'B20', '1977-11-01'),
(3, 3, 70.00, 'C33', '2008-08-10'),
(4, 4, 30.00, 'D45', '1992-07-25'),
(5, 5, 55.00, 'E16', '1973-04-10'),
(6, 6, 40.00, 'F28', '1981-01-15'),
(7, 7, 60.00, 'G07', '1973-06-20'),
(8, 8, 20.00, 'H34', '1969-06-15'),
(9, 9, 75.00, 'I14', '2001-08-15'),
(10, 10, 80.00, 'J09', '2003-05-20'),
(11, 11, 90.00, 'K23', '2017-06-30'),
(12, 12, 65.00, 'L19', '1994-07-20'),
(13, 13, 85.00, 'M11', '1990-12-15'),
(14, 14, 45.00, 'N27', '1967-02-20'),
(15, 15, 100.00, 'O30', '1977-07-10');

-- Inserting data into Fans table
INSERT INTO Fans (FanID, FirstName, LastName, Email, Phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-123-4567'),
(2, 'Jane', 'Doe', 'jane.doe@example.com', '555-234-5678'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-345-6789'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-456-7890'),
(5, 'Chris', 'Brown', 'chris.brown@example.com', '555-567-8901'),
(6, 'Jessica', 'Wilson', 'jessica.wilson@example.com', '555-678-9012'),
(7, 'Matthew', 'Taylor', 'matthew.taylor@example.com', '555-789-0123'),
(8, 'Laura', 'Anderson', 'laura.anderson@example.com', '555-890-1234'),
(9, 'David', 'White', 'david.white@example.com', '555-901-2345'),
(10, 'Sarah', 'Martinez', 'sarah.martinez@example.com', '555-012-3456'),
(11, 'James', 'Thomas', 'james.thomas@example.com', '555-123-4568'),
(12, 'Amanda', 'Jackson', 'amanda.jackson@example.com', '555-234-5679'),
(13, 'Robert', 'Harris', 'robert.harris@example.com', '555-345-6780'),
(14, 'Olivia', 'Clark', 'olivia.clark@example.com', '555-456-7891'),
(15, 'Daniel', 'Lewis', 'daniel.lewis@example.com', '555-567-8902');

-- Inserting data into TicketSales table
INSERT INTO TicketSales (SaleID, TicketID, FanID, SaleDate) VALUES
(1, 1, 1, '1965-07-21'),
(2, 2, 2, '1977-11-02'),
(3, 3, 3, '2008-08-11'),
(4, 4, 4, '1992-07-26'),
(5, 5, 5, '1973-04-11'),
(6, 6, 6, '1981-01-16'),
(7, 7, 7, '1973-06-21'),
(8, 8, 8, '1969-06-16'),
(9, 9, 9, '2001-08-16'),
(10, 10, 10, '2003-05-21'),
(11, 11, 11, '2017-07-01'),
(12, 12, 12, '1994-07-21'),
(13, 13, 13, '1990-12-16'),
(14, 14, 14, '1967-02-21'),
(15, 15, 15, '1977-07-11');

