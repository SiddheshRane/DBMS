--no prereq required
SELECT course_id, title FROM course WHERE course_id not in (select course_id from prereq);
-- course_id	title
-- BIO-101		Intro. to Biology
-- CS-101		Intro. to Computer Science
-- FIN-201		Investment Banking
-- HIS-351		World History
-- MU-199		Music Video Production
-- PHY-101		Physical Principles



--no bio students
SELECT  `name` FROM student WHERE ID not in  (SELECT ID FROM takes WHERE course_id in (select course_id from course WHERE dept_name = "Biology"));
-- Zhang
-- Shankar
-- Brandt
-- Chavez
-- Peltier
-- Levy
-- Williams
-- Sanchez
-- Snow
-- Brown
-- Aoi
-- Bourikas



--10% hike
UPDATE instructor SET salary = salary  * 1.1;

--reward the Genetics student
UPDATE student SET tot_cred = tot_cred+(select credits FROM course WHERE title="Genetics") WHERE ID in  (SELECT ID FROM takes natural join course WHERE title="Genetics");

--+50k bonus for mentors
UPDATE instructor SET salary = salary + 50000 WHERE ID in (SELECT  i_ID FROM advisor GROUP BY i_ID HAVING count(s_ID) > 1);

--credit=2 for course with <5 students
UPDATE course SET credits = 2 WHERE course_id in (SELECT  course_id FROM takes GROUP BY course_id HAVING count(ID) < 5);

