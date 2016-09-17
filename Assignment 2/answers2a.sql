--instructors who never taught
SELECT COUNT(*) FROM instructor WHERE instructor.ID not in (select ID FROM teaches);
-- 3


--capacity of builing
SELECT building, SUM(capacity) as "Capacity" FROM classroom GROUP BY building;
-- Packard	500
-- Painter	10
-- Taylor	70
-- Watson	80


--max teachers for any course
SELECT max(c) from (SELECT count(ID) c, course_id FROM teaches GROUP BY course_id, `year`, semester, sec_id) as profs;
-- 1


--no. of instructors >= 1 in each department
SELECT dept_name, count(ID) as "Number of instructors" from instructor GROUP  BY dept_name ORDER BY count(ID) DESC;
-- Comp. Sci.	3
-- Physics		2
-- Finance		2
-- History		2
-- Music		1
-- Biology		1
-- Elec. Eng.	1

--no. of instructors >= 0 in each department
SELECT dept_name, COUNT(ID) c FROM instructor GROUP  BY dept_name UNION
SELECT dept_name , 0 FROM department WHERE dept_name not in (SELECT dept_name FROM instructor)
ORDER BY c DESC;
-- Comp. Sci.	3
-- Physics		2
-- Finance		2
-- History		2
-- Biology		1
-- Elec. Eng.	1
-- Music		1
-- Aeronautics	0


--total credits
SELECT  `name`, SUM(credits) FROM takes NATURAL JOIN course NATURAL JOIN student WHERE (grade != NULL OR grade !="F")   GROUP BY ID;
-- Zhang	6
-- Shankar	10
-- Brandt	2
-- Chavez	2
-- Peltier	2
-- Williams	6
-- Sanchez	2
-- Brown	6
-- Aoi		2
-- Tanaka	2


--Srinivasan's total students
SELECT COUNT(DISTINCT takes.ID) FROM takes, teaches WHERE takes.course_id=teaches.course_id AND takes.sec_id = teaches.sec_id AND takes.semester = teaches.semester AND teaches.ID = (SELECT ID FROM instructor WHERE `name`="Srinivasan");
-- 6


--[Optional]

--highest paid
SELECT high.name FROM instructor high LEFT JOIN instructor a ON high.dept_name = a.dept_name AND high.salary < a.salary WHERE a.salary is null;
-- Wu
-- Mozart
-- Einstein
-- Katz
-- Califieri
-- Crick
-- Kim

