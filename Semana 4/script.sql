-- questao 1

SELECT
    i.ID,
    i.name,
    COUNT(t.course_id) AS "Number of sections"
FROM
    instructor i
LEFT OUTER JOIN
    teaches t ON i.ID = t.ID
GROUP BY
    i.ID, i.name;

-- questao 2

SELECT
    i.ID,
    i.name,
    (
        SELECT COUNT(*)
        FROM teaches t
        WHERE t.ID = i.ID
    ) AS "Number of sections"
FROM
    instructor i;

-- questao 3

SELECT
    s.course_id,
    s.sec_id,
    s.semester,
    s.year,
    COALESCE(i.name, '-') AS instrutor
FROM
    section s
LEFT JOIN teaches t
    ON s.course_id = t.course_id
    AND s.sec_id = t.sec_id
    AND s.semester = t.semester
    AND s.year = t.year
LEFT JOIN instructor i
    ON t.ID = i.ID
WHERE
    s.semester = 'Spring'
    AND s.year = 2010;

-- questao 4

CREATE TABLE grade_points (
    grade VARCHAR(2) PRIMARY KEY,
    points FLOAT
);

INSERT INTO grade_points (grade, points) VALUES 
('A+', 4.0),
('A', 3.7),
('A-', 3.4),
('B+', 3.1),
('B', 2.8),
('B-', 2.5),
('C+', 2.2),
('C', 1.9),
('C-', 1.6),
('D', 1.0),
('F', 0.0);

SELECT 
    student.ID,
    student.name,
    course.title,
    course.dept_name,
    takes.grade,
    grade_points.points,
    course.credits,
    (grade_points.points * course.credits) AS "Pontos totais"
FROM 
    takes
JOIN 
    student ON takes.ID = student.ID
JOIN 
    course ON takes.course_id = course.course_id
JOIN 
    grade_points ON takes.grade = grade_points.grade;

-- questao 5

CREATE VIEW coeficiente_rendimento AS
SELECT 
    student.ID,
    student.name,
    course.title,
    course.dept_name,
    takes.grade,
    grade_points.points,
    course.credits,
    (grade_points.points * course.credits) AS "Pontos totais"
FROM 
    takes
JOIN 
    student ON takes.ID = student.ID
JOIN 
    course ON takes.course_id = course.course_id
JOIN 
    grade_points ON takes.grade = grade_points.grade;

SELECT * FROM coeficiente_rendimento;
