SELECT
  c.course_id,
  c.course_name,
  c.description,
  e.student_name,
  e.enrollment_date
FROM courses c
LEFT JOIN enrollments e
  ON c.course_id = e.course_id

UNION

-- all enrollments for courses that had no match in courses (to catch “students not registered for any course”)
SELECT
  e.course_id,
  NULL     AS course_name,
  NULL     AS description,
  e.student_name,
  e.enrollment_date
FROM enrollments e
LEFT JOIN courses c
  ON e.course_id = c.course_id
WHERE c.course_id IS NULL

ORDER BY course_id;