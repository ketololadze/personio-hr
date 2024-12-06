CREATE DATABASE PersonioHR;
USE PersonioHR;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL
);

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    CompanyID INT,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100)
);

CREATE TABLE JobPosition (
    PositionID INT PRIMARY KEY,
    PositionName VARCHAR(100),
    PositionStatus VARCHAR(50),
    ExpectedSalary DECIMAL(10, 2)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName_FirstName VARCHAR(50),
    EmployeeName_LastName VARCHAR(50),
    Birthday DATE,
    Nationality VARCHAR(50),
    Email VARCHAR(100),
    PositionID INT,
    ManagerEmpID INT,
    TeamID INT,
    CurrentSalary DECIMAL(10, 2),
    BranchID INT,
    Status VARCHAR(50),
    StartDate DATE,
    TerminationDate DATE,
    FOREIGN KEY (ManagerEmpID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (PositionID) REFERENCES JobPosition(PositionID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Payroll (
    EmployeeID INT,
    MonthYear DATE,
    Salary DECIMAL(10, 2),
    PaymentDate DATE,
    IBAN VARCHAR(34),
    Bonus DECIMAL(10, 2),
    Severance DECIMAL(10, 2),
    PRIMARY KEY (EmployeeID, MonthYear),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE TimeOff (
    TypeTO VARCHAR(50) PRIMARY KEY,
    DaysAllowed INT
);

CREATE TABLE TimeOffRequests (
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    TypeTO VARCHAR(50),
    PRIMARY KEY (EmployeeID, StartDate, TypeTO),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TypeTO) REFERENCES TimeOff(TypeTO)

);
