USE PersonioHR

-- Rank Filled Job Positions by Expected Salary that is over 50K, 
-- in a way that rank number does NOT get repeated in case of the duplicate values for Expected Salary 

SELECT PositionID, PositionName, PositionStatus, ExpectedSalary,
dense_rank() OVER (ORDER BY ExpectedSalary) as ES_dense_rank
FROM JobPosition
WHERE PositionStatus = 'Filled'
AND ExpectedSalary > 50000;