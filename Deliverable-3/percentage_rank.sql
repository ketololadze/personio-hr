USE PersonioHR

-- Calculate relative Bonus for employees from Payroll as a percentage compared to others in the company, rounding the result to three decimal places

SELECT EmployeeID, MonthYear, Salary, PaymentDate, IBAN, Bonus,
ROUND(PERCENT_RANK() OVER (ORDER BY Bonus), 3) as 'Bonus_Percent_Rank',
ROUND(PERCENT_RANK() OVER (ORDER BY Bonus) * 100, 3) as 'Bonus_Percent_Rank (%age)'

FROM Payroll;
