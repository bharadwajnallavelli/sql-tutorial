/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
FROM dbo.employee /* Find nth highest salary option 1 */
SELECT top 1 *
FROM
  (SELECT top 3 *
   FROM dbo.employee
   ORDER BY salary DESC) sal_order
ORDER BY salary /* Find nth highest salary option 2 */ WITH employee_cte AS
  (SELECT *,
          DENSE_RANK() OVER (
                             ORDER BY salary DESC) AS Sal_order
   FROM dbo.employee)
SELECT *
FROM employee_cte
WHERE Sal_order = 3
