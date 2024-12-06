
-- Calculate total employee salaries for each previous birthdate, current birthdate, and next birthdate (as shown on the rows)

USE PersonioHR

SELECT EmployeeID, EmployeeName_FirstName, EmployeeName_LastName, Birthday, CurrentSalary, SUM(CurrentSalary) 
OVER (ORDER BY Birthday ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as '3-Birthday Sums'
FROM Employee;