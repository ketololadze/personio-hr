-- Calculate the total number of time-off requests and count of unique request types for each branch, along with subtotals by branch.

USE PersonioHR

SELECT BranchID, COUNT(TypeTO) AS TotalRequests, COUNT(DISTINCT TypeTO) AS UniqueRequestTypes
FROM TimeOffRequests
JOIN Employee ON TimeOffRequests.EmployeeID = Employee.EmployeeID
WHERE BranchID IS NOT NULL
GROUP BY BranchID;
