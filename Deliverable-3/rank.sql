USE PersonioHR

-- Rank OPEN Job Positions by Expected Salary, in a way that rank number gets repeated in case of the duplicate values for Expected Salary

SELECT PositionID, PositionName, PositionStatus, ExpectedSalary,
rank() OVER (ORDER BY ExpectedSalary) as ES_rank
FROM JobPosition
WHERE PositionStatus ='Open';

-- As I used rank() and not dense rank(), in the ES_rank column, for the rows that have the same Expected Salary,
-- it's showing one number for all rows with the same value, and skipping the next number E.G. ranking number 9 
