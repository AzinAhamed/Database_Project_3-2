set pagesize 100
set linesize 500

drop table Records;
drop table Events;
drop table Athletes;

Create table Events(
    event_id number(20),
    event_name varchar(50),
    primary key(event_id)
);

Create table Athletes(
    athlete_id number(20),
    athlete_name varchar(50),
    gender varchar(20),
    country varchar(30),
    primary key(athlete_id)
);

Create table Records(
    record_id number(20),
    event_id number(20),
    athlete_id number(20),
    time varchar(50),
    primary key(record_id),
    foreign key (event_id) references Events(event_id),
    foreign key (athlete_id) references Athletes(athlete_id)
);


insert into Events(event_id, event_name)values(1, '100M Sprint');
insert into Events(event_id, event_name)values(2, '200M Sprint');
insert into Events(event_id, event_name)values(3, '400M Sprint');
insert into Events(event_id, event_name)values(4, 'Marathon');


insert into Athletes(athlete_id, athlete_name, gender, country) values(101, 'Usain Bolt', 'Male', 'Jamaica');
insert into Athletes(athlete_id, athlete_name, gender, country) values(102, 'Wayde Van Niekerk', 'Male', 'South Africa');
insert into Athletes(athlete_id, athlete_name, gender, country) values(103, 'Samuel Wanjiro', 'Male', 'Kenya');
insert into Athletes(athlete_id, athlete_name, gender, country) values(104, 'Christian Coleman', 'Male', 'United States');
insert into Athletes(athlete_id, athlete_name, gender, country) values(105, 'Andre De Grasse', 'Male', 'Canada');


insert into Athletes(athlete_id, athlete_name, gender, country) values(201, 'Elaine Thompson Herah', 'Female', 'Jamaica');
insert into Athletes(athlete_id, athlete_name, gender, country) values(202, 'Florence Griffith Joyner', 'Female', 'United States');
insert into Athletes(athlete_id, athlete_name, gender, country) values(203, 'Marie-José Pérec', 'Female', 'France');
insert into Athletes(athlete_id, athlete_name, gender, country) values(204, 'Tiki Gelana', 'Female', 'Ethiopia');
insert into Athletes(athlete_id, athlete_name, gender, country) values(205, 'Shelly-Ann Fraser-Pryce', 'Female', 'Jamaica');


insert into Records(record_id, event_id, athlete_id, time)values(1001, 1, 101, '9.63');
insert into Records(record_id, event_id, athlete_id, time)values(1002, 3, 102, '43.03');
insert into Records(record_id, event_id, athlete_id, time)values(1003, 2, 101, '19.30');
insert into Records(record_id, event_id, athlete_id, time)values(1004, 4, 103, '2:06:32');
insert into Records(record_id, event_id, athlete_id, time)values(1005, 1, 201, '10.61');
insert into Records(record_id, event_id, athlete_id, time)values(1006, 2, 202, '21.34');
insert into Records(record_id, event_id, athlete_id, time)values(1007, 3, 203, '48.25');
insert into Records(record_id, event_id, athlete_id, time)values(1008, 4, 204, '2:23:07');

select * from Events;
select * from Athletes;
select * from Records;


SELECT
    Athletes.athlete_name,
    Athletes.gender,
    Athletes.country,
    Events.event_name,
    Records.time
FROM
    Records
JOIN Events ON Records.event_id = Events.event_id
JOIN Athletes ON Records.athlete_id = Athletes.athlete_id
WHERE
    Athletes.country = 'Jamaica';

SELECT 
    Country,
    Gender,
    count(athlete_id) as athlete_count
FROM
    Athletes
GROUP BY
    Country,
    Gender
ORDER BY
    Country,
    Gender;
    



