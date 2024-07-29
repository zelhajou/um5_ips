---- Creation des tables -------------------------------------------------------
 
create table DEPARTMENT (
       DEPT_ID number(10,0) not null,
       DEPT_NAME varchar2(255 char) not null,
       DEPT_NO varchar2(20 char) not null unique,
       LOCATION varchar2(255 char),
       primary key (DEPT_ID)
   );

create table EMPLOYEE (
       EMP_ID number(19,0) not null,
       EMP_NAME varchar2(50 char) not null,
       EMP_NO varchar2(20 char) not null unique,
       HIRE_DATE date not null,
       IMAGE blob,
       JOB varchar2(30 char) not null,
       SALARY float not null,
       DEPT_ID number(10,0) not null,
       MNG_ID number(19,0),
       primary key (EMP_ID)
   );

create table SALARY_GRADE (
       GRADE number(10,0) not null,
       HIGH_SALARY float not null,
       LOW_SALARY float not null,
       primary key (GRADE)
   );

create table TIMEKEEPER (
       Timekeeper_Id varchar2(36 char) not null,
       EMP_ID number(19,0) not null,
       primary key (Timekeeper_Id)
   );
   

---- Modification d'une table existente ----------------------------------------

-- Ajout des colonnes

ALTER TABLE TIMEKEEPER ADD (Date_Time timestamp not null, In_Out char(1 char) not null );

-- Ajout des contraintes FK

 alter table EMPLOYEE
       add constraint FK75C8D6AE269A3C9
       foreign key (DEPT_ID)
       references DEPARTMENT;
       
--alter table EMPLOYEE
       --drop constraint FK75C8D6AE269A3C9;

 alter table EMPLOYEE
       add constraint FK75C8D6AE6106A42
       foreign key (EMP_ID)
       references EMPLOYEE;

alter table EMPLOYEE
       add constraint FK75C8D6AE13C12F64
       foreign key (MNG_ID)
       references EMPLOYEE;

alter table TIMEKEEPER
       add constraint FK744D9BFF6106A42
       foreign key (EMP_ID)
       references EMPLOYEE;
       
---- Description de la structure d’une table
       
DESCRIBE Timekeeper;

---- Insertion des donnees -----------------------------------------------------

insert into Department (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (10, 'ACCOUNTING', 'D10', 'NEW YORK');
 
insert into Department (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (20, 'RESEARCH', 'D20', 'DALLAS');
 
insert into Department (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (30, 'SALES', 'D30', 'CHICAGO');
 
insert into Department (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (40, 'OPERATIONS', 'D40', 'BOSTON');

insert into Department (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (50, 'IT', 'D50', 'BOSTON');

-------------------------------------------------------------------------------------------------


insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7839, 'KING', 'E7839', to_date('17-11-1981', 'dd-mm-yyyy'), 'PRESIDENT', 5000, 50, null);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7566, 'JONES', 'E7566', to_date('02-04-1981', 'dd-mm-yyyy'), 'MANAGER', 2975, 20, 7839);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7902, 'FORD', 'E7902', to_date('03-12-1981', 'dd-mm-yyyy'), 'ANALYST', 3000, 20, 7566);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7369, 'SMITH', 'E7369', to_date('17-12-1980', 'dd-mm-yyyy'), 'CLERK', 800, 20, 7902);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7698, 'BLAKE', 'E7698', to_date('01-05-1981', 'dd-mm-yyyy'), 'MANAGER', 2850, 30, 7839);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7499, 'ALLEN', 'E7499', to_date('20-02-1981', 'dd-mm-yyyy'), 'SALESMAN', 1600, 30, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7521, 'WARD', 'E7521', to_date('22-02-1981', 'dd-mm-yyyy'), 'SALESMAN', 1250, 30, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7654, 'MARTIN', 'E7654', to_date('28-09-1981', 'dd-mm-yyyy'), 'SALESMAN', 1250, 30, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7782, 'CLARK', 'E7782', to_date('09-06-1981', 'dd-mm-yyyy'), 'MANAGER', 2450, 30, 7839);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7788, 'SCOTT', 'E7788', to_date('19-04-1987', 'dd-mm-yyyy'), 'ANALYST', 3000, 20, 7566);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7844, 'TURNER', 'E7844', to_date('08-09-1981', 'dd-mm-yyyy'), 'SALESMAN', 1500, 30, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7876, 'ADAMS', 'E7876', to_date('23-05-1987', 'dd-mm-yyyy'), 'CLERK', 1100, 20, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7900, 'ADAMS', 'E7900', to_date('03-12-1981', 'dd-mm-yyyy'), 'CLERK', 950, 30, 7698);
 
