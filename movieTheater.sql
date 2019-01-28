create schema MovieTheater;
use MovieTheater;

create table screeningRoom( 
  roomID INT PRIMARY KEY AUTO_INCREMENT, 
  seatsNumber INT NOT NULL
  );
  
create table movie( 
  movieID INT PRIMARY KEY, 
  title VARCHAR(50) NOT NULL
  );
  
create table seat( 
  seatID INT PRIMARY KEY AUTO_INCREMENT, 
  rowName VARCHAR(50) NOT NULL,
  roomID INT NOT NULL,
  isReserved BOOLEAN NOT NULL,
  CONSTRAINT seat_fk_screeningRoom
    FOREIGN KEY (roomID)
    REFERENCES screeningRoom (roomID)
  );
  
create table ticket( 
  ticketID INT PRIMARY KEY, 
  roomID INT NOT NULL,
  movieID INT NOT NULL,
  seatID INT NOT NULL,
  CONSTRAINT ticket_fk_screeningRoom
    FOREIGN KEY (roomID)
    REFERENCES screeningRoom (roomID),
  CONSTRAINT ticket_fk_movie
    FOREIGN KEY (movieID)
    REFERENCES movie (movieID),
  CONSTRAINT ticket_fk_seat
    FOREIGN KEY (seatID)
    REFERENCES seat (seatID)
  );
  
create table employee(
  employeeID INT PRIMARY KEY,
  password VARCHAR(50) NOT NULL
  );
  
-- insert rooms and seatnumbers
INSERT INTO screeningRoom VALUES
(1, 25),
(2, 50),
(3, 75),
(4, 100);

-- insert titles into movies
INSERT INTO movie VALUES
(1, 'Title1'),
(2, 'Title2'),
(3, 'Title3'),
(4, 'Title4'),
(5, 'Title5');

-- insert row name into seat
INSERT INTO seat(rowName) VALUES
('A'),
('B'),
('C'),
('D');