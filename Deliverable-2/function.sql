
DELIMITER //
CREATE FUNCTION CalculateTotalCompensation (
    empID INT, 
    payMonth DATE
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT (Salary + COALESCE(Bonus, 0) + COALESCE(Severance, 0)) INTO total
    FROM Payroll
    WHERE EmployeeID = empID AND MonthYear = payMonth;

    RETURN total;
END;
//
DELIMITER ;


DELIMITER //
CREATE FUNCTION GetRemainingVacationDays (
    empID INT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE remainingDays INT;

    SELECT RemainingVacationDays INTO remainingDays
    FROM Employee
    WHERE EmployeeID = empID;

    RETURN remainingDays;
END;
//
DELIMITER ;


DELIMITER //
CREATE FUNCTION GetEmployeeFullName (
    empID INT
) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(100);

    SELECT CONCAT(EmployeeName_FirstName, ' ', EmployeeName_LastName) INTO fullName
    FROM Employee
    WHERE EmployeeID = empID;

    RETURN fullName;
END;
//
DELIMITER ;


DELIMITER //
CREATE FUNCTION CheckVacationAvailability (
    empID INT, 
    requestedDays INT
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE remainingDays INT;

    SELECT RemainingVacationDays INTO remainingDays
    FROM Employee
    WHERE EmployeeID = empID;

    RETURN remainingDays >= requestedDays;
END;
//
DELIMITER ;


DELIMITER //
CREATE FUNCTION CountDirectReports (
    managerID INT
) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE reportCount INT;

    SELECT COUNT(*) INTO reportCount
    FROM Employee
    WHERE ManagerEmpID = managerID;

    RETURN reportCount;
END;
//
DELIMITER ;
