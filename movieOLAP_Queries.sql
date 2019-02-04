#Highest_Grossing_Movie
#Based on month, year
/*
Highest_Grossing_Movie takes the unitPrices and Quantities of each individual movie
and finds the movie with the largest total, and then returns the movieID, the year, month, and the total 
*/
SELECT m.movieID, MAX(ts.unitPrice * ts.quantity) AS maxTotal, tl.yearNum, tl.monthText
FROM ticketSales ts JOIN timeLine tl JOIN movie m
ON ts.movieID = m.movieID and ts.timeID = tl.timeID
GROUP BY m.movieID, tl.yearNum, tl.monthText
ORDER BY maxTotal DESC
LIMIT 1;

#Lowest_Grossing_Movie
#Based on month, year
/*
Lowest_Grossing_Movie takes the unitPrices and Quantities of each individual movie
and finds the movie with the lowest total, and then returns the movieID, the year, month, and the total 
*/
SELECT m.movieID, MIN(ts.unitPrice * ts.quantity) AS minTotal, tl.yearNum, tl.monthText
FROM ticketSales ts JOIN timeLine tl JOIN movie m
ON ts.movieID = m.movieID and ts.timeID = tl.timeID
GROUP BY m.movieID, tl.yearNum, tl.monthText
ORDER BY minTotal
LIMIT 1;

#Genre_Quantity_Sold
/*
This query takes the total from each genre, and adds them together in a clean view
*/
SELECT m.genre, SUM(ts.total) AS total
FROM ticketSales ts JOIN movie m
ON ts.movieID = m.movieID
GROUP BY m.genre;

#Total_By_Day
/*
This query takes the total from each day, and adds them together in a clean view
*/
SELECT tl.dayText, SUM(ts.total) AS total
FROM ticketSales ts JOIN timeLine tl
ON ts.timeID = tl.timeID
GROUP BY tl.dayText;

#minLength = Length of the movie in minutes
/*
This query takes all the times as well as the total and length of the movie in minutes
it also makes a view so that you can check to see against the length of the movie for how well the 
movie did in total sales, as well as it's quantity of tickets
*/
CREATE VIEW Minute_Length_Sold as
SELECT m.minLength as "Minute Length", ts.quantity, ts.total, tl.dayText as day, tl.monthText as month, tl.yearNum as year
FROM ticketSales ts JOIN timeLine tl JOIN movie m
ON ts.movieID = m.movieID AND ts.timeID = tl.timeID
GROUP BY tl.yearNum, tl.monthText, tl.dayText, ts.quantity, ts.total
ORDER BY minLength DESC;