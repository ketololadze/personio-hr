-- Find the total monthly compensation (salary + bonus + severance) for each combination of position, team, and branch.

USE PersonioHR

SELECT PositionID, TeamID, BranchID, 
SUM(Salary + COALESCE(Bonus, 0) + COALESCE(Severance, 0)) AS TotalCompensation
FROM Payroll
JOIN Employee ON Payroll.EmployeeID = Employee.EmployeeID
GROUP BY PositionID, TeamID, BranchID;
