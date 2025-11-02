DROP TABLE GroupMembers;
DROP TABLE Post;
DROP TABLE GroupInfo;
DROP TABLE AssessmentTaken;
DROP TABLE ConnectionList;
DROP TABLE Assessment;
DROP TABLE Member;
DROP TABLE Company;



CREATE TABLE Company (
	company_id VARCHAR2(20) NOT NULL,
	companyname VARCHAR2(30) NOT NULL,
	address VARCHAR2(100) NOT NULL,
	companytel NUMBER NOT NULL,
	PRIMARY KEY(company_id)
);

CREATE TABLE Member(  
    member_id VARCHAR2(20) NOT NULL,  
    email VARCHAR2(40) NOT NULL,  
    company_id VARCHAR2(20) NOT NULL,  
    name VARCHAR2(20) NOT NULL,  
    surname VARCHAR2(20) NOT NULL,  
    username VARCHAR2(20) NOT NULL,
    password VARCHAR2(15) NOT NULL,
    tel NUMBER NOT NULL,  
    gender VARCHAR2(10) NOT NULL,  
    country VARCHAR2(20) NOT NULL,  
    PRIMARY KEY (member_ID),  
    CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

CREATE TABLE Assessment(
    assessment_id VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    asses_level VARCHAR2(10),
    PRIMARY KEY(assessment_id)
);

CREATE TABLE AssessmentTaken(
    assessment_id VARCHAR2(20) NOT NULL,
    member_id VARCHAR2(20) NOT NULL,
    asses_date DATE NOT NULL,
    status VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_assessment FOREIGN KEY (assessment_id) REFERENCES Assessment(assessment_id),  
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES Member(member_id),
    PRIMARY KEY(assessment_id, member_id, asses_date)
);



CREATE TABLE ConnectionList(
    member_id VARCHAR2(20) NOT NULL,
    connection_member_id VARCHAR2(20) NOT NULL,
    status VARCHAR2(10),
    connectiondate DATE,
    CONSTRAINT fk_member_to FOREIGN KEY (member_id) REFERENCES Member(member_id),
    CONSTRAINT fk_connection FOREIGN KEY (connection_member_id) REFERENCES Member(member_id),
    PRIMARY KEY(member_id, connection_member_id)
);

CREATE TABLE GroupInfo(
    group_id VARCHAR2(20) NOT NULL,
    group_name VARCHAR2(20) NOT NULL,
    description VARCHAR2(300),
    group_type VARCHAR2(10) NOT NULL,
    manager_id VARCHAR2(20) NOT NULL,
    created_by VARCHAR2(20) NOT NULL,
    creation_date DATE NOT NULL,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES Member(member_id),
    CONSTRAINT fk_created FOREIGN KEY (created_by) REFERENCES Member(member_id),
    PRIMARY KEY(group_id)
);

CREATE TABLE Post(
    post_id VARCHAR2(20) NOT NULL,
    post_date DATE NOT NULL,
    title VARCHAR2(50) ,
    content VARCHAR2(200),
    posted_by VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_posted FOREIGN KEY (posted_by) REFERENCES Member(member_id),
    PRIMARY KEY(post_id)
);


CREATE TABLE GroupMembers(
    group_id VARCHAR2(20) NOT NULL,
    member_id VARCHAR2(20) NOT NULL,
    status VARCHAR2(20),
    join_date DATE NOT NULL,
    CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES GroupInfo(group_id),
    CONSTRAINT fk_group_member FOREIGN KEY (member_id) REFERENCES Member(member_id),
    PRIMARY KEY(group_id, member_id)
);



--Company
Insert into Company (company_id,companyname,address,companytel) values ('122430255','Jamia', '440 Maywood Avenue','7546477439');
Insert into Company (company_id,companyname,address,companytel) values ('591715612','Youtags', '343 Maywood Lane','8549956307');
Insert into Company (company_id,companyname,address,companytel) values ('691715612','Tambee', '522 Coleman Center','5873115231');
Insert into Company (company_id,companyname,address,companytel) values ('933014021','Curiosity', '6838 Tennessee Parkway','9849956307');


--Member
Insert into Member(member_id,company_id,name,surname,email,username,password,tel,gender,country) values ('4094','933014021', 'Lesley','Glison','lglison0@merriam-webster.com','lglison0','gsl9ZZKKMTN9','3157117898','Female','Sweden');
Insert into Member(member_id,company_id,name,surname,email,username,password,tel,gender,country) values ('1333','591715612', 'Teddy','Studdeard	','tstuddeard6@theglobeandmail.com','tstuddeard6','tstuddeard6','4374040869','Male','Iran');
Insert into Member(member_id,company_id,name,surname,email,username,password,tel,gender,country) values ('9888','691715612', 'Gale','Etty','getty7@technorati.com','getty7','Szh2hf0N4Fod','2594272038','Female','Poland');
Insert into Member(member_id,company_id,name,surname,email,username,password,tel,gender,country) values ('7324','933014021', 'Katti','Broggini','kbroggini8@photobucket.com','kbroggini8','0f35nC6','9195006297','Female','Brazil');
Insert into Member(member_id,company_id,name,surname,email,username,password,tel,gender,country) values ('3088','122430255', 'Yeliz','Yesilada','yyeliz@metu.edu.tr','YelizYesilada','gNSZNQa','5905773542','Female','Cyprus');
   

--ConnectionList   
Insert into ConnectionList (member_id, connection_member_id, status, connectiondate) values ('3088','4094', 'accepted', TO_DATE ('05/04/2019', 'DD/MM/YYYY')); 
Insert into ConnectionList (member_id, connection_member_id, status, connectiondate) values ('9888','4094', 'pending', TO_DATE ('15/03/2019', 'DD/MM/YYYY'));
Insert into ConnectionList (member_id, connection_member_id, status, connectiondate) values ('9888', '7324', 'rejected', TO_DATE ('25/06/2019', 'DD/MM/YYYY'));
Insert into ConnectionList (member_id, connection_member_id, status, connectiondate) values ('3088', '7324', 'accepted', TO_DATE ('30/07/2019', 'DD/MM/YYYY'));
Insert into ConnectionList (member_id, connection_member_id, status, connectiondate) values ('1333', '7324', 'accepted', TO_DATE ('12/08/2019', 'DD/MM/YYYY'));
 
 
--GroupInfo 
Insert into GroupInfo(group_id, manager_id, created_by, group_name, description, group_type,creation_date) values ('20391', '7324', '7324', 'Art', 'The aim of the artistic initiatives was and still is to get in touch with other artists.', 'Standard',TO_DATE ('13/08/2022', 'DD/MM/YYYY'));
Insert into GroupInfo(group_id, manager_id, created_by, group_name, description, group_type,creation_date) values ('30192', '7324', '1333', 'Travel', 'Group travel refers to any organized, multi-day trip that you pre-book and meet a group of other travelers who booked the same trip.', 'Standard',TO_DATE ('1/11/2022', 'DD/MM/YYYY'));
Insert into GroupInfo(group_id, manager_id, created_by, group_name, description, group_type,creation_date) values ('40293', '3088', '9888', 'Programming', 'Meet local computer programmers. Share ideas, advice and experiences with others to improve your skills!', 'Standard',TO_DATE ('12/07/2010', 'DD/MM/YYYY'));
Insert into GroupInfo(group_id, manager_id, created_by, group_name, description, group_type,creation_date) values ('50394', '7324', '1333', 'Education', 'Education Group provides school workshops, school assembly resources, after-school clubs and fundraising ideas for schools in England and Wales.', 'Unlisted',TO_DATE ('13/06/2016', 'DD/MM/YYYY'));
Insert into GroupInfo(group_id, manager_id, created_by, group_name, description, group_type,creation_date) values ('60495', '4094', '7324', 'Next Sports', 'We are a sports based digital media platform that uses reward points to drive consumer behaviour.', 'Unlisted',TO_DATE ('14/09/2022', 'DD/MM/YYYY'));


--Post
Insert into Post(post_id, post_date, title, content, posted_by) values ('111', TO_DATE('05/04/2019', 'DD/MM/YYYY'), 'Winning', 'If winning is not everything...why do we keep score?', '4094');
Insert into Post(post_id, post_date, title, content, posted_by) values ('121', TO_DATE('05/04/2019', 'DD/MM/YYYY'), 'C programming tournament', 'This tournament is a timed contest where all participants compete online to solve the same problems under the same time constraints.', '3088');
Insert into Post(post_id, post_date, title, content, posted_by) values ('131', TO_DATE('05/04/2019', 'DD/MM/YYYY'), 'Jave programming codeGO', 'This competition where all contest fosters creativity, teamwork, and innovation in building new software programs, and enables students to test their ability to perform under pressure.', '7324');


--GroupMembers
Insert into GroupMembers (group_id,member_id, status, join_date) values ('20391','4094', 'Active', TO_DATE ('05/04/2020', 'DD/MM/YYYY'));
Insert into GroupMembers (group_id,member_id, status, join_date) values ('30192','9888', 'Passive', TO_DATE ('15/05/2020', 'DD/MM/YYYY'));
Insert into GroupMembers (group_id,member_id, status, join_date) values ('40293','3088', 'Passive ', TO_DATE ('25/06/2020', 'DD/MM/YYYY'));
Insert into GroupMembers (group_id,member_id, status, join_date) values ('50394','7324', 'Passive' , TO_DATE ('13/07/2020', 'DD/MM/YYYY'));
Insert into GroupMembers (group_id,member_id, status, join_date) values ('60495','4094', 'Active', TO_DATE ('06/04/2020', 'DD/MM/YYYY'));

--Assessment
Insert into Assessment(assessment_id, name, asses_level) values ('1', 'Introduction to Phyton', 'Beginner');
Insert into Assessment(assessment_id, name, asses_level) values ('2', 'Introduction to C','Beginner');
Insert into Assessment(assessment_id, name, asses_level) values ('3', 'Introduction to Java','Expert');


--AssessmentTaken
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('1','1333', 'Pass', TO_DATE ('08/07/2022', 'DD/MM/YYYY'));
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('1','1333', 'Fail', TO_DATE ('06/07/2022', 'DD/MM/YYYY'));
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('1','1333', 'Fail', TO_DATE ('06/06/2022', 'DD/MM/YYYY'));
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('2','4094', 'Fail', TO_DATE ('09/04/2021', 'DD/MM/YYYY'));
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('3','9888', 'Fail', TO_DATE ('10/08/2021', 'DD/MM/YYYY'));
Insert into AssessmentTaken(assessment_id,member_id, status, asses_date) values ('2','4094', 'Pass', TO_DATE ('06/10/2021', 'DD/MM/YYYY'));
Insert into AssessmentTaken (assessment_id,member_id, status, asses_date) values ('1','7324', 'Fail', TO_DATE ('06/09/2021', 'DD/MM/YYYY'));

