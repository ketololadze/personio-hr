-- 
USE PersonioHR

SELECT TimeOffRequests.EmployeeID, TimeOffRequests.StartDate, TimeOffRequests.EndDate, TimeOffRequests.TypeTO, Team.TeamName, DATEDIFF(TimeOffRequests.EndDate, TimeOffRequests.StartDate),
rank () OVER (PARTITION BY Team.TeamID ORDER BY DATEDIFF(TimeOffRequests.EndDate, TimeOffRequests.StartDate)) as P_rank
FROM TimeOffRequests
JOIN Employee on TimeOffRequests.EmployeeID = Employee.EmployeeID
JOIN Team on Employee.TeamID = Team.TeamID

-- Turns out there were no duplicate teams, therefore P_rank only shows 1 