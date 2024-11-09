SELECT * FROM Bands;
SELECT * FROM Performances;

/* BASIC COMMANDS */

SELECT Genre 
FROM Bands 
WHERE Genre LIKE '%Rock';

SELECT CONCAT(FirstName, ' ', LastName) 
AS MemberName, Instrument, JoinYear 
FROM Members 
ORDER BY JoinYear DESC;

SELECT Stage, PerformanceDate, StartTime, EndTime 
FROM Performances 
WHERE PerformanceDate BETWEEN '1965-04-01' AND '1972-04-14'; 

SELECT BandName, FormedYear
FROM Bands
WHERE Genre = 'Rock'

UNION

SELECT BandName, FormedYear
FROM Bands
WHERE Country = 'US';

SELECT BandID, PerformanceID, Stage, PerformanceDate, StartTime, EndTime
FROM Performances
WHERE StartTime > '20:00:00';

/*  INTERMEDIATE COMMANDS */

SELECT b.BandID, b.BandName, p.PerformanceID, p.Stage, p.PerformanceDate, p.StartTime, p.EndTime 
FROM Bands b 
INNER JOIN Performances p 
ON b.BandID = p.BandID 
WHERE p.Stage LIKE '%Garden';

SELECT b.BandID, b.BandName, COUNT(p.PerformanceID) AS PerformanceCount
FROM Bands b
INNER JOIN Performances p ON b.BandID = p.BandID
GROUP BY b.BandID, b.BandName
HAVING COUNT(p.PerformanceID) > 1;

SELECT b.BandID, b.BandName, p.PerformanceID, p.Stage, p.PerformanceDate, 
p.StartTime, p.EndTime, t.TicketID, t.Price, t.SeatNumber 
FROM Performances p 
LEFT JOIN Bands b ON p.BandID = b.BandID 
LEFT JOIN Tickets t ON p.PerformanceID = t.PerformanceID 
WHERE p.PerformanceDate < '1993-03-15' 
ORDER BY p.PerformanceDate DESC, p.PerformanceID DESC;

SELECT b.BandID, b.BandName, MAX(p.PerformanceDate) AS LastPerformanceDate,
       COUNT(p.PerformanceID) AS PerformanceCount
FROM Bands b
LEFT OUTER JOIN Performances p ON p.BandID = b.BandID
WHERE p.Stage NOT LIKE '%Garden%'
GROUP BY b.BandID, b.BandName;

 SELECT b.BandName AS BandName, p.Stage AS PerformanceStage, p.PerformanceDate AS PerformanceDate, 
 p.StartTime AS StartTime, p.EndTime AS EndTime, t.Price AS TicketPrice, t.SeatNumber AS SeatNumber 
 FROM Bands b INNER JOIN Performances p 
 ON b.BandID = p.BandID 
 LEFT JOIN Tickets t ON p.PerformanceID = t.PerformanceID 
 WHERE p.PerformanceDate LIKE '1977%' 
 ORDER BY p.PerformanceDate, p.PerformanceID;
 
 /* Advanced Commands */
 
 SELECT 
    pb.BandName AS BandName, 
    pb.PerformanceStage AS PerformanceStage, 
    pb.PerformanceDate AS PerformanceDate, 
    pb.StartTime AS StartTime, 
    pb.EndTime AS EndTime,
    tf.TicketPrice AS TicketPrice, 
    tf.SeatNumber AS SeatNumber, 
    tf.FanFirstName AS FanFirstName, 
    tf.FanLastName AS FanLastName
FROM (SELECT 
         p.PerformanceID, 
         p.Stage AS PerformanceStage, 
         p.PerformanceDate AS PerformanceDate, 
         p.StartTime AS StartTime, 
         p.EndTime AS EndTime, 
         b.BandName AS BandName
     FROM Performances p
     RIGHT OUTER JOIN Bands b ON p.BandID = b.BandID
     WHERE p.PerformanceDate LIKE '1973%') pb
LEFT OUTER JOIN (SELECT 
         t.TicketID AS TicketID, 
         t.Price AS TicketPrice, 
         t.SeatNumber AS SeatNumber, 
         f.FirstName AS FanFirstName, 
         f.LastName AS FanLastName, 
         t.PerformanceID AS PerformanceID
     FROM Tickets t
     LEFT OUTER JOIN TicketSales ts ON t.TicketID = ts.TicketID
     LEFT OUTER JOIN Fans f ON ts.FanID = f.FanID) tf
