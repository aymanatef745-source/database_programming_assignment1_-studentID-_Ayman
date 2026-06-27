SELECT student_id, score,
       NTILE(3) OVER (ORDER BY score DESC) AS performance_group
FROM Grades;