insert into Employee (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7934, 'MILLER', 'E7934', to_date('23-01-1982', 'dd-mm-yyyy'), 'CLERK', 1300, 10, 7698);

-------------------------------------------------------------------------------------------------

insert into Salary_Grade (GRADE, HIGH_SALARY, LOW_SALARY)
values (1, 9999, 3001);

insert into Salary_Grade (GRADE, HIGH_SALARY, LOW_SALARY)
values (2, 3000, 1);

insert into Salary_Grade (GRADE, HIGH_SALARY, LOW_SALARY)
values (3, 10000, 20000);

---- Modification de donnees ---------------------------------------------------

SELECT * FROM employee;
-- Modifier le salaire pour l'employe dont l'EMP_NO= 'E7902'
UPDATE EMPLOYEE SET Salary= 4000 WHERE EMP_NO = 'E7902';

SELECT * FROM employee;

---- Suppression des donnees ---------------------------------------------------

SELECT * FROM Salary_Grade;
DELETE FROM Salary_Grade WHERE Grade=3;

---- Les clauses de Select -----------------------------------------------------

select * from SALARY_GRADE;

select distinct Job from Employee;

select * from EMPLOYEE where Job = 'MANAGER';

select * from EMPLOYEE where Job IN ('PRESIDENT', 'MANAGER');

select * from EMPLOYEE where MNG_ID IS NULL;

select * from EMPLOYEE where Salary BETWEEN 1500 AND 3000;

---- Calculs horizentaux -------------------------------------------------------

Create table EMPLOYEE_DUP (EMP_NO_Replaced varchar2(20 char));

Insert into EMPLOYEE_DUP select REPLACE(EMP_NO, 'E', 'EMP') from EMPLOYEE ;

Select * from EMPLOYEE_DUP;

---- Calculs verticaux ---------------------------------------------------------

select AVG(Salary) from EMPLOYEE ;

---- Classification ------------------------------------------------------------

select Job, AVG(Salary) from EMPLOYEE GROUP BY Job;

---- Recherche dans les sous-Tables --------------------------------------------

select Job, AVG(Salary) as AvgSalary from EMPLOYEE GROUP BY Job Having AVG(Salary) >2000;

---- Les vues ------------------------------------------------------------------

CREATE VIEW Job_view AS (SELECT Job, Salary from EMPLOYEE);

select * from Job_view;

CREATE VIEW Sal_1500_3000 AS (select * from EMPLOYEE where Salary BETWEEN 1500 AND 3000);

select * from Sal_1500_3000;

-- On essay d'inserer un salaire qui ne satisfait pas la condition de la vue

insert into sal_1500_3000(EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values(7799, 'Sebastien','E7799','09-JUN-81','MANAGER','3500','30','7839');

select * from Sal_1500_3000;

select * from EMPLOYEE;

-- => L'enregistremebt a ete insere dans la table employee mais pas dans la vue mais pas d'erreur
-- => Creer une vue with check option

CREATE VIEW Sal_3000_5000 AS (select * from EMPLOYEE where Salary BETWEEN 3000 AND 5000) WITH CHECK OPTION ;

select * from Sal_3000_5000;

insert into sal_3000_5000(EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values(7800, 'Sebastien','E7800','09-JUN-81','MANAGER','3500','30','7839');

insert into sal_3000_5000(EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values(7801, 'Sebastien','E7800','09-JUN-81','MANAGER','2500','30','7839');

-- => Ceci retourne erreur lors de l'insertion au niveau de la table aussi


---- Les jointures -------------------------------------------------------------

Select Emp.*, Dept.Dept_Name from 
employee Emp left outer join department Dept
on emp.dept_id = dept.dept_id;

Select  Dept.* , Emp.Dept_id from 
department Dept left outer join employee Emp
on emp.dept_id = dept.dept_id;

Select Emp.*, Dept.* from 
employee Emp inner join department Dept
on emp.dept_id = dept.dept_id;

