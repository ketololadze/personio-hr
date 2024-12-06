-- Calculate the total monthly compensation for each branch, team, and position combination, 
-- along with subtotals by branch, team, and a grand total across all combinations.

SELECT BranchID, TeamID, PositionID, SUM(Salary + COALESCE(Bonus, 0) + COALESCE(Severance, 0)) AS TotalCompensation
FROM Payroll
JOIN Employee ON Payroll.EmployeeID = Employee.EmployeeID
WHERE BranchID IS NOT NULL AND TeamID IS NOT NULL AND PositionID IS NOT NULL
GROUP BY BranchID, TeamID, PositionID;
