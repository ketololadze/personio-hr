
INSERT INTO Company (CompanyID, CompanyName) VALUES
(1, 'Tech Solutions'), (2, 'Innovative Minds'), (3, 'Global Ventures'), (4, 'Eco Products'), (5, 'Green Energy'),
(6, 'SpaceTech'), (7, 'Digital World'), (8, 'NextGen Innovations'), (9, 'SoftWave'), (10, 'SmartSystems'),
(11, 'AgriWorks'), (12, 'UrbanSpaces'), (13, 'HealthPro'), (14, 'EduConnect'), (15, 'RetailVerse');

INSERT INTO Branch (BranchID, BranchName, Country, City, CompanyID) VALUES
(1, 'HQ Berlin', 'Germany', 'Berlin', 1), (2, 'Paris Office', 'France', 'Paris', 2), (3, 'London Branch', 'UK', 'London', 3),
(4, 'New York Office', 'USA', 'New York', 4), (5, 'Tokyo Hub', 'Japan', 'Tokyo', 5), (6, 'Madrid Office', 'Spain', 'Madrid', 6),
(7, 'Toronto Office', 'Canada', 'Toronto', 7), (8, 'Beijing Branch', 'China', 'Beijing', 8), (9, 'Sydney Hub', 'Australia', 'Sydney', 9),
(10, 'Milan Office', 'Italy', 'Milan', 10), (11, 'Dubai Office', 'UAE', 'Dubai', 11), (12, 'Mumbai Office', 'India', 'Mumbai', 12),
(13, 'San Francisco HQ', 'USA', 'San Francisco', 13), (14, 'Los Angeles Branch', 'USA', 'Los Angeles', 14), (15, 'Singapore Office', 'Singapore', 'Singapore', 15);

INSERT INTO Team (TeamID, TeamName) VALUES
(1, 'Engineering'), (2, 'Marketing'), (3, 'Sales'), (4, 'HR'), (5, 'Finance'), (6, 'Operations'), (7, 'Customer Support'),
(8, 'Legal'), (9, 'IT'), (10, 'R&D'), (11, 'Product'), (12, 'Logistics'), (13, 'Compliance'), (14, 'Data Science'), (15, 'Quality Assurance');

INSERT INTO JobPosition (PositionID, PositionName, PositionStatus, ExpectedSalary) VALUES
(1, 'Software Engineer', 'Open', 60000), (2, 'Data Analyst', 'Filled', 55000), (3, 'Product Manager', 'Open', 70000),
(4, 'Marketing Specialist', 'Filled', 45000), (5, 'Sales Executive', 'Open', 50000), (6, 'HR Coordinator', 'Filled', 40000),
(7, 'Finance Manager', 'Open', 65000), (8, 'Operations Lead', 'Filled', 62000), (9, 'Support Agent', 'Open', 35000),
(10, 'Legal Advisor', 'Filled', 75000), (11, 'IT Technician', 'Open', 52000), (12, 'Research Scientist', 'Filled', 80000),
(13, 'UX Designer', 'Open', 67000), (14, 'Logistics Coordinator', 'Filled', 47000), (15, 'Compliance Officer', 'Open', 62000),
(16, 'Customer Success Specialist', 'Open', 45000), (17, 'Backend Developer', 'Filled', 68000), (18, 'Business Analyst', 'Open', 56000),
(19, 'Project Manager', 'Filled', 72000), (20, 'Social Media Manager', 'Open', 49000), (21, 'Data Scientist', 'Open', 85000),
(22, 'DevOps Engineer', 'Filled', 71000), (23, 'HR Manager', 'Open', 62000), (24, 'Network Engineer', 'Filled', 50000),
(25, 'Content Strategist', 'Open', 48000);

