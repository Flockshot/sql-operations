DROP TABLE PlaySession;
DROP TABLE Computer;
DROP TABLE UserSubscription;
DROP TABLE LibraryGame;
DROP TABLE Game;
DROP TABLE Library;
DROP TABLE Subscription;
DROP TABLE Userp;

CREATE TABLE Userp (
	username VARCHAR2(20) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	surname VARCHAR2(20) NOT NULL,
  	email VARCHAR2(30) NOT NULL,
	dob DATE NOT NULL,
	PRIMARY KEY(username)
);

INSERT into Userp(username,name,surname,email,dob) values ('nheinritz0','Nil','Heinritz','nheinritz0@gmail.com',TO_DATE('24/06/1997','DD/MM/YYYY'));
INSERT into Userp(username,name,surname,email,dob) values ('ssolan5','Salim','Sloan','ssolan5@gmail.com',TO_DATE('24/06/1997','DD/MM/YYYY'));
INSERT into Userp(username,name,surname,email,dob) values ('mrozenbaum1','Rozen','Baum','mrozenbaum1@gmail.com',TO_DATE('06/03/1990','DD/MM/YYYY'));
INSERT into Userp(username,name,surname,email,dob) values ('irevie3','David','Irevie','irevie3@gmail.com',TO_DATE('22/05/1998','DD/MM/YYYY'));






CREATE TABLE Subscription (
	subscription_id NUMBER NOT NULL,
	type VARCHAR2(20) NOT NULL,
	monthly_price NUMBER NOT NULL,
  	payment_type VARCHAR2(20) NOT NULL,
	PRIMARY KEY(subscription_id),
  	CHECK (type IN('low','mid','high')),
  	CHECK (payment_type IN('credit-card', 'PayPal', 'bank-transfer')),
  	CHECK (100<monthly_price and monthly_price<1000)
);


INSERT into Subscription(subscription_id,type,monthly_price,payment_type) values(1,'high',450,'credit-card');
INSERT into Subscription(subscription_id,type,monthly_price,payment_type) values(2,'mid',350,'PayPal');
INSERT into Subscription(subscription_id,type,monthly_price,payment_type) values(3,'low',150,'bank-transfer');
INSERT into Subscription(subscription_id,type,monthly_price,payment_type) values(4,'high',450,'credit-card');
INSERT into Subscription(subscription_id,type,monthly_price,payment_type) values(5,'low',450,'credit-card');








CREATE TABLE UserSubscription (
	username VARCHAR2(20) NOT NULL,
	subscription_id  NUMBER NOT NULL,
	start_date DATE NOT NULL,
  	end_date DATE NOT NULL,
	PRIMARY KEY(username,subscription_id),
  	CONSTRAINT fk_us_username FOREIGN KEY (username) REFERENCES Userp(username),
  	CONSTRAINT fk_us_subscription_id FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);


INSERT into UserSubscription(username,subscription_id,start_date,end_date)values('nheinritz0',1,TO_DATE('18.02.2021','DD.MM.YYYY'),TO_DATE('18.10.2021','DD.MM.YYYY'));
INSERT into UserSubscription(username,subscription_id,start_date,end_date)values('ssolan5',2,TO_DATE('23.05.2022','DD.MM.YYYY'),TO_DATE('23.05.2023','DD.MM.YYYY'));
INSERT into UserSubscription(username,subscription_id,start_date,end_date)values('mrozenbaum1',3,TO_DATE('03.12.2022','DD.MM.YYYY'),TO_DATE('03.06.2023','DD.MM.YYYY'));
INSERT into UserSubscription(username,subscription_id,start_date,end_date)values('irevie3',5,TO_DATE('11.04.2021','DD.MM.YYYY'),TO_DATE('31.12.2023','DD.MM.YYYY'));
INSERT into UserSubscription(username,subscription_id,start_date,end_date)values('nheinritz0',4,TO_DATE('19.10.2021','DD.MM.YYYY'),TO_DATE('19.10.2022','DD.MM.YYYY'));




CREATE TABLE Game (
	game_id NUMBER NOT NULL,
	game_name VARCHAR2(40) NOT NULL,
	game_description VARCHAR2(300) NOT NULL,
	PRIMARY KEY(game_id)
);

