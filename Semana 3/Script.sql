--questao 1

SELECT student.id, student.name, takes.course_id, takes.grade
FROM student
INNER JOIN takes ON student.id = takes.Id;

--questao 2
SELECT s.ID, s.name, COUNT(t.course_id) AS num_cursos
FROM student AS s
JOIN takes AS t ON s.ID = t.id
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name
ORDER BY num_cursos DESC;

--questao 3

CREATE VIEW civil_eng_students AS
SELECT s.ID, s.name, COUNT(t.course_id) AS num_cursos
FROM student AS s
JOIN takes AS t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name;

SELECT * FROM civil_eng_students ORDER BY num_cursos DESC;
