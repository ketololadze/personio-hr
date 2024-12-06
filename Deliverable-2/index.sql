CREATE INDEX idx_employee_position ON Employee (PositionID);

CREATE INDEX idx_employee_branch ON Employee (BranchID);

CREATE INDEX idx_employee_manager ON Employee (ManagerEmpID);

CREATE INDEX idx_payroll_employee_date ON Payroll (EmployeeID, MonthYear);

CREATE INDEX idx_employee_team ON Employee (TeamID);

CREATE INDEX idx_timeoffrequests_type ON TimeOffRequests (TypeTO);

CREATE INDEX idx_job_position_status ON JobPosition (PositionStatus);

CREATE INDEX idx_teams_name ON Team (TeamID, TeamName);