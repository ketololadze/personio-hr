-- Calculate the total days taken off by employees, grouped by Branch, Team, and Type of Paid Time Off

USE PersonioHR;

SELECT 
    Employee.BranchID,
    Employee.TeamID,
    TimeOffRequests.TypeTO AS LeaveType,
    SUM(DATEDIFF(TimeOffRequests.EndDate, TimeOffRequests.StartDate) + 1) AS TotalTimeOffDays
FROM 
    TimeOffRequests
JOIN 
    Employee ON TimeOffRequests.EmployeeID = Employee.EmployeeID
WHERE 
    Employee.BranchID IS NOT NULL 
    AND Employee.TeamID IS NOT NULL 
    AND TimeOffRequests.TypeTO IS NOT NULL 
GROUP BY 
    Employee.BranchID, Employee.TeamID, TimeOffRequests.TypeTO;