INSERT INTO Employee (EmployeeID, EmployeeName_FirstName, EmployeeName_LastName, Birthday, Nationality, Email, PositionID, ManagerEmpID, TeamID, CurrentSalary, BranchID, Status, StartDate, TerminationDate) VALUES
(1, 'Alice', 'Smith', '1980-01-15', 'American', 'alice.smith@example.com', 1, NULL, 1, 60000, 1, 'Active', '2015-05-10', NULL),
(2, 'Bob', 'Brown', '1985-03-22', 'British', 'bob.brown@example.com', 2, 1, 2, 55000, 2, 'Active', '2016-08-25', NULL),
(3, 'Carol', 'Davis', '1990-07-11', 'Canadian', 'carol.davis@example.com', 3, 2, 3, 70000, 3, 'Active', '2017-10-01', NULL),
(4, 'David', 'Miller', '1982-04-17', 'American', 'david.miller@example.com', 4, 3, 4, 45000, 4, 'Active', '2018-02-14', NULL),
(5, 'Eva', 'Wilson', '1995-06-05', 'British', 'eva.wilson@example.com', 5, 4, 5, 50000, 5, 'Active', '2019-12-21', NULL),
(6, 'Frank', 'Garcia', '1978-12-30', 'American', 'frank.garcia@example.com', 6, 5, 6, 40000, 6, 'Active', '2020-07-10', NULL),
(7, 'Grace', 'Martinez', '1983-09-23', 'Canadian', 'grace.martinez@example.com', 6, 1, 7, 65000, 7, 'Active', '2021-05-18', NULL),
(8, 'Henry', 'Lopez', '1989-11-09', 'Spanish', 'henry.lopez@example.com', 8, NULL, 8, 62000, 8, 'Active', '2022-03-22', NULL),
(9, 'Isabel', 'Gonzalez', '1984-08-02', 'Mexican', 'isabel.gonzalez@example.com', 9, 8, 9, 35000, 9, 'Active', '2020-01-10', NULL),
(10, 'Jake', 'Martinez', '1992-12-11', 'Brazilian', 'jake.martinez@example.com', 10, 9, 10, 75000, 10, 'Active', '2019-06-15', NULL),
(11, 'Kelly', 'Taylor', '1981-03-19', 'French', 'kelly.taylor@example.com', 11, NULL, 11, 52000, 11, 'Active', '2020-11-01', NULL),
(12, 'Luke', 'Thomas', '1986-01-07', 'German', 'luke.thomas@example.com', 12, 11, 12, 80000, 12, 'Active', '2018-07-20', NULL),
(13, 'Mia', 'Rodriguez', '1993-05-13', 'Italian', 'mia.rodriguez@example.com', 13, 12, 13, 67000, 13, 'Active', '2021-03-12', NULL),
(14, 'Nick', 'Harris', '1979-10-06', 'American', 'nick.harris@example.com', 14, 13, 14, 47000, 14, 'Active', '2017-01-27', NULL),
(15, 'Olivia', 'Clark', '1991-02-28', 'Australian', 'olivia.clark@example.com', 15, 14, 15, 62000, 15, 'Active', '2019-09-05', NULL);

INSERT INTO Payroll (EmployeeID, MonthYear, Salary, PaymentDate, IBAN, Bonus, Severance) VALUES
(1, '2024-01-01', 60000, '2024-01-31', 'DE89370400440532013000', 500, NULL),
(2, '2024-01-01', 55000, '2024-01-31', 'FR1420041010050500013M02606', 300, NULL),
(3, '2024-01-01', 70000, '2024-01-31', 'GB29NWBK60161331926819', 600, NULL),
(4, '2024-01-01', 45000, '2024-01-31', 'US123456789012345678', 250, NULL),
(5, '2024-01-01', 50000, '2024-01-31', 'JP12000123456789', 400, NULL),
(6, '2024-01-01', 40000, '2024-01-31', 'ES9121000418450200051332', 200, NULL),
(7, '2024-01-01', 65000, '2024-01-31', 'CA987654321012345678', 350, NULL),
(8, '2024-01-01', 62000, '2024-01-31', 'CN41000138010100001369', 450, NULL),
(9, '2024-01-01', 35000, '2024-01-31', 'AU123456789012345678', 100, NULL),
(10, '2024-01-01', 75000, '2024-01-31', 'IT60X0542811101000000123456', 550, NULL),
(11, '2024-01-01', 52000, '2024-01-31', 'AE070331234567890123456', 150, NULL),
(12, '2024-01-01', 80000, '2024-01-31', 'IN070081234567890', 750, NULL),
(13, '2024-01-01', 67000, '2024-01-31', 'US987654321012345678', 500, NULL),
(14, '2024-01-01', 47000, '2024-01-31', 'US765432109876543210', 300, NULL),
(15, '2024-01-01', 62000, '2024-01-31', 'SG123456789012345678', 400, NULL);

INSERT INTO TimeOff (TypeTO, DaysAllowed) VALUES
('Vacation', 20), ('Sick Leave', 15), ('Maternity Leave', 90), ('Paternity Leave', 14), ('Bereavement', 5),
('Jury Duty', 7), ('Military Leave', 30), ('Personal Leave', 10), ('Family Leave', 20), ('Medical Leave', 60),
('Adoption Leave', 120), ('Parental Leave', 40), ('Unpaid Leave', 10), ('Study Leave', 15), ('Relocation Leave', 7);

INSERT INTO TimeOffRequests (EmployeeID, StartDate, EndDate, TypeTO) VALUES
(1, '2024-02-01', '2024-02-10', 'Vacation'), (2, '2024-03-15', '2024-03-20', 'Sick Leave'), 
(3, '2024-04-01', '2024-04-10', 'Vacation'), (4, '2024-05-10', '2024-05-20', 'Maternity Leave'), 
(5, '2024-06-15', '2024-06-25', 'Vacation'), (6, '2024-07-01', '2024-07-10', 'Paternity Leave'), 
(7, '2024-08-20', '2024-08-30', 'Sick Leave'), (8, '2024-09-05', '2024-09-15', 'Personal Leave'), 
(9, '2024-10-10', '2024-10-20', 'Medical Leave'), (10, '2024-11-20', '2024-11-30', 'Vacation'), 
(11, '2024-12-01', '2024-12-10', 'Maternity Leave'), (12, '2025-01-15', '2025-01-25', 'Parental Leave'), 
(13, '2025-02-10', '2025-02-20', 'Bereavement'), (14, '2025-03-25', '2025-03-30', 'Study Leave'), 
(15, '2025-04-15', '2025-04-25', 'Military Leave');



