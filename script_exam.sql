DROP table IF EXISTS pets;

DROP table IF EXISTS packAnimals;

DROP table IF EXISTS animals;

create table animals(
id int auto_increment primary key,
name varchar(65)
);

insert into animals (name) values 
('Pets'),
('PackAnimals');

create table pets(
p_id int auto_increment primary key,
name varchar(65),
type varchar(20),
birthdate varchar(15),
commands varchar(30),
animalsID int,
foreign key (animalsID) references animals(id)
);

insert into pets (name, type, birthdate, commands) values 
('Nils', 'dog', '2022-09-09', 'Sit, Stay, Fetch'),
('Julick', 'dog', '2019-01-01', 'Sit, Stay, Bark'),
('Barsik', 'dog', '2021-09-03', 'Roll,Sit, Paw, Bark'),
('Frank', 'hamster', '2023-10-09', 'Roll, Hide'),
('Uni', 'hamster', '2022-02-28', 'Roll, Spin'),
('Mary', 'cat', '2022-02-19', 'Meow, Scratch, Jump'),
('Oliver', 'cat', '2021-08-05', 'Meow, Scratch, Jump'),
('Ayron', 'cat', '2010-06-15', 'Sit, Pounce');

UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '1');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '2');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '3');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '4');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '5');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '6');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '7');
UPDATE `humanfriends`.`pets` SET `animalsID` = '1' WHERE (`p_id` = '8');



create table packAnimals(
p_id int auto_increment primary key,
name varchar(65),
type varchar(20),
birthdate varchar(15),
commands varchar(30),
animalsID int,
foreign key (animalsID) references animals(id)
);

insert into packAnimals (name, type, birthdate, commands) values 
('Nik', 'horse', '2022-09-09', 'Trot, Canter, Gallop'),
('Abbat', 'donkey', '2022-03-10', 'Walk, Carry Load, Bray'),
('Lila', 'camel', '2019-05-20', 'Walk, Sit'),
('Alick', 'horse', '2023-01-01', 'Canter, Gallop'),
('Baseon', 'horse', '2020-09-03', 'Trot, Canter'),
('Charly', 'camel', '2022-12-02', 'Walk, Run, Sit'),
('Madd', 'donkey', '2022-10-10', 'Walk, Bray, Kick');

UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '1');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '2');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '3');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '4');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '5');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '6');
UPDATE `humanfriends`.`packanimals` SET `animalsID` = '2' WHERE (`p_id` = '7');

DROP table IF EXISTS allAnimals;

create temporary table allAnimals(
p_id int,
name varchar(65),
type varchar(20),
birthdate varchar(15),
commands varchar(30),
animalsID int
);

insert into allAnimals(p_id, name, type, birthdate, commands, animalsID)
select pa.p_id, pa.name, pa.type, pa.birthdate, pa.commands, pa.animalsID  from packAnimals pa
union all  
select pe.p_id, pe.name, pe.type, pe.birthdate, pe.commands, pe.animalsID from pets pe;

select * from allAnimals;

delete from packAnimals
where type ='camel';


DROP table IF EXISTS resultTable;

create temporary table resultTable(
id int auto_increment primary key,
name varchar(65),
type varchar(20),
age varchar(20)
);

insert into resultTable(name, type, age)
select  packAnimals.name, packAnimals.type, 
concat(FLOOR(DATEDIFF(CURDATE(), packAnimals.birthdate) / 365), ' years ', FLOOR((DATEDIFF(CURDATE(), packAnimals.birthdate) % 365) / 30), ' months') AS age
from packAnimals
where  packAnimals.birthdate between '2021-04-01' and '2023-04-01' 
union all select pets.name, pets.type, 
concat(FLOOR(DATEDIFF(CURDATE(), pets.birthdate) / 365), ' years ', FLOOR((DATEDIFF(CURDATE(), pets.birthdate) % 365) / 30), ' months') AS age
from pets 
where pets.birthdate between '2021-04-01' and '2023-04-01';

select * from resultTable
order by age;

select r.id, r.name, r.type, r.age, a.p_id, a.birthdate, a.commands, a.animalsID from allAnimals a 
right join resultTable r on  a.name= r.name
order by a.birthdate desc;