
SELECT COUNT(*) as total_students, gender FROM students GROUP BY gender;

SELECT 
student_session.id, student_session.class_id,classes.class,students.firstname,count(students.gender),students.category_id  
FROM student_session 
LEFT JOIN students on students.id=student_session.student_id
LEFT JOIN classes on classes.id=student_session.class_id
GROUP BY students.gender,students.category_id,classes.class;


SELECT 
student_session.id, student_session.class_id,classes.class,count(student_session.class_id) as _class,students.gender,count(students.gender) as _gender
FROM student_session 
LEFT JOIN students on students.id=student_session.student_id
LEFT JOIN classes on classes.id=student_session.class_id
GROUP BY  student_session.class_id,students.gender,students.category_id;


SELECT 
student_session.id, student_session.class_id,classes.class
FROM student_session 
LEFT JOIN students on students.id=student_session.student_id
LEFT JOIN classes on classes.id=student_session.class_id
GROUP BY  student_session.class_id ORDER BY classes.class ASC;

SELECT 
student_session.class_id, classes.class,
COUNT(CASE WHEN UPPER(students.gender) = 'MALE' THEN 1 END) male,
COUNT(CASE WHEN UPPER(students.gender) = 'FEMALE' THEN 1 END) female,
COUNT(CASE WHEN UPPER(students.gender) = 'TRANSGENDER' THEN 1 END) transgender, COUNT(student_session.id) as total_student
FROM student_session 
LEFT JOIN students on students.id=student_session.student_id
LEFT JOIN classes on classes.id=student_session.class_id
GROUP BY  student_session.class_id ORDER BY classes.class ASC;



SELECT 
student_session.class_id, classes.class,students.dob,
COUNT(CASE WHEN UPPER(students.gender) = 'MALE' THEN 1 END) male,
COUNT(CASE WHEN UPPER(students.gender) = 'FEMALE' THEN 1 END) female,
COUNT(CASE WHEN UPPER(students.gender) = 'TRANSGENDER' THEN 1 END) transgender, 
COUNT(student_session.id) as total_student
FROM student_session 
LEFT JOIN students on students.id=student_session.student_id
LEFT JOIN classes on classes.id=student_session.class_id 
GROUP BY students.dob,student_session.class_id
ORDER BY  classes.class ASC;


SELECT students.id,students.gender,students.dob,classes.class,categories.category FROM student_session LEFT JOIN students on students.id=student_session.student_id LEFT JOIN classes on classes.id=student_session.class_id LEFT JOIN categories on categories.id=students.category_id;


mysql> SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),YourDateofBirth)), '%Y')+0 AS Age from AgeCalculationFromDatetime;

