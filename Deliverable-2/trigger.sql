
DELIMITER //
CREATE TRIGGER UpdateEmployeeStatusOnTermination
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.TerminationDate IS NOT NULL THEN
        SET NEW.Status = 'Inactive';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER InsertInitialPayrollOnEmployeeAdd
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Payroll (EmployeeID, MonthYear, Salary, PaymentDate, IBAN, Bonus, Severance)
    VALUES (NEW.EmployeeID, DATE_FORMAT(CURDATE(), '%Y-%m-01'), NEW.CurrentSalary, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), NULL, 0, NULL);
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER PreventTimeOffOverlap
BEFORE INSERT ON TimeOffRequests
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT DEFAULT 0;

    SELECT COUNT(*) INTO overlap_count
    FROM TimeOffRequests
    WHERE EmployeeID = NEW.EmployeeID
    AND NEW.StartDate <= EndDate
    AND NEW.EndDate >= StartDate;

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Overlapping time-off request for this employee.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER UpdateRemainingVacationDays
AFTER INSERT ON TimeOffRequests
FOR EACH ROW
BEGIN
    DECLARE days_off INT DEFAULT 0;

    SET days_off = DATEDIFF(NEW.EndDate, NEW.StartDate) + 1;

    IF NEW.TypeTO = 'Vacation' THEN
        UPDATE Employee
        SET RemainingVacationDays = RemainingVacationDays - days_off
        WHERE EmployeeID = NEW.EmployeeID;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER LogSalaryChanges
BEFORE UPDATE ON Payroll
FOR EACH ROW
BEGIN
    IF NEW.Salary <> OLD.Salary THEN
        INSERT INTO PayrollAudit (EmployeeID, ChangeDate, OldSalary, NewSalary)
        VALUES (OLD.EmployeeID, NOW(), OLD.Salary, NEW.Salary);
    END IF;
END;
//
DELIMITER ;
