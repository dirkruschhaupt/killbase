
--create tables
DROP DATABASE killbase;

CREATE DATABASE killbase;

\c killbase;

create table assassins (
  id serial primary key,
  full_name text,
  weapon text,
  age integer,
  price integer,
  rating numeric(2,1),
  kills integer
);
insert into assassins (full_name, weapon, age, price, rating, kills)
  values
  ('Alexander Duggan', 'Sniper rifle', 31, 45, 7.5, 28),
  ('Anton Chigurh', 'Pneumatic bolt gun', 52, 40, 9, 72),
  (null, 'Pistol', 28, 20, 6.5, 35),
  ('Jason Bourne', 'Parkour', 27, 25, 7, 48), ('John Wick', 'Lots of guns', 35, 50, 9.5, 433),
  ('Jules Winnfield', 'Pistol', 26, 15, 6.5, 13), ('Leon', 'Everything', 41, 30, 8.5, 87), ('Nikita Mears', 'Silenced pistols', 28, 30, 7, 32),
  ('Pickle Rick', 'Lasers and office supplies', 60, 0, 8, 24);

create table codenames (
  assassins_id integer references assassins (id),
  name text
);
insert into codenames (assassins_id, name)
  values
  (1, 'The Jackal'),
  (2, 'Old Man'),
  (3, 'Ghost Dog'),
  (5, 'Baba Yaga'),
  (7, 'The Professional'),
  (8, 'Nikita'),
  (8, 'La Femme Nikita'),
  (9, 'Solenya');

Create table targets (
  id serial primary key,
  Name text,
  Location text,
  Photo text,
  Security_level integer
);
insert into targets (Name, Location, Photo, Security_level)
  Values
  ('Butch Coolidge', 'Los Angeles', 'https://goo.gl/LCquZj', 3),
  ('The Jaguar', 'Russian Embassy', 'https://goo.gl/6JWsiv', 9),
  ('Norman Stansfield', 'Manhattan', 'https://i.imgur.com/mdIk33E.jpg', 7),
  ('Santino D''Antonio', 'Continental Hotel', 'https://goo.gl/fUPkYy', 10),
  ('Sonny Volerio', 'Queens', 'https://goo.gl/8DHYUS', 4);

create table clients (
  name text,
  id serial primary key
);
insert into clients (name)
  values
  ('Marcellus Wallace'),
  ('Concreto'),
  ('Mathilda'),
  ('Winston'),
  ('Ray Vargo');

create table contracts (
  id serial primary key,
  target_id integer references targets (id),
  client_id integer references clients (id),
  budget integer,
  completed boolean Not NULL,
  assassins_id integer references assassins (id)
);
insert into contracts (target_id, client_id, budget, completed, assassins_id)
  values
  (1, 1, 40, false, null),
  (2, 2, 70, false, null),
  (3, 3, 35, false, null),
  (4, 4, 25, false, null),
  (5, 5, 10, false, null);

create table assassins_contracts (
  assassins_id integer references assassins (id),
  contract_id integer references contracts (id)
);
insert into assassins_contracts (assassins_id, contract_id)
  values
   (6,1),
   (1,2),
   (5,2),
   (7,3),
   (9,5),
   (6,4),
   (8,3),
   (3,1);

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
select * from assassins;
select * from contracts;
select * from targets;
select * from clients;
select * from codenames;
select * from assassins_contracts;
