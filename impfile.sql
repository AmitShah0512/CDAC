-- assigment day 1 set-- 

CREATE DATABASE CDAC;
USE CDAC;

create table EMP (
  EMPNO Int(4) not null,
  ENAME varchar(10) ,
  JOB varchar(9) ,
  MGR Int(4) ,
  HIREDATE date ,
  SAL Double(7, 2) ,
  COMM Double(7, 2) ,
  DEPTNO Double(2, 0)
);

create database practice;
use practice ;

create table RTU (
RTU_id varchar (30) primary key ,
LOCATION varchar (30) ,
ip_address varchar (50)
);

desc RTU ;

INSERT INTO RTU VALUES
('R101', 'BENGALURU', '192.168.0.1'),
('R102', 'MUMBAI', '192.168.0.2'),
('R103', 'CHENNAI', '192.168.0.3'),
('R104', 'NEW DELHI', '192.168.0.4'),
('R105', 'KOLKATA', '192.168.0.5');

select * from SENSORS;

create table SENSORS (
SENSOR_ID varchar (20) primary key,
RTU_ID varchar(20),
STATUS varchar (20),
SENSOR_TYPE varchar(50),
REQ_VAL int,
CURR_VAL int,
constraint fk_rtu_id 
FOREIGN key (RTU_id)
references rtu (rtu_id)
);

INSERT INTO SENSORS 
(SENSOR_ID, RTU_ID, STATUS, SENSOR_TYPE, REQ_VAL, CURR_VAL)
VALUES
('S801', 'R101', 'ENABLED', 'PRESSURE', 34, 33),
('S802', 'R101', 'ENABLED', 'TEMPERATURE', 98, 90),
('S803', 'R101', 'DISABLED', 'TEMPERATURE', 96, NULL),
('S804', 'R102', 'ENABLED', 'PRESSURE', 30, 32),
('S805', 'R102', 'ENABLED', 'PRESSURE', 36, 32),
('S806', 'R102', 'DISABLED', 'TEMPERATURE', 108, NULL),
('S807', 'R102', 'ENABLED', 'BAROMETER', 750, 660);

INSERT INTO SENSORS 
(SENSOR_ID, RTU_ID, STATUS, SENSOR_TYPE, REQ_VAL, CURR_VAL)
VALUES
('S808', 'R103', 'ENABLED', 'BAROMETER', 780, 690),
('S809', 'R103', 'ENABLED', 'ULTRASONIC', 510, 450),
('S810', 'R104', 'DISABLED', 'ULTRASONIC', 530, NULL),
('S811', 'R104', 'ENABLED', 'PRESSURE', 60, 50);
 select*from sensors;


create table users (
user_id varchar (30) primary key,
user_name varchar (30),
role varchar (30)
);

INSERT INTO USERS 
(USER_ID, USER_NAME, ROLE)
VALUES
('U501', 'PRAKASH', 'MONITOR'),
('U502', 'PARTHIV', 'ADMINISTER'),
('U503', 'SMITHA', 'ADMINISTER');


create table controller (
user_id varchar(20),
sensor_id varchar(30));




alter table controller
add constraint pk_controller primary key (user_id , sensor_id),
add constraint fk_user_id  foreign key (user_id) references users(user_id),
add constraint fk_sensor_id foreign key (sensor_id) references sensors(sensor_id);



INSERT INTO CONTROLLER (USER_ID, SENSOR_ID)
VALUES
('U501', 'S801'),
('U501', 'S804'),
('U501', 'S806'),
('U502', 'S802'),
('U502', 'S804'),
('U503', 'S805'),
('U503', 'S806'),
('U501', 'S809'),
('U502', 'S810'),
('U503', 'S811'),
('U501', 'S807'),
('U503', 'S808'),
('U502', 'S801'),
('U501', 'S808');



-- 1.	Fetch details of all the sensors which are disabled

select * from sensors
where status like "DISABLED";


-- 2.	List sensors which are having required value less than current value

select  * from sensors
where req_val < curr_val ;

-- 3.	List sensors which are of type TEMPERATURE and required value greater than 96.
--  Sort on required value field.

select * from sensors 
where req_val > 96 and sensor_type = "TEMPERATURE" 
order by req_val  ;

-- 4.	List sensors which has no current values

select * from sensors 
where curr_val is null;

-- 5.	List all sensors which are of type TEMPERATURE & PRESSURE.

select * from sensors
where sensor_type in ('TEMPERATURE' , 'PRESSURE');

-- 6.	List sensors with rtu_id 102 and sensor 
-- type pressure and required value greater than 30.

select * from sensors 
where rtu_id = "R102" and  req_val > 30 and sensor_type = "PRESSURE" ;



