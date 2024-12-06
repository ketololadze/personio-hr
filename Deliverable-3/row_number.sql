
-- For each employee working at the company 'Global Ventures', 'Eco Products', 'SpaceTech' and 'Green Energy' -
-- calculate the level of seniority based on the days they have been working 
-- in their respective companies, and assign unique row number based on their seniroity level and calculate their rank (Allowing ties)


SELECT Employee.EmployeeID, Employee.EmployeeName_FirstName, Employee.EmployeeName_LastName, DATEDIFF('2024-11-03', Employee.StartDate) AS Days_Since_Start, Company.CompanyName, 
ROW_NUMBER() OVER (ORDER BY DATEDIFF('2024-11-03', Employee.StartDate)) AS Row_Number1, RANK() OVER (ORDER BY DATEDIFF('2024-11-03', Employee.StartDate)) AS STD_Rank
FROM Employee
JOIN Branch ON Branch.BranchID = Employee.BranchID
JOIN Company ON Branch.CompanyID = Company.CompanyID
WHERE Company.CompanyName IN ('Global Ventures', 'Eco Products', 'SpaceTech', 'Green Energy');
