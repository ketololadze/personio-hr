-- Calculate the running total of salaries for each team to monitor the accumulating salary expenses and also 
-- calculate the 3-employee moving average of salaries within each team to see average compensation trends as new employees are added.

USE PersonioHR

SELECT TeamID, EmployeeID, CurrentSalary, 
SUM(CurrentSalary) OVER (PARTITION BY TeamID ORDER BY EmployeeID ROWS UNBOUNDED PRECEDING) AS 'Running Salary Total per Team',
AVG(CurrentSalary) OVER (PARTITION BY TeamID ORDER BY EmployeeID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS '3-Employee Moving Average Salary'
FROM Employee
ORDER BY TeamID, EmployeeID;
