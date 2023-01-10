CREATE DATABASE sample;

CREATE TABLE Employee ([ID] INT identity(1, 1),
                       [FirstName] Varchar(100),
                       [LastName] Varchar(100),
                       [Country] Varchar(100),)

INSERT INTO dbo.Employee ([FirstName], [LastName], [Country])
VALUES('Raj','Gupta','India'),
      ('Raj','Gupta','India'),
      ('Mohan','Kumar','USA'),
      ('James','Barry','UK'),
      ('James','Barry','UK'),
      ('James','Barry','UK')

SELECT *
FROM dbo.Employee;

/* Option1 to delete duplicates */
DELETE
FROM dbo.employee
WHERE id not in
    (SELECT max(id)
     FROM dbo.employee
     GROUP BY firstname,
              lastname);

/* Option2 to delete duplicates */
with employee_cte as (
select *, Rank() over (partition by firstname, lastname order by id desc) as rank from dbo.employee)
delete from employee_cte where rank > 1;

DROP TABLE dbo.Employee;
