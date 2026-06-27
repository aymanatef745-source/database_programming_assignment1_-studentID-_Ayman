SELECT student_id, score,
       NTILE(3) OVER (ORDER BY score DESC) AS performance_group
FROM Grades;
-- Query 1: Show all students
SELECT * 
FROM students;
-- Query 2: Join students, grades, and courses
SELECT s.student_name, c.course_name, g.score
FROM students s
JOIN grades g ON s.student_id = g.student_id
JOIN courses c ON g.course_id = c.course_id;
-- Query 3: Average score per course
SELECT c.course_name, AVG(g.score) AS average_score
FROM grades g
JOIN courses c ON g.course_id = c.course_id
GROUP BY c.course_name;
-- Query 4: Students with high scores
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
-- Query 5: Top 5 students by score
SELECT s.name, g.score
FROM students s
JOIN grades g ON s.student_id = g.student_id
ORDER BY g.score DESC
LIMIT 5;
-- Query 6: High performing students using CTE
WITH high_performers AS (
    SELECT student_id, score
    FROM grades
    WHERE score > 85
)
SELECT s.name, hp.score
FROM students s
JOIN high_performers hp ON s.student_id = hp.student_id;
-- Query 7: Rank students by score
SELECT s.name, g.score,
       RANK() OVER (ORDER BY g.score DESC) AS rank_position
FROM students s
JOIN grades g ON s.student_id = g.student_id;
    FROM grades
    WHERE score > 90
);
