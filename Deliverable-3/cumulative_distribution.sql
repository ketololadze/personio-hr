

-- Calculate the difference between the expected position's salary, and the actual employee's salary, then calculate the cumulative distribution of the
-- Differences, displaying as a decinaml and as a percentage, to show the proportion of employees earning less than or euqal to each specific salary difference

USE PersonioHR

SELECT JobPosition.PositionID, JobPosition.PositionName, Employee.EmployeeName_FirstName, Employee.EmployeeName_LastName, JobPosition.ExpectedSalary, 
Employee.CurrentSalary, (Employee.CurrentSalary - JobPosition.ExpectedSalary) AS SalaryDifference,
ROUND(CUME_DIST() OVER (ORDER BY (Employee.CurrentSalary - JobPosition.ExpectedSalary)), 2) AS 'S_Cume_Dist',
ROUND(ROUND(CUME_DIST() OVER (ORDER BY(Employee.CurrentSalary - JobPosition.ExpectedSalary)), 2)*100, 2) AS 'S_Cume_Dist (%age)'
FROM JobPosition
JOIN Employee ON JobPosition.PositionID = Employee.PositionID;

-- There are was just one difference between the expected and actual salaries, therefore it's showing 'weaker' results