INSERT into Game(game_id,game_name,game_description)values(1,'God of War: Ragnarok','God of War Ragnarök is an action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment. It was released worldwide on November 9, 2022, for the PlayStation 4 and PlayStation 5, marking the first cross-gen release in the God of War series.');
INSERT into Game(game_id,game_name,game_description)values(2,'Cyberpunk 2077','Cyberpunk 2077 is an action role-playing video game developed by CD Projekt Red and published by CD Projekt. The story takes place in Night City, an open world set in the Cyberpunk universe.');
INSERT into Game(game_id,game_name,game_description)values(3,'Assassins Creed Valhalla','Assassins Creed Valhalla is a 2020 action role-playing video game developed by Ubisoft Montreal and published by Ubisoft. It is the twelfth major installment in the Assassins Creed series, and the successor to 2018s Assassins Creed Odyssey.');
INSERT into Game(game_id,game_name,game_description)values(4,'The Witcher 3: Wild Hunt','The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by CD Projekt. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings and the third game in The Witcher video game series, played in an open world with a third-person perspective.');
INSERT into Game(game_id,game_name,game_description)values(5,'Dont Starve Together','Dont Starve Together is the standalone multiplayer expansion of the uncompromising wilderness survival game, Dont Starve. Now including Reign of Giants; adding new characters, seasons, creatures, biomes, and Giant new challenges to Dont Starve Together.');
INSERT into Game(game_id,game_name,game_description)values(6,'We Were Here Together','Embark on a puzzle solving adventure in which you and a partner must prove you can communicate and work together to escape the haunted Castle Rock.');


CREATE TABLE Library (
	library_connection_token VARCHAR2(40) NOT NULL,
	library_name VARCHAR2(20) NOT NULL,
	username VARCHAR2(20) NOT NULL,
	CHECK (library_name IN('Steam','Epic Games')),
	PRIMARY KEY(library_connection_token),
	CONSTRAINT fk_l_username FOREIGN KEY (username) REFERENCES Userp(username)
);

INSERT into Library(library_connection_token,library_name,username)values('044e61f9d672','Steam','nheinritz0');
INSERT into Library(library_connection_token,library_name,username)values('9f9d8e6173ea','Epic Games','ssolan5');
INSERT into Library(library_connection_token,library_name,username)values('074a94021595','Steam','mrozenbaum1');
INSERT into Library(library_connection_token,library_name,username)values('881cd083a7c2','Steam','irevie3');
INSERT into Library(library_connection_token,library_name,username)values('1e89613783dd','Epic Games','irevie3');



CREATE TABLE LibraryGame (
	library_connection_token VARCHAR2(40) NOT NULL,
	game_id NUMBER NOT NULL,
	PRIMARY KEY(library_connection_token,game_id),
  CONSTRAINT fk_game_id FOREIGN KEY (game_id) REFERENCES Game(game_id),
	CONSTRAINT fk_library_connection_token FOREIGN KEY (library_connection_token) REFERENCES Library(library_connection_token)
);

INSERT into LibraryGame(library_connection_token,game_id)values('044e61f9d672',1);
INSERT into LibraryGame(library_connection_token,game_id)values('044e61f9d672',3);
INSERT into LibraryGame(library_connection_token,game_id)values('044e61f9d672',4);
INSERT into LibraryGame(library_connection_token,game_id)values('9f9d8e6173ea',2);
INSERT into LibraryGame(library_connection_token,game_id)values('074a94021595',5);
INSERT into LibraryGame(library_connection_token,game_id)values('074a94021595',6);
INSERT into LibraryGame(library_connection_token,game_id)values('074a94021595',4);
INSERT into LibraryGame(library_connection_token,game_id)values('1e89613783dd',2);
INSERT into LibraryGame(library_connection_token,game_id)values('1e89613783dd',3);
INSERT into LibraryGame(library_connection_token,game_id)values('881cd083a7c2',1);
INSERT into LibraryGame(library_connection_token,game_id)values('881cd083a7c2',4);

CREATE TABLE Computer(
	id NUMBER NOT NULL,
	price NUMBER NOT NULL,
	cpu VARCHAR2(50) NOT NULL,
	gpu VARCHAR2(30) NOT NULL,
	time_bought DATE NOT NULL,
	maintenance_date DATE NOT NULL,
	PRIMARY KEY(id)
);

INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(1,12000,'AMD Ryzen 3 4100 Processo','Nvdia GTX 1650',TO_DATE('15.03.2021','DD.MM.YYYY'),TO_DATE('21.12.2021','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(2,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(3,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(4,12000,'AMD Ryzen 3 4100 Processo','Nvdia GTX 1650',TO_DATE('15.03.2021','DD.MM.YYYY'),TO_DATE('21.12.2021','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(5,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(6,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(7,12000,'AMD Ryzen 3 4100 Processo','Nvdia GTX 1650',TO_DATE('15.03.2021','DD.MM.YYYY'),TO_DATE('21.12.2021','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(8,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(9,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(10,12000,'AMD Ryzen 3 4100 Processo','Nvdia GTX 1650',TO_DATE('15.03.2021','DD.MM.YYYY'),TO_DATE('21.12.2021','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(11,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(12,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(13,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(14,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(15,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(16,66000,'Intel® Core™ i9-12900K Processor','Nvdia RTX 3090',TO_DATE('06.05.2022','DD.MM.YYYY'),TO_DATE('06.11.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(17,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(18,36000,'Intel® Core™ i7-12700F Processor','Nvdia RTX 3080',TO_DATE('27.01.2022','DD.MM.YYYY'),TO_DATE('30.06.2022','DD.MM.YYYY'));
INSERT into Computer(id,price,cpu,gpu,time_bought,maintenance_date)values(19,12000,'AMD Ryzen 3 4100 Processo','Nvdia GTX 1650',TO_DATE('15.03.2021','DD.MM.YYYY'),TO_DATE('21.12.2021','DD.MM.YYYY'));



CREATE TABLE PlaySession(
	game_id NUMBER NOT NULL,
	computer_id NUMBER NOT NULL,
	library_connection_token VARCHAR2(40) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	PRIMARY KEY(library_connection_token,game_id,computer_id),
	CONSTRAINT fk_ps_game_id FOREIGN KEY (game_id) REFERENCES Game(game_id),
	CONSTRAINT fk_ps_library_connection_token FOREIGN KEY (library_connection_token) REFERENCES Library(library_connection_token),
	CONSTRAINT fk_ps_computer_id FOREIGN KEY (computer_id) REFERENCES Computer(id)
);




INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(1,'044e61f9d672',4,TO_DATE('10.10.2022 13:50','DD.MM.YYYY HH24:Mi'),TO_DATE('10.10.2022 15:50','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(2,'9f9d8e6173ea',2,TO_DATE('08.11.2022 18:36','DD.MM.YYYY HH24:Mi'),TO_DATE('08.11.2022 23:06','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(6,'074a94021595',6,TO_DATE('23.04.2022 09:50','DD.MM.YYYY HH24:Mi'),TO_DATE('23.04.2022 12:53','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(3,'1e89613783dd',3,TO_DATE('18.10.2022 21:38','DD.MM.YYYY HH24:Mi'),TO_DATE('18.10.2022 22:01','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(3,'044e61f9d672',1,TO_DATE('14.10.2022 13:50','DD.MM.YYYY HH24:Mi'),TO_DATE('14.10.2022 15:49','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(2,'9f9d8e6173ea',10,TO_DATE('23.04.2022 09:50','DD.MM.YYYY HH24:Mi'),TO_DATE('23.04.2022 13:53','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(5,'074a94021595',12,TO_DATE('16.10.2022 13:58','DD.MM.YYYY HH24:Mi'),TO_DATE('16.10.2022 15:47','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(4,'881cd083a7c2',8,TO_DATE('13.11.2022 22:10','DD.MM.YYYY HH24:Mi'),TO_DATE('14.11.2022 00:26','DD.MM.YYYY HH24:Mi'));
INSERT into PlaySession(game_id,library_connection_token,computer_id,start_date,end_date)values(4,'044e61f9d672',19,TO_DATE('13.11.2022 22:10','DD.MM.YYYY HH24:Mi'),TO_DATE('14.11.2022 00:26','DD.MM.YYYY HH24:Mi'));
