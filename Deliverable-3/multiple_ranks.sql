USE PersonioHR

-- Calculate the days requested for Time Off, and rank them by requested days in aescending order
--  -  first with skipping the next ranking numbers, and then, with without - use both ranks in the same SELECT

SELECT EmployeeID, StartDate, EndDate, TypeTO, 
DATEDIFF(EndDate, StartDate) AS RequestedDays,
rank() OVER (ORDER BY DATEDIFF(EndDate, StartDate)) as RD_rank,
dense_rank() OVER (ORDER BY DATEDIFF(EndDate, StartDate)) as RD_dense_rank
FROM TimeOffRequests;