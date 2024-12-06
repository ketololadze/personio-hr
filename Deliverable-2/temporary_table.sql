
CREATE TEMPORARY TABLE TempActiveEmployees AS
SELECT 
    e.EmployeeID, 
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    e.Email, 
    e.CurrentSalary, 
    b.BranchName
FROM 
    Employee e
JOIN 
    Branch b ON e.BranchID = b.BranchID
WHERE 
    e.Status = 'Active';


CREATE TEMPORARY TABLE TempOpenPositions AS
SELECT 
    jp.PositionID, 
    jp.PositionName, 
    jp.ExpectedSalary
FROM 
    JobPosition jp
WHERE 
    jp.PositionStatus = 'Open';


CREATE TEMPORARY TABLE TempRecentPayroll AS
SELECT 
    p.EmployeeID, 
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    p.MonthYear, 
    p.Salary, 
    p.Bonus,
    (p.Salary + COALESCE(p.Bonus, 0) + COALESCE(p.Severance, 0)) AS TotalCompensation
FROM 
    Payroll p
JOIN 
    Employee e ON p.EmployeeID = e.EmployeeID
WHERE 
    p.MonthYear >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
AND 
    e.Status = 'Active';


CREATE TEMPORARY TABLE TempTimeOffOverlaps AS
SELECT 
    tor1.EmployeeID AS EmployeeID1,
    tor2.EmployeeID AS EmployeeID2,
    tor1.TypeTO AS LeaveType,
    tor1.StartDate AS StartDate1,
    tor1.EndDate AS EndDate1,
    tor2.StartDate AS StartDate2,
    tor2.EndDate AS EndDate2
FROM 
    TimeOffRequests tor1
JOIN 
    TimeOffRequests tor2 ON tor1.TypeTO = tor2.TypeTO
AND 
    tor1.EmployeeID <> tor2.EmployeeID
WHERE 
    tor1.StartDate <= tor2.EndDate 
AND 
    tor2.StartDate <= tor1.EndDate;


CREATE TEMPORARY TABLE TempEmployeeTeamInfo AS
SELECT 
    e.EmployeeID, 
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    e.PositionID, 
    jp.PositionName, 
    t.TeamID, 
    t.TeamName
FROM 
    Employee e
JOIN 
    JobPosition jp ON e.PositionID = jp.PositionID
JOIN 
    Team t ON e.TeamID = t.TeamID
WHERE 
    e.Status = 'Active';
