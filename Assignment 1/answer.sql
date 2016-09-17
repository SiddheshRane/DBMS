--University

select name from student where tot_cred > 100;
-- Zang, Chavez, Tanaka

SELECT course_id , grade from takes  WHERE ID = (select ID from student WHERE student.`name`="tanaka");
-- BIO_101	A
-- BIO_301	null

SELECT ID , `name` from instructor where  ID in (select  ID from teaches WHERE course_id in (select  course_id from course where dept_name = "Comp. Sci."));
-- 10101	Srinivasan
-- 45565	Katz
-- 83821	Brandt

SELECT course_id FROM course WHERE course_id in (select s1.course_id  from `section` s1, `section` s2  where (s1.semester="Fall" AND s2.semester="Spring" AND  s1.course_id = s2.course_id) );
-- CS-101

--[Optional]

SELECT `name` from instructor WHERE dept_name="Comp. Sci.";
-- Srinivasan
-- Katz
-- Brandt

SELECT course_id, title from course WHERE course_id in (select course_id from teaches where ID = (select ID from instructor WHERE `name`="Srinivasan") );
-- CS-101	Intro. to Computer Science
-- CS-315	Robotics
-- CS-347	Database System Concepts

SELECT `name` FROM instructor WHERE ID in (select ID from teaches WHERE semester="Spring" And `year`=2009);
-- Brandt
-- Kim

--Railway

SELECT track.stcode1, track.stcode2 FROM track WHERE distance < 20;
-- stcode1	stcode2
-- BYC	DR
-- BYC	KRL
-- CST	BYC
-- CST	DR
-- CST	KRL
-- GRP	TNA

SELECT id FROM trainhalts WHERE timein != timeout AND stcode = (select stcode from station WHERE `name`="THANE");
-- A65
-- KP11

SELECT `name` from train WHERE id in (select id from trainhalts WHERE seqno = 0 AND stcode=(select stcode from station WHERE `name`="MUMBAI") );
-- CST-AMR_LOCAL
-- CST-KYN

SELECT `name` , seqno FROM station, trainhalts WHERE trainhalts.id =(select id from  train WHERE `name`="CST-AMR_LOCAL") and station.stcode = trainhalts.stcode ORDER by seqno;
-- name			seqno
-- MUMBAI		0
-- BYCULLA		1
-- DADAR		2
-- KURLA		3
-- GHATKOPAR	4
-- THANE		5
-- DOMBIVALI	6
-- KALYAN		7
-- AMBARNATH	8

SELECT `name` FROM train WHERE id in (select id FROM trainhalts WHERE seqno < 6 and stcode = (select stcode FROM station WHERE `name`="THANE"));
-- CST-AMR_LOCAL
