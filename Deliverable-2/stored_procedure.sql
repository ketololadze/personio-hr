
DELIMITER //
CREATE PROCEDURE AddNewEmployee (
    IN firstName VARCHAR(50), 
    IN lastName VARCHAR(50), 
    IN dob DATE, 
    IN nationality VARCHAR(50), 
    IN email VARCHAR(100), 
    IN positionID INT, 
    IN managerID INT, 
    IN teamID INT, 
    IN salary DECIMAL(10, 2), 
    IN branchID INT, 
    IN status VARCHAR(50), 
    IN startDate DATE
)
BEGIN
    INSERT INTO Employee (
        EmployeeName_FirstName, EmployeeName_LastName, Birthday, Nationality, Email, PositionID, 
        ManagerEmpID, TeamID, CurrentSalary, BranchID, Status, StartDate
    ) VALUES (
        firstName, lastName, dob, nationality, email, positionID, 
        managerID, teamID, salary, branchID, status, startDate
    );

    INSERT INTO Payroll (EmployeeID, MonthYear, Salary, PaymentDate, IBAN, Bonus, Severance)
    VALUES (LAST_INSERT_ID(), DATE_FORMAT(CURDATE(), '%Y-%m-01'), salary, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), NULL, 0, NULL);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary (
    IN empID INT, 
    IN newSalary DECIMAL(10, 2)
)
BEGIN
    DECLARE oldSalary DECIMAL(10, 2);

    SELECT CurrentSalary INTO oldSalary
    FROM Employee
    WHERE EmployeeID = empID;

    UPDATE Employee
    SET CurrentSalary = newSalary
    WHERE EmployeeID = empID;

    INSERT INTO PayrollAudit (EmployeeID, ChangeDate, OldSalary, NewSalary)
    VALUES (empID, NOW(), oldSalary, newSalary);
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetEmployeePayrollSummary (
    IN empID INT
)
BEGIN
    SELECT 
        EmployeeID, 
        MonthYear, 
        Salary, 
        PaymentDate, 
        Bonus, 
        Severance, 
        (Salary + COALESCE(Bonus, 0) + COALESCE(Severance, 0)) AS TotalCompensation
    FROM 
        Payroll
    WHERE 
        EmployeeID = empID
    ORDER BY 
        MonthYear DESC;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AdjustVacationBalance (
    IN empID INT, 
    IN daysRequested INT
)
BEGIN
    DECLARE remainingDays INT;

    SELECT RemainingVacationDays INTO remainingDays
    FROM Employee
    WHERE EmployeeID = empID;

    IF remainingDays >= daysRequested THEN
        UPDATE Employee
        SET RemainingVacationDays = RemainingVacationDays - daysRequested
        WHERE EmployeeID = empID;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insufficient vacation days available.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetDirectReports (
    IN managerID INT
)
BEGIN
    SELECT 
        EmployeeID, 
        CONCAT(EmployeeName_FirstName, ' ', EmployeeName_LastName) AS FullName, 
        PositionID, 
        TeamID, 
        CurrentSalary, 
        Status
    FROM 
        Employee
    WHERE 
        ManagerEmpID = managerID
    ORDER BY 
        EmployeeName_LastName, EmployeeName_FirstName;
END;
//
DELIMITER ;
