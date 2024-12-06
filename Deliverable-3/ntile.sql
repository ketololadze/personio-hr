
-- Divide the companies table into 2 equal groups, 3 equal groups, 4 equal groups, 5 equal groups, and 15 equal groups

USE PersonioHR

SELECT CompanyID, CompanyName,
NTILE(2) OVER (ORDER BY CompanyName) as 'Company_Ntile2',
NTILE(3) OVER (ORDER BY CompanyName) as 'Company_Ntile3',
NTILE(4) OVER (ORDER BY CompanyName) as 'Company_Ntile4',
NTILE(5) OVER (ORDER BY CompanyName) as 'Company_Ntile5',
NTILE(15) OVER (ORDER BY CompanyName) as 'Company_Ntile15'
FROM Company;

-- SInce we have 15 companies, it's not equal groups when dividing them by 2 and 4