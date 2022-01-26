CREATE DATABASE MOVIES_DB

USE MOVIES_DB


CREATE TABLE Genres(
genre_id int primary key identity,
genre_name nvarchar(30),
);


INSERT INTO Genres VALUES ('Action'), ('Comedy'), ('Fantasy'), ('Romance'), ('Thriller');



CREATE TABLE Movies (
movies_id integer primary key identity,
movies_name nvarchar(30),
movies_genre int FOREIGN KEY REFERENCES Genres(genre_id)
);


INSERT INTO Movies VALUES ('No Time To Die', 1),
					   	('One Shot', 1),
						('SECOND ACT', 2),
						('Metropolis', 3),
						('My Sweet Romance', 4),
						('Beauty and the Least', 4),
						('Presumed Dead', 5),
						('Double Cross', 5);



CREATE TABLE Actors(
actor_id integer primary key identity,
actor_name nvarchar(30)
);

INSERT INTO Actors VALUES ('James Bond'), 
							('Scott Adkins'), 
							('Jennifer Lopez'), 
							('Alfred Abel'), 
							('Sung Hoon'), 
							('Ben Banks'), 
							('Sherilyn Fenn'), 
							('Jack Conealy');





CREATE TABLE Halls(
halls_id integer primary key identity,
halls_number integer,
);

INSERT INTO Halls VALUES (101), (102), (103), (104), (105), (106), (107), (108), (109), (110), (111);



CREATE TABLE Sessions(
sessions_id integer primary key identity,
session_time datetime,
session_type nvarchar(30),
halls_id integer FOREIGN KEY REFERENCES Halls(halls_id),
movier_id integer FOREIGN KEY REFERENCES Movies(movies_id)
);



INSERT INTO Sessions VALUES ('2022-02-02', 'night', 1, 5),
							('2022-02-02', 'night', 2, 4),
						  ('2022-05-02', 'morning', 2, 7),
						  ('2022-02-02', 'night', 3, 3),
						  ('2022-02-02', 'night', 4, 5),
						  ('2022-03-02', 'morning', 5, 6),
						  ('2022-05-02', 'morning', 6, 3),
						  ('2022-02-02', 'night', 7, 2),
						  ('2022-02-02', 'night', 8, 9),
						  ('2022-06-02', 'morning', 1, 8);



CREATE TABLE Customers(
customer_id integer primary key identity,
customer_name nvarchar(30)
);


INSERT INTO Customers VALUES ('Hesen Hesenov'), 
							('Anar Gedirov'), 
							('Aydin Huseynov'), 
							('Orkhan Mirzeyev'), 
							('Rashad Jabbarov'), 
							('Asif Abbasov'), 
							('Nurlan Nebiyev'), 
							('Aslan Huseynov'), 
							('Emin Mammadov');



CREATE TABLE Ticket(
ticket_id integer primary key identity,
ticket_price float,
session_id integer FOREIGN KEY REFERENCES Sessions(sessions_id)
);

INSERT INTO Ticket VALUES ('11.00', 1),
						('11.00', 2),  
						('6.00', 3), 
						('15.00', 4), 
						('15.00', 5), 
						('8.00', 6), 
						('6.00', 7), 
						('11.00', 8), 
						('15.00',9), 
						('6.00', 10); 


CREATE TABLE CustomerTickets(
customer_ticket_id integer primary key identity,
customer_id integer FOREIGN KEY REFERENCES Customers(customer_id),
ticket_id integer FOREIGN KEY REFERENCES Ticket(ticket_id)
);


CREATE TABLE MovieActors(
movie_info_id integer primary key identity,
movie_id integer FOREIGN KEY REFERENCES Movies(movies_id),
actor_id integer FOREIGN KEY REFERENCES Actors(actor_id)
);


select * from CustomerTickets

SELECT *FROM CustomerTickets CT JOIN Customers C
ON CT.customer_id = C.customer_id

JOIN Ticket T ON CT.ticket_id=T.ticket_id


Select * from Ticket T

JOIN Sessions S ON T.session_id=S.sessions_id

JOIN Sessions S ON 
