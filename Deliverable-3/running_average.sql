
-- Calulate average bonus for employees, for each previous branch, current branch (on the row) and the next branch - order by ASC branchID

USE PersonioHR

SELECT Payroll.EmployeeID, Payroll.MonthYear, Payroll.Salary, Employee.BranchID, Payroll.Bonus, AVG(Payroll.Bonus)
OVER (ORDER BY Employee.BranchID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as '3-Branch Averages'
FROM Payroll
JOIN Employee on Payroll.EmployeeID = Employee.EmployeeID
JOIN Branch on Employee.BranchID = Branch.BranchID
;

