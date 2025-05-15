CREATE PROCEDURE dbo.student_grade_points (
    @grade_point VARCHAR(2)
)
AS
BEGIN
    SELECT
        s.name AS Nome_estudante,
        s.dept_name AS Dept_estudante,
        c.title AS Titulo_curso,
        c.dept_name AS Dept_curso,
        sec.semester AS Semestre,
        sec.year AS Ano,
        t.grade AS Pontuacao_alfanumerica,
        gp.grade_point AS Pontuacao_numerica
    FROM student s
    JOIN takes t ON s.ID = t.ID
    JOIN section sec ON
        t.course_id = sec.course_id AND
        t.sec_id = sec.sec_id AND
        t.semester = sec.semester AND
        t.year = sec.year
    JOIN course c ON t.course_id = c.course_id
    JOIN grade_points gp ON t.grade = gp.letter
    WHERE t.grade = @grade_point;
END;
GO
 
 CREATE FUNCTION dbo.return_instructor_location(
	@instructor_name VARCHAR(50)
)
RETURNS TABLE
AS RETURN (
     SELECT
        i.name AS Nome_Instrutor,
        c.title AS Curso,
        s.semester AS Semestre,
        s.year AS Ano,
        s.building AS Predio,
        s.room_number AS Sala
    FROM instructor i
    JOIN teaches t ON i.ID = t.ID
    JOIN section s ON 
        t.course_id = s.course_id AND
        t.sec_id = s.sec_id AND
        t.semester = s.semester AND
        t.year = s.year
    JOIN course c ON s.course_id = c.course_id
    WHERE i.name = @instructor_name
 )