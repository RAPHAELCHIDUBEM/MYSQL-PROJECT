-- EXPLORATORY DATA ANALYSIS ON STUDENTS PERFORMANCE DATA

-- EXPLORING THE TABLE

SELECT *
FROM student_performance;


-- STUDENT THAT HAS THE HIGHIEST GRADE
SELECT StudentID , Age, Gender, GPA, GradeClass
FROM student_performance
WHERE GPA > '3.99';

-- THE TOTAL HOURS ABSENT BY ETHNICITY
SELECT Ethnicity AS Ethnicity, sum(Absences) as total_days_absent
FROM student_performance
group by Ethnicity;

-- TOTAL DAYS ABSENCES BY GENDER 
SELECT Gender as gender, sum(Absences) as total_days_absences
FROM student_performance
GROUP BY Gender;

-- THE IMPACT OF PARENTAL SUPPORT ON STUDENT'S GPA
SELECT count(StudentID) as Student_Count , min(ParentalSupport) as Min_Parent_Support , Avg(GPA) as Avg_GPA
FROM student_performance
group by Gender;


# GROUP AGE BY THREE DIFF. GROUPS, AGREGATE BY DAYS ABSENT,AGE GROUP WITH THE HIGHIEST STUDY TIME WEEKLY
# this can by done by 'using case functions', this allows you to create categories or groups like teenager, young , old etc


SELECT StudentID, ParentalSupport, Age, GPA,
CASE
	WHEN Age <= 15 THEN 'Child'
    WHEN Age BETWEEN 16 AND 17 THEN 'Teenager'
    WHEN Age > 17 THEN 'Young Adult'
END AS Age_group
from Student_performance
;




SELECT  sum(StudyTimeWeekly) as Study_Time, 
CASE
	WHEN Age <= 15 THEN 'Child'
    WHEN Age BETWEEN 16 AND 17 THEN 'Teenager'
    WHEN Age > 17 THEN 'Young Adult'
END AS Age_group
from Student_performance
group by Age
;

