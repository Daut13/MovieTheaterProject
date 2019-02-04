create schema MovieTheaterOLAP;
use MovieTheaterOLAP;

create table ticket(
	ticketID INT PRIMARY KEY AUTO_INCREMENT
);

create table timeLine(
	timeID INT PRIMARY KEY AUTO_INCREMENT,
    dayNum INT NOT NULL,
    monthNum INT NOT NULL,
    dayText VARCHAR(50) NOT NULL,
    monthText VARCHAR(50) NOT NULL,
    yearNum INT NOT NULL
);

create table movie(
	movieID INT PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(50) NOT NULL,
    #minLength = Length of the movie in minutes
    minLength INT NOT NULL
);

create table ticketSales( 
  saleID INT PRIMARY KEY AUTO_INCREMENT,
  ticketID INT NOT NULL, 
  timeID INT NOT NULL,
  movieID INT NOT NULL,
  #quantity of tickets sold
  quantity INT NOT NULL,
  #price of the tickets
  unitPrice DOUBLE NOT NULL,
  #total = quantity * unitPrice
  total DOUBLE NOT NULL,
  CONSTRAINT ts_fk_ticket
  FOREIGN KEY (ticketID)
  REFERENCES ticket (ticketID),
  CONSTRAINT ts_fk_time
  FOREIGN KEY (timeID)
  REFERENCES timeLine (timeID),
  CONSTRAINT ts_fk_movie
  FOREIGN KEY (movieID)
  REFERENCES movie (movieID)
);



INSERT INTO timeLine(dayNum, monthNum, dayText, monthText, yearNum) VALUES 
#0-6 for day values
#0-11 for month values
#sun-sat
#jan-dec
#2017, 2018, 2019;
(0, 0, "Sunday", "January", 2017),
(1, 1, "Monday", "February", 2017),
(2, 2, "Tuesday", "March", 2017),
(3, 3, "Wednesday", "April", 2017),
(4, 4, "Thursday", "May", 2018),
(5, 5, "Friday", "June", 2018),
(6, 6, "Saturday", "July", 2018),
(1, 7, "Monday", "August", 2018),
(1, 8, "Monday", "September", 2019),
(3, 9, "Wednesday", "October", 2019),
(0, 10, "Sunday", "November", 2019),
(4, 11, "Thursday", "December", 2019);

INSERT INTO movie(genre, minLength) VALUES
#genre
#minute length
("Action", 120),
("Action", 136),
("Comedy", 82),
("Comedy", 105),
("Romance", 90),
("Romance", 75),
("Sci-Fi", 140),
("Sci-Fi", 150),
("Horror", 95),
("Horror", 110)
;

INSERT INTO ticket VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12)
;

INSERT INTO ticketSales(ticketID, timeID, movieID, quantity, unitPrice, total) VALUES
#ticket ID "product"
#time ID 1-12
#movie ID 1-10
#random quantity
#fixed unit price
#total sales
(1, 1, 1, 100, 7.50, 750),
(2, 2, 2, 1000, 7.50, 7500),
(3, 3, 3, 384, 7.50, 2880),
(4, 4, 4, 246, 7.50, 1845),
(5, 5, 5, 861, 7.50, 6457.5),
(6, 6, 6, 543, 7.50, 4072.5),
(7, 7, 7, 679, 7.50, 5092.5),
(8, 8, 8, 165, 7.50, 1237.5),
(9, 9, 9, 908, 7.50, 6810),
(10, 10, 10, 779, 7.50, 5842.5),
(11, 11, 1, 452, 7.50, 3390),
(12, 12, 2, 278, 7.50, 2085)
;