-- Write simple queries from the EMP table
-- 1.	List the emp whose salary between 1200 and 1600.
-- 2.	List the emp where job title is not CLERK, SALESMAN.
-- 3.	List the details of employee whose name has second letter as D.
-- 4.	Select the dept details where deptno is not 10. 
-- 5.	Select the name and deptno of employee whose name starting with ‘J’ or ‘S’ and not in dept 20 or 30.
-- 6.	Select the dept having 5 characters in name ending with S.
-- 7.	List the depts which are located in DALLAS or BOSTON.
-- 8.	List the lowsal and highsal from the salgrade table.
-- 9.	List the grade where the low salary is between 1400 and 2500.
-- 10.	List the grade where high salary between 2000 and 5000.



-- 1.	List the emp whose salary between 1200 and 1600.

select * from emp
where sal between 1200 and 1600 ;

joins----------------------------
USE EMPLOYEE;



drop table emp;
drop table dept;
CREATE TABLE EMP (
    EMPNO INT(4) NOT NULL,
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR INT(4),
    HIREDATE DATE,
    SAL DECIMAL(7, 2),
    COMM DECIMAL(7, 2),
    DEPTNO INT(2),
    PRIMARY KEY (EMPNO)
);

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        STR_TO_DATE('17-DEC-1980', '%d-%b-%Y'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        STR_TO_DATE('20-FEB-1981', '%d-%b-%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        STR_TO_DATE('22-FEB-1981', '%d-%b-%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        STR_TO_DATE('2-APR-1981', '%d-%b-%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        STR_TO_DATE('28-SEP-1981', '%d-%b-%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        STR_TO_DATE('1-MAY-1981', '%d-%b-%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        STR_TO_DATE('9-JUN-1981', '%d-%b-%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        STR_TO_DATE('09-DEC-1982', '%d-%b-%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        STR_TO_DATE('17-NOV-1981', '%d-%b-%Y'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        STR_TO_DATE('8-SEP-1981', '%d-%b-%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        STR_TO_DATE('12-JAN-1983', '%d-%b-%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        STR_TO_DATE('23-JAN-1982', '%d-%b-%Y'), 1300, NULL, 10);

select*from emp;

CREATE TABLE DEPT (
    DEPTNO INT(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13)
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS (
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    SAL DECIMAL(10, 2),
    COMM DECIMAL(10, 2)
);

CREATE TABLE SALGRADE (
    GRADE INT,
    LOSAL DECIMAL(10, 2),
    HISAL DECIMAL(10, 2)
);

INSERT INTO SALGRADE VALUES (1,  700.00, 1200.00);
INSERT INTO SALGRADE VALUES (2, 1201.00, 1400.00);
INSERT INTO SALGRADE VALUES (3, 1401.00, 2000.00);
INSERT INTO SALGRADE VALUES (4, 2001.00, 3000.00);
INSERT INTO SALGRADE VALUES (5, 3001.00, 9999.00);

-- 1.	List  deptno, dname along with total salary 
-- in each department.

select d.deptno, d.dname, sum(e.sal) as total_salary 
from emp e
JOIN dept d on e.deptno=d.deptno
group by d.deptno,d.dname;

select*from emp;
-- 2.	List details from emp, dept 
-- and salgrade table excluding clerks and employees with 
-- grade 1. Order on their names.

select*from dept;
select*from salgrade;

select e.*, d.dname, s.grade
 from emp e
 join dept d on e.deptno=d.deptno
 join salgrade as s on e.sal 
where e.job!= 'CLERK'
and grade != 1
order by e.ename;

show errors;

-- 3.	List employee with grade 3 or 4.
select*from salgrade;

select e.*, s.grade from emp e
join salgrade s on e.sal between s.losal and s.hisal
where s.grade in(3,4);

-- 4.	List employees located in dallas.

select e.* from emp e
join dept d on e.deptno=d.deptno
where d.loc='dallas';

-- 5.	List employee and department
--  details for department 30 and 40.
select*from dept;

select e.*, d.dname from emp e
join dept d on d.deptno=e.deptno 
where d.deptno in(30,40);

show errors;

-- 6.List all employees who earn less than their managers. 
-- List their managers details also.


drop database day1;
-- 7 Find all employees who joined the company before their manager.

SELECT e.ename AS employee, e.hiredate,
       m.ename AS manager, m.hiredate
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.hiredate < m.hiredate;

Rtu table-------------------------------------------
create database RTU_DATABASE;
USE RTU_DATABASE;

CREATE TABLE RTU (RTU_ID VARCHAR(5) PRIMARY KEY, 
LOCATION VARCHAR(20), IP_ADDRESS VARCHAR(30));

CREATE table SENSORS(
SENSOR_ID VARCHAR(5) PRIMARY KEY, 
RTU_ID VARCHAR(5),
STATUS VARCHAR(10),
SENSOR_TYPE VARCHAR(15),
REQ_VAL INT,CURR_VAL INT,
foreign key (RTU_ID) REFERENCES RTU(RTU_ID)
);

INSERT INTO RTU VALUES
('R101', 'BENGALURU', '192.168.0.1'),
('R102', 'MUMBAI', '192.168.0.2'),
('R103', 'CHENNAI', '192.168.0.3'),
('R104', 'NEW DELHI', '192.168.0.4'),
('R105', 'KOLKATA', '192.168.0.5');

SELECT*FROM RTU;

DESC RTU;

SELECT*FROM SENSORS;

INSERT INTO SENSORS 
(SENSOR_ID, RTU_ID, STATUS, SENSOR_TYPE, REQ_VAL, CURR_VAL)
VALUES
('S801', 'R101', 'ENABLED', 'PRESSURE', 34, 33),
('S802', 'R101', 'ENABLED', 'TEMPERATURE', 98, 90),
('S803', 'R101', 'DISABLED', 'TEMPERATURE', 96, NULL),
('S804', 'R102', 'ENABLED', 'PRESSURE', 30, 32),
('S805', 'R102', 'ENABLED', 'PRESSURE', 36, 32),
('S806', 'R102', 'DISABLED', 'TEMPERATURE', 108, NULL),
('S807', 'R102', 'ENABLED', 'BAROMETER', 750, 660);

INSERT INTO SENSORS 
(SENSOR_ID, RTU_ID, STATUS, SENSOR_TYPE, REQ_VAL, CURR_VAL)
VALUES
('S808', 'R103', 'ENABLED', 'BAROMETER', 780, 690),
('S809', 'R103', 'ENABLED', 'ULTRASONIC', 510, 450),
('S810', 'R104', 'DISABLED', 'ULTRASONIC', 530, NULL),
('S811', 'R104', 'ENABLED', 'PRESSURE', 60, 50);

CREATE table USERS
(USER_ID varchar(5),
USER_NAME VARCHAR(10),
ROLE varchar(20));

INSERT INTO USERS values
('U501', 'PRAKASH', 'MONITOR'),
('U502', 'PARTHIV', 'ADMINISTER'),
('U503', 'SMITHA', 'ADMINISTER');


CREATE TABLE CONTROLLER(
USER_ID VARCHAR(5) primary KEY, SENSOR_ID VARCHAR(5),
foreign key (SENSOR_ID) references SENSORS(SENSOR_ID)
);

select*FROM CONTROLLER;
INSERT INTO CONTROLLER(USER_ID, SENSOR_ID)
VALUES
('U501', 'S801'),
('U501', 'S804'),
('U501', 'S806'),
('U502', 'S802'),
('U502', 'S804'),
('U503', 'S805'),
('U503', 'S806'),
('U501', 'S809'),
('U502', 'S810'),
('U503', 'S811'),
('U501', 'S807'),
('U503', 'S808'),
('U502', 'S801'),
('U501', 'S808');

ALTER TABLE CONTROLLER
ADD USER_ID varchar(50);

ALTER TABLE CONTROLLER
ADD constraint primary key (USER_ID,SENSOR_Id);

SELECT*FROM  CONTROLLER;


-- 1.	Display RTU details along with sensor details for all RTU's\

select r.*,s.* from rtu r
join sensors s on s.rtu_id=r.rtu_id;

-- 2.	Display user details and sensor details controlled by each user.

SELECT u.*, s.*
FROM users u
CROSS JOIN sensors s;

-- 3.	Display user details and sensor details controlled by each user alongwith RTU details.

SELECT u.*, s.*, r.*
FROM users u
JOIN controller c
ON u.user_id = c.user_id
JOIN sensors s
ON s.sensor_id = c.sensor_id
join rtu r 
on r.rtu_id= s.rtu_id;


-- 4.	List how many sensors are controlled by each user. Display user_name and count. Sort on count.

SELECT u.user_name, COUNT(s.sensor_id) AS sensor_count
FROM users u
join controller c on c.user_id=u.user_id
join sensors s on c.sensor_id=s.sensor_id
GROUP BY u.user_name
ORDER BY sensor_count;


-- 5.	Display user details who are controlling sensor_type TEMPERATURE

SELECT u.*,s.*
FROM users u
JOIN controller c on c.user_id=u.user_id
join sensors s ON s.sensor_id = c.sensor_id
WHERE s.sensor_type = 'TEMPERATURE';


-- 6.	Display user details that is controlling sensor S801 along with sensor details and location.

SELECT u.*, s.*, r.location
FROM users u
JOIN controller c on c.user_id=u.user_id
join sensors s ON s.sensor_id = c.sensor_id
JOIN rtu r
ON s.rtu_id = r.rtu_id
WHERE s.sensor_id = 'S801';

Procedure---------------------------------------------------------------
use employee;
--  Employee Net Salary Calculator

delimiter //
create procedure empBuisnessLogic(IN salary INT, out net_salary double)
begin
declare HRA INT default 0;
declare DA INT default 0;
declare Tax INT default 0;

set HRA = salary*0.20;
set DA = salary*0.10;
set Tax = salary*0.05;
set net_salary = salary+HRA+DA-Tax;

end//
drop procedure empBuisnessLogic//
call empBuisnessLogic(50000, @result);
select (@result);

-- 2️ Employee Bonus Calculator

delimiter //
create procedure empBonusCal(in emp_id int,in salary int, out p_bonus int)
begin

if emp_id > 10 then set p_bonus = salary*1.25;
elseif emp_id between 5 and 10 then set p_bonus= salary*1.15;
else set p_bonus= salary*1.08;
end if;
end //

call empBonusCal(10,5000,@result);
select (@result);

--  Department Employee Count

DELIMITER //
CREATE PROCEDURE DeptEmployeeCount(
    IN p_department INT,
    OUT p_employee_count INT
)
BEGIN
    SELECT COUNT(*) 
    INTO p_employee_count
    FROM emp
    WHERE deptno = p_department;
END //

call DeptEmployeeCount();

--  4 High Salary Status Checker

select*from emp;

delimiter //

create procedure statusSal(in eid int,out sal_status varchar(20))
begin
declare salary int default 0;

select sal into salary from emp
where empno=eid;
if salary > 75000 then set sal_Status='High Salary';
else set sal_Status = 'Normal salary';
end if;
end//

call statusSal(7788,@status);
select (@status);

-- 5 salary Increment Updater

drop procedure incrUp;

delimiter //
create procedure incrUp(in eid int,in perc double, out update_sal double)
begin
declare salary int default 0;
select sal into salary from emp
where empno=eid;
 set update_sal=salary*(1+ perc/100);
 select update_sal;
 end//
 
call incrUp(7788,20,@update);

-- Employee Tax Calculator

delimiter //

create procedure empTaxCal(in eid int,out Tax_amount double)
begin
declare salary int default 0;
select sal into salary from emp
where empno=eid;
if salary > 100000 then set Tax_Amount=salary*0.20;
elseif salary between 50000 and 100000 then set Tax_Amount=salary*0.10;
else set Tax_Amount=salary*0.05;
end if;
end//

call empTaxCal(7788,@tax);
select (@tax);

-- Experience Category Finder

drop procedure findExpCat;
delimiter //
create procedure findExpCat(in eid int,out expcat varchar(20))
begin
declare exp int default 0;
select exp= timestampdiff(year, hiredate, curdate())
into expcat from emp
where empno=eid;

if expcat > 15 then set expcat='Senior';
elseif expcat between 5 and 15 then set expcat='Mid-Level';
else set expcat='junior';
end if;
end //

call findExpCat(7788,@exp);
select (@exp);

-- Annual Salary Generator
drop procedure AnnualSalaryGenerator;
DELIMITER //

CREATE PROCEDURE AnnualSalaryGenerator(
    IN eid INT,
    OUT annual_salary int
)
BEGIN
    DECLARE salary int default 0;
    SELECT sal
    INTO salary
    FROM emp
    WHERE empno = eid;

    SET annual_salary = salary * 12;

END //

call AnnualSalaryGenerator(7788,@annual);
select(@annual);

-- Salary Comparison Between Two Employees
drop procedure CompareSalary;
DELIMITER //

CREATE PROCEDURE CompareSalary(
    IN p_emp_id1 INT,
    IN p_emp_id2 INT,
    OUT p_higher_salary_emp INT,
    OUT higher_sal_id int
)
BEGIN
    DECLARE sal1 DECIMAL(10,2);
    DECLARE sal2 DECIMAL(10,2);

    SELECT sal INTO sal1 
    FROM emp 
    WHERE empno = p_emp_id1;

    SELECT sal INTO sal2 
    FROM emp 
    WHERE empno = p_emp_id2;

    IF sal1 > sal2 THEN
        SET p_higher_salary_emp = sal1;
        SET higher_sal_id = p_emp_id1;
    ELSE
        SET p_higher_salary_emp = sal2;
         SET higher_sal_id = p_emp_id2;
    END IF;

END //


call CompareSalary(7788,7844,@compare,@salary);
select @compare,@salary
