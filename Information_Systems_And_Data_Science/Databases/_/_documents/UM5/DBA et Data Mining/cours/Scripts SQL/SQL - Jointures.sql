Drop table DEPARTMENT_Join;
Drop table EMPLOYEE_Join;
---- Creation des tables -------------------------------------------------------
 
create table DEPARTMENT_Join (
       DEPT_ID number(10,0) not null,
       DEPT_NAME varchar2(255 char) not null,
       DEPT_NO varchar2(20 char) not null unique,
       LOCATION varchar2(255 char),
       primary key (DEPT_ID)
   );

create table EMPLOYEE_Join (
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

   
---- Insertion des donnees -----------------------------------------------------

insert into Department_Join (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (10, 'ACCOUNTING', 'D10', 'NEW YORK');
 
insert into Department_Join (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (20, 'RESEARCH', 'D20', 'DALLAS');
 
insert into Department_Join (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (30, 'SALES', 'D30', 'CHICAGO');
 
insert into Department_Join (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (40, 'OPERATIONS', 'D40', 'BOSTON');

insert into Department_Join (DEPT_ID, DEPT_NAME, DEPT_NO, LOCATION)
values (50, 'IT', 'D50', 'BOSTON');

-------------------------------------------------------------------------------------------------


insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7839, 'KING', 'E7839', to_date('17-11-1981', 'dd-mm-yyyy'), 'PRESIDENT', 5000, 70, null);
 
insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7566, 'JONES', 'E7566', to_date('02-04-1981', 'dd-mm-yyyy'), 'MANAGER', 2975, 20, 7839);
 
insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7902, 'FORD', 'E7902', to_date('03-12-1981', 'dd-mm-yyyy'), 'ANALYST', 3000, 20, 7566);
 
insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7369, 'SMITH', 'E7369', to_date('17-12-1980', 'dd-mm-yyyy'), 'CLERK', 800, 20, 7902);
 
insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7698, 'BLAKE', 'E7698', to_date('01-05-1981', 'dd-mm-yyyy'), 'MANAGER', 2850, 30, 7839);
 
insert into Employee_Join (EMP_ID, EMP_NAME, EMP_NO, HIRE_DATE, JOB, SALARY, DEPT_ID, MNG_ID)
values (7499, 'ALLEN', 'E7499', to_date('20-02-1981', 'dd-mm-yyyy'), 'SALESMAN', 1600, 30, 7698);
 
---- Les jointures -------------------------------------------------------------

Select * from employee_join;

Select * from department_join;

Select Emp.*, Dept.Dept_ID, Dept.Dept_Name from 
employee_join Emp left outer join department_join Dept
on emp.dept_id = dept.dept_id;

Select Emp.*, Dept.Dept_ID, Dept.Dept_Name from 
employee_join Emp Right outer join department_join Dept
on emp.dept_id = dept.dept_id;

Select  Dept.* , Emp.Dept_id from 
department_join Dept left outer join employee_join Emp
on emp.dept_id = dept.dept_id;

Select Emp.*, Dept.* from 
employee_join Emp inner join department_join Dept
on emp.dept_id = dept.dept_id;
