--create tables
create table assassins (
  id serial primary key,
  full_name text,
  codenames foreign(codenames.id),
  weapon text,
  contact_information text,
  age numeric,
  price numeric,
  rating numeric(3,1),
  kills numeric
);

create table contracts (
  id serial primary key,
  target_name foreign(targets.id),
  Client_name foreign(clients.id),
  budget numeric
  completed boolean Not NULL,
  completed_by foreign(assassins.id)
);

Create table targets (
  id serial primary key,
  Name varchar(30),
  Location varchar(40),
  Photo varchar(40),
  Security_level numeric
);

create table clients (
  name text,
  id serial primary key
);

create table assassins_contracts (
  assassins foreign key,
  contract foreign key
);

create table codenames (
  name varchar(30),
  id serial primary key
);

--inserts

insert into codenames (name) values ('The Jackal'), ('Old Man'), ('Ghost Dog'), ('Baba Yaga'), ('The Professional'), ('Nikita, La Femme Nikita'), ('Solenya');

insert into clients (name) values ('Marcellus Wallace'), ('Concreto'), ('Mathilda'), ('Winston'), ('Ray Vargo');

insert into targets (Name, Location, Photo, Security_level) Values ('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3), ('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9), ('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7), ('Santino D''Antonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10), ('Sonny', 'Queens', 'https://goo.gl/8DHYUS', 4);

insert into contracts (target_name, Client_name, budget) values (1, 1, 40), (2, 2, 70), (3, 3, 35), (4, 4, 25), (5, 5, 10);

insert into assassins (full_name, codenames, weapon, age, price, rating, kills) values ('Alexander Duggan', 1,'Sniper rifle', 31, 45, 7.5, 28), ('Anton Chigurh', 2,'Pneumatic bolt gun', 52, 40, 9, 72), (3, 'Pistol', 28, 20, 6.5, 35), ('Jason Bourne', 'Parkour', 27, 25, 7, 4), ('John Wick', 4, 'Lots of guns', 35, 50, 9.5, 433), ('Jules Winnfield', 'Pistol', 26, 15, 6.5, 13), ('Leon', 5, 'Everything', 41, 30, 8.5, 87), ('Nikita Mears', 6, 'Silenced pistols', 28, 30, 7, 32), ('Pickle Rick', 7, 'Lasers and office supplies', 60, 0, 8, 24);

insert into assassins_contracts (assassins, contract) values (6,1), (1,2), (5,2), (7,3), (9,5), (6,4), (8,3), (3,1);

--questions
--1 Select all the assassins, sorted by number of kills.
select * from assassins order by kills desc;

--2 Select all of the assassins older than 30 years old.
select * from assassins where age > 30;

--3 Select all of the contracts that can afford to pay Nikita Mears. (Budget >= her price)
select

--4 Count the number of assassins that are capable of taking out Norman Stansfield. (Their rating >= his security level)

--5 Get the total amount it would require to hire every available assassin.

--6 Assign the following jobs to these assassins:

--7 Count the number of currently contracted assassins.

--8 Find the lowest total cost to complete all assigned contracts.

--9 Add a new contract: Snake Plissken, New York, (find a photo), security 5, budget 35, Client is Marcellus Wallace.

--10 Assign all assassins with a rate lower than the cost of the new contract to the new contract.

--11 Complete these contracts: The Jaguar, by the Jackal; Butch Coolidge, by Ghost Dog; Snake Plissken, by Nikita Mears. (Be sure to increment the number of kills!)

--12 Select all the completed contracts, showing only the assassins to be paid, and the amount paid to them. Then show the total cost of the completed contracts.

--13 The Jackal has retired. Remove him from the database. (How can we do this while maintaining integrity on the contracts table?)

--14 Ghost Dog and Nikita Mears have increased their rates by 5 and 10, respectively. Update their entries to reflect this.

--15 The contract on Norman Stansfield has been rescinded. Remove it (and any associated data) from the database.

--16 Winston has taken out a contract on John Wick! (Security 9, budget 100) We may have to rethink the way we're structuring our data. How can we refactor our database schema to allow a person to be an assassin, a client, or the target of a contract? Do that, then assign all assassins not already on a job to this new contract.
