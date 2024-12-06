
CREATE VIEW EmployeeDetails AS
SELECT 
    e.EmployeeID, 
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    e.Email,
    e.CurrentSalary,
    jp.PositionName AS JobPosition,
    t.TeamName AS Team,
    b.BranchName AS Branch,
    c.CompanyName AS Company,
    e.Status,
    e.StartDate,
    e.TerminationDate
FROM 
    Employee e
JOIN 
    JobPosition jp ON e.PositionID = jp.PositionID
JOIN 
    Team t ON e.TeamID = t.TeamID
JOIN 
    Branch b ON e.BranchID = b.BranchID
JOIN 
    Company c ON b.CompanyID = c.CompanyID;

CREATE VIEW PayrollSummary AS
SELECT 
    e.EmployeeID,
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    SUM(p.Salary + COALESCE(p.Bonus, 0)) AS TotalCompensation,
    COUNT(p.MonthYear) AS MonthsWorked
FROM 
    Payroll p
JOIN 
    Employee e ON p.EmployeeID = e.EmployeeID
GROUP BY 
    e.EmployeeID, FullName;

CREATE VIEW PositionAvailability AS
SELECT 
    jp.PositionID, 
    jp.PositionName, 
    jp.PositionStatus, 
    jp.ExpectedSalary,
    CASE 
        WHEN jp.PositionStatus = 'Filled' THEN 'Occupied'
        ELSE 'Vacant'
    END AS Availability
FROM 
    JobPosition jp;

CREATE VIEW EmployeeTimeOffRequests AS
SELECT 
    e.EmployeeID, 
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS FullName,
    tor.StartDate, 
    tor.EndDate, 
    tor.TypeTO AS LeaveType,
    toff.DaysAllowed AS AllowedDays
FROM 
    TimeOffRequests tor
JOIN 
    Employee e ON tor.EmployeeID = e.EmployeeID
JOIN 
    TimeOff toff ON tor.TypeTO = toff.TypeTO;

CREATE VIEW ManagerDirectReports AS
SELECT 
    m.EmployeeID AS ManagerID,
    CONCAT(m.EmployeeName_FirstName, ' ', m.EmployeeName_LastName) AS ManagerName,
    e.EmployeeID AS EmployeeID,
    CONCAT(e.EmployeeName_FirstName, ' ', e.EmployeeName_LastName) AS EmployeeName,
    e.PositionID AS EmployeePositionID
FROM 
    Employee e
JOIN 
    Employee m ON e.ManagerEmpID = m.EmployeeID;