ON pb.PerformanceID = tf.PerformanceID
ORDER BY pb.PerformanceDate, pb.PerformanceID;

 SELECT CONCAT(b.BandName, ' - ', p.Stage) AS PerformanceDetail, p.PerformanceDate, p.StartTime, p.EndTime, 
 GROUP_CONCAT(DISTINCT CONCAT(f.FirstName, ' ', f.LastName)) AS FanNames 
 FROM Bands AS b 
 INNER JOIN Performances p ON b.BandID = p.BandID 
 LEFT OUTER JOIN Tickets t ON p.PerformanceID = t.PerformanceID 
 LEFT OUTER JOIN TicketSales ts ON t.TicketID = ts.TicketID 
 LEFT OUTER JOIN Fans f ON ts.FanID = f.FanID 
 GROUP BY b.BandName, p.Stage, p.PerformanceDate, p.StartTime, p.EndTime 
 HAVING COUNT(t.TicketID) = 1 
 ORDER BY p.PerformanceDate, b.BandName;
 
  WITH PerformanceDetails AS (SELECT b.BandName, p.Stage, p.PerformanceDate, p.StartTime, p.EndTime,
  t.TicketID, t.Price, t.SeatNumber, f.FirstName, f.LastName     
  FROM Performances p     
  INNER JOIN Bands b ON p.BandID = b.BandID     
  LEFT OUTER JOIN Tickets t ON p.PerformanceID = t.PerformanceID     
  LEFT OUTER JOIN TicketSales ts ON t.TicketID = ts.TicketID     
  LEFT OUTER JOIN Fans f ON ts.FanID = f.FanID     
  WHERE p.PerformanceDate BETWEEN '1962-01-01' AND '1988-12-31') 
  SELECT BandName, Stage, PerformanceDate, StartTime, EndTime, COUNT(TicketID) AS TotalTicketsSold,
  GROUP_CONCAT(DISTINCT CONCAT(FirstName, ' ', LastName)) AS Fans 
  FROM PerformanceDetails 
  GROUP BY BandName, Stage, PerformanceDate, StartTime, EndTime 
  HAVING TotalTicketsSold > 1 
  ORDER BY PerformanceDate, BandName;
  
  SELECT 
    p.PerformanceID,
    b.BandName,
    p.Stage,
    p.PerformanceDate,
    COUNT(t.TicketID) AS TotalTicketsSold,
    SUM(t.Price) AS TotalRevenue,
    GROUP_CONCAT(DISTINCT CONCAT(COALESCE(s.SongTitle, ''), ' (', COALESCE(s.Duration, ''), ')') ORDER BY s.SongTitle SEPARATOR ', ') AS SongsPerformed,
    GROUP_CONCAT(DISTINCT CONCAT(COALESCE(f.FirstName, ''), ' ', COALESCE(f.LastName, '')) ORDER BY f.LastName SEPARATOR ', ') AS Fans
FROM 
    Performances p
INNER JOIN 
    Bands b ON p.BandID = b.BandID
INNER JOIN 
    Tickets t ON p.PerformanceID = t.PerformanceID
LEFT JOIN 
    TicketSales ts ON t.TicketID = ts.TicketID
LEFT JOIN 
    Fans f ON ts.FanID = f.FanID
LEFT JOIN 
    Albums a ON b.BandID = a.BandID
LEFT JOIN 
    Songs s ON a.AlbumID = s.AlbumID
GROUP BY 
    p.PerformanceID, b.BandName, p.Stage, p.PerformanceDate
ORDER BY 
    p.PerformanceDate, b.BandName;

WITH LatestPerformance AS (
    SELECT p.BandID, p.Stage, p.PerformanceDate, p.PerformanceID
    FROM Performances p
    WHERE p.PerformanceDate = (
        SELECT MAX(PerformanceDate)
        FROM Performances
        WHERE BandID = p.BandID
    )
),
BandAlbums AS (
    SELECT b.BandID, b.BandName, a.AlbumName, s.SongTitle
    FROM Bands b
    INNER JOIN Albums a ON b.BandID = a.BandID
    INNER JOIN Songs s ON a.AlbumID = s.AlbumID
)
SELECT ba.BandName, ba.AlbumName, ba.SongTitle, lp.Stage, lp.PerformanceDate
FROM BandAlbums ba
INNER JOIN LatestPerformance lp ON ba.BandID = lp.BandID;


