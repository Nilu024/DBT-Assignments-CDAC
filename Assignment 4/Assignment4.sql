mysql> CREATE DATABASE ASSIGNMENT4;
Query OK, 1 row affected (0.03 sec)

mysql> USE ASSIGNMENT4;
Database changed
mysql> CREATE TABLE Dept (
    ->     DeptID INT PRIMARY KEY,
    ->     DeptName VARCHAR(50),
    ->     Location VARCHAR(50),
    ->     ParentDeptID INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> CREATE TABLE Emp (
    ->     EmpID INT PRIMARY KEY AUTO_INCREMENT,
    ->     EmpName VARCHAR(50),
    ->     Salary DECIMAL(10,2),
    ->     DeptID INT NULL,
    ->     ManagerID INT NULL,
    ->     FOREIGN KEY (DeptID) REFERENCES Dept(DeptID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> CREATE TABLE Project (
    ->     ProjectID INT PRIMARY KEY,
    ->     ProjectName VARCHAR(100),
    ->     Budget DECIMAL(12,2),
    ->     DeptID INT,
    ->     RelatedProjectID INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> INSERT INTO Dept VALUES
    -> (10, 'IT', 'Mumbai', NULL),
    -> (20, 'HR', 'Pune', NULL),
    -> (30, 'Finance', 'Mumbai', NULL),
    -> (40, 'Marketing', 'Delhi', NULL),
    -> (50, 'Sales', 'Pune', NULL);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Emp (EmpName, Salary, DeptID, ManagerID) VALUES
    -> ('Amit', 60000, 10, NULL),
    -> ('Priya', 55000, 10, 1),
    -> ('Rahul', 45000, 10, 1),
    -> ('Sneha', 50000, 10, 2),
    -> ('Vijay', 40000, 10, 2),
    -> ('Neha', 42000, 10, 1),
    -> ('Karan', 35000, 20, 1),
    -> ('Pooja', 30000, NULL, 2);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Project VALUES
    -> (101, 'Website Development', 200000, 10, NULL),
    -> (102, 'Recruitment Portal', 100000, 20, NULL),
    -> (103, 'Banking System', 300000, 30, 101),
    -> (104, 'Marketing Campaign', 80000, 40, 101),
    -> (105, 'Sales Dashboard', 120000, 50, 104);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Emp;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM Dept;
+--------+-----------+----------+--------------+
| DeptID | DeptName  | Location | ParentDeptID |
+--------+-----------+----------+--------------+
|     10 | IT        | Mumbai   |         NULL |
|     20 | HR        | Pune     |         NULL |
|     30 | Finance   | Mumbai   |         NULL |
|     40 | Marketing | Delhi    |         NULL |
|     50 | Sales     | Pune     |         NULL |
+--------+-----------+----------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Project;
+-----------+---------------------+-----------+--------+------------------+
| ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-----------+---------------------+-----------+--------+------------------+
|       101 | Website Development | 200000.00 |     10 |             NULL |
|       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|       103 | Banking System      | 300000.00 |     30 |              101 |
|       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
+-----------+---------------------+-----------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMP CROSS JOIN DEPT ON EMP.DeptID = DEPT.DeptID;
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | DeptID | DeptName | Location | ParentDeptID |
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |     10 | IT       | Mumbai   |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     10 | IT       | Mumbai   |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     10 | IT       | Mumbai   |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     20 | HR       | Pune     |         NULL |
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM EMP CROSS JOIN DEPT;
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | DeptID | DeptName  | Location | ParentDeptID |
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |     50 | Sales     | Pune     |         NULL |
|     1 | Amit    | 60000.00 |     10 |      NULL |     40 | Marketing | Delhi    |         NULL |
|     1 | Amit    | 60000.00 |     10 |      NULL |     30 | Finance   | Mumbai   |         NULL |
|     1 | Amit    | 60000.00 |     10 |      NULL |     20 | HR        | Pune     |         NULL |
|     1 | Amit    | 60000.00 |     10 |      NULL |     10 | IT        | Mumbai   |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     50 | Sales     | Pune     |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     40 | Marketing | Delhi    |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     30 | Finance   | Mumbai   |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     20 | HR        | Pune     |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     50 | Sales     | Pune     |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     40 | Marketing | Delhi    |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     30 | Finance   | Mumbai   |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     20 | HR        | Pune     |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     50 | Sales     | Pune     |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     40 | Marketing | Delhi    |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     30 | Finance   | Mumbai   |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     20 | HR        | Pune     |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     10 | IT        | Mumbai   |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     50 | Sales     | Pune     |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     40 | Marketing | Delhi    |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     30 | Finance   | Mumbai   |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     20 | HR        | Pune     |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     10 | IT        | Mumbai   |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     50 | Sales     | Pune     |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     40 | Marketing | Delhi    |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     30 | Finance   | Mumbai   |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     20 | HR        | Pune     |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     50 | Sales     | Pune     |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     40 | Marketing | Delhi    |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     30 | Finance   | Mumbai   |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     20 | HR        | Pune     |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     10 | IT        | Mumbai   |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |     50 | Sales     | Pune     |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |     40 | Marketing | Delhi    |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |     30 | Finance   | Mumbai   |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |     20 | HR        | Pune     |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |     10 | IT        | Mumbai   |         NULL |
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
40 rows in set (0.00 sec)

mysql> SELECT EMP.EmpName, DEPT.DeptName FROM EMP INNER JOIN DEPT ON EMP.DeptID = DEPT.DeptID;
+---------+----------+
| EmpName | DeptName |
+---------+----------+
| Amit    | IT       |
| Priya   | IT       |
| Rahul   | IT       |
| Sneha   | IT       |
| Vijay   | IT       |
| Neha    | IT       |
| Karan   | HR       |
+---------+----------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM EMP LEFT OUTER JOIN DEPT ON EMP.DeptID = DEPT.DeptID;
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | DeptID | DeptName | Location | ParentDeptID |
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |     10 | IT       | Mumbai   |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     10 | IT       | Mumbai   |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     10 | IT       | Mumbai   |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     10 | IT       | Mumbai   |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     20 | HR       | Pune     |         NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |   NULL | NULL     | NULL     |         NULL |
+-------+---------+----------+--------+-----------+--------+----------+----------+--------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMP RIGHT JOIN DEPT ON EMP.DeptID = DEPT.DeptID;
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | DeptID | DeptName  | Location | ParentDeptID |
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |     10 | IT        | Mumbai   |         NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |     10 | IT        | Mumbai   |         NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |     10 | IT        | Mumbai   |         NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |     10 | IT        | Mumbai   |         NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |     20 | HR        | Pune     |         NULL |
|  NULL | NULL    |     NULL |   NULL |      NULL |     30 | Finance   | Mumbai   |         NULL |
|  NULL | NULL    |     NULL |   NULL |      NULL |     40 | Marketing | Delhi    |         NULL |
|  NULL | NULL    |     NULL |   NULL |      NULL |     50 | Sales     | Pune     |         NULL |
+-------+---------+----------+--------+-----------+--------+-----------+----------+--------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM EMP NATURAL JOIN DEPT;
+--------+-------+---------+----------+-----------+----------+----------+--------------+
| DeptID | EmpID | EmpName | Salary   | ManagerID | DeptName | Location | ParentDeptID |
+--------+-------+---------+----------+-----------+----------+----------+--------------+
|     10 |     1 | Amit    | 60000.00 |      NULL | IT       | Mumbai   |         NULL |
|     10 |     2 | Priya   | 55000.00 |         1 | IT       | Mumbai   |         NULL |
|     10 |     3 | Rahul   | 45000.00 |         1 | IT       | Mumbai   |         NULL |
|     10 |     4 | Sneha   | 50000.00 |         2 | IT       | Mumbai   |         NULL |
|     10 |     5 | Vijay   | 40000.00 |         2 | IT       | Mumbai   |         NULL |
|     10 |     6 | Neha    | 42000.00 |         1 | IT       | Mumbai   |         NULL |
|     20 |     7 | Karan   | 35000.00 |         1 | HR       | Pune     |         NULL |
+--------+-------+---------+----------+-----------+----------+----------+--------------+
7 rows in set (0.02 sec)

mysql> SELECT * FROM EMP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM PROJECT;
+-----------+---------------------+-----------+--------+------------------+
| ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-----------+---------------------+-----------+--------+------------------+
|       101 | Website Development | 200000.00 |     10 |             NULL |
|       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|       103 | Banking System      | 300000.00 |     30 |              101 |
|       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
+-----------+---------------------+-----------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMP CROSS JOIN PROJECT ON EMP.DeptID = PROJECT.DeptID;
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |       101 | Website Development | 200000.00 |     10 |             NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM EMP CROSS JOIN PROJECT;
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     1 | Amit    | 60000.00 |     10 |      NULL |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     1 | Amit    | 60000.00 |     10 |      NULL |       103 | Banking System      | 300000.00 |     30 |              101 |
|     1 | Amit    | 60000.00 |     10 |      NULL |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     1 | Amit    | 60000.00 |     10 |      NULL |       101 | Website Development | 200000.00 |     10 |             NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     2 | Priya   | 55000.00 |     10 |         1 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     2 | Priya   | 55000.00 |     10 |         1 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     2 | Priya   | 55000.00 |     10 |         1 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     3 | Rahul   | 45000.00 |     10 |         1 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     3 | Rahul   | 45000.00 |     10 |         1 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     3 | Rahul   | 45000.00 |     10 |         1 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     3 | Rahul   | 45000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     4 | Sneha   | 50000.00 |     10 |         2 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     4 | Sneha   | 50000.00 |     10 |         2 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     4 | Sneha   | 50000.00 |     10 |         2 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     4 | Sneha   | 50000.00 |     10 |         2 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     5 | Vijay   | 40000.00 |     10 |         2 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     5 | Vijay   | 40000.00 |     10 |         2 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     5 | Vijay   | 40000.00 |     10 |         2 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     5 | Vijay   | 40000.00 |     10 |         2 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     6 | Neha    | 42000.00 |     10 |         1 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     6 | Neha    | 42000.00 |     10 |         1 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     6 | Neha    | 42000.00 |     10 |         1 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     6 | Neha    | 42000.00 |     10 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     7 | Karan   | 35000.00 |     20 |         1 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     7 | Karan   | 35000.00 |     20 |         1 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     7 | Karan   | 35000.00 |     20 |         1 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     7 | Karan   | 35000.00 |     20 |         1 |       101 | Website Development | 200000.00 |     10 |             NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |       103 | Banking System      | 300000.00 |     30 |              101 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|     8 | Pooja   | 30000.00 |   NULL |         2 |       101 | Website Development | 200000.00 |     10 |             NULL |
+-------+---------+----------+--------+-----------+-----------+---------------------+-----------+--------+------------------+
40 rows in set (0.00 sec)

mysql> CREATE TABLE EmpBackup LIKE EMP;
Query OK, 0 rows affected (0.08 sec)

mysql> DESC EmpBackup;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| EmpID     | int           | NO   | PRI | NULL    | auto_increment |
| EmpName   | varchar(50)   | YES  |     | NULL    |                |
| Salary    | decimal(10,2) | YES  |     | NULL    |                |
| DeptID    | int           | YES  | MUL | NULL    |                |
| ManagerID | int           | YES  |     | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
5 rows in set (0.07 sec)

mysql> INSERT INTO EMPBACKUP VALUES SELECT * FROM EMP;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM EMP' at line 1
mysql> SELECT * FROM EMP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> INSERT INTO EMPBACKUP SELECT * FROM EMP;
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPBACKUP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> CREATE TABLE ProjectArchive AS SELECT * FROM PROJECT;
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM ProjectArchive;
+-----------+---------------------+-----------+--------+------------------+
| ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-----------+---------------------+-----------+--------+------------------+
|       101 | Website Development | 200000.00 |     10 |             NULL |
|       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|       103 | Banking System      | 300000.00 |     30 |              101 |
|       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
+-----------+---------------------+-----------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM PROJECT;
+-----------+---------------------+-----------+--------+------------------+
| ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-----------+---------------------+-----------+--------+------------------+
|       101 | Website Development | 200000.00 |     10 |             NULL |
|       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|       103 | Banking System      | 300000.00 |     30 |              101 |
|       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
+-----------+---------------------+-----------+--------+------------------+
5 rows in set (0.00 sec)

mysql> DESC EMP;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| EmpID     | int           | NO   | PRI | NULL    | auto_increment |
| EmpName   | varchar(50)   | YES  |     | NULL    |                |
| Salary    | decimal(10,2) | YES  |     | NULL    |                |
| DeptID    | int           | YES  | MUL | NULL    |                |
| ManagerID | int           | YES  |     | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMP; 
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMP WHERE Salary > ( SELECT AVG(Salary) FROM EMP); 
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
+-------+---------+----------+--------+-----------+
4 rows in set (0.02 sec)

mysql> SELECT * FROM dept;
+--------+-----------+----------+--------------+
| DeptID | DeptName  | Location | ParentDeptID |
+--------+-----------+----------+--------------+
|     10 | IT        | Mumbai   |         NULL |
|     20 | HR        | Pune     |         NULL |
|     30 | Finance   | Mumbai   |         NULL |
|     40 | Marketing | Delhi    |         NULL |
|     50 | Sales     | Pune     |         NULL |
+--------+-----------+----------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMP WHERE DeptID = ( SELECT DeptID FROM EMP WHERE LOCATION IN 'Mumbai'); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Mumbai')' at line 1
mysql> SELECT * FROM EMP WHERE DeptID = ( SELECT DeptID FROM EMP WHERE Location IN 'Mumbai'); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Mumbai')' at line 1
mysql> SELECT * FROM EMP WHERE DeptID = ( SELECT DeptID FROM EMP WHERE Location IN ('Mumbai')); 
ERROR 1054 (42S22): Unknown column 'Location' in 'where clause'
mysql> SELECT * FROM EMP WHERE DeptID = ( SELECT DeptID FROM EMP WHERE Location = Mumbai); 
ERROR 1054 (42S22): Unknown column 'Location' in 'where clause'
mysql> SELECT * FROM EMP WHERE DeptID = ( SELECT DeptID FROM dept WHERE Location IN 'Mumbai'); 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Mumbai')' at line 1
mysql> SELECT * FROM EMP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM DEPT;
+--------+-----------+----------+--------------+
| DeptID | DeptName  | Location | ParentDeptID |
+--------+-----------+----------+--------------+
|     10 | IT        | Mumbai   |         NULL |
|     20 | HR        | Pune     |         NULL |
|     30 | Finance   | Mumbai   |         NULL |
|     40 | Marketing | Delhi    |         NULL |
|     50 | Sales     | Pune     |         NULL |
+--------+-----------+----------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMP WHERE DeptID = ANY ( SELECT DeptID FROM DEPT WHERE Location IN 'Mumbai');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''Mumbai')' at line 1
mysql> SELECT * FROM EMP WHERE DeptID = ANY ( SELECT DeptID FROM DEPT WHERE Location = 'Mumbai');
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
+-------+---------+----------+--------+-----------+
6 rows in set (0.03 sec)

mysql> SELECT * FROM DEPT WHERE DeptID = ANY ( SELECT DeptID, COUNT(*) FROM EMP WHERE COUNT(*) > 5);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT * FROM DEPT WHERE DeptID = ANY ( SELECT DeptIDFROM EMP WHERE COUNT(*) > 5);
ERROR 1054 (42S22): Unknown column 'DeptIDFROM' in 'field list'
mysql> SELECT * FROM DEPT WHERE DeptID = ANY ( SELECT DeptID FROM EMP WHERE COUNT(*) > 5);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT * FROM DEPT WHERE DeptID = ANY ( SELECT DeptID FROM EMP HAVING COUNT(*) > 5);
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'assignment4.EMP.DeptID'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT * FROM DEPT WHERE DeptID = ANY ( SELECT DeptID FROM EMP GROUP BY DeptID HAVING COUNT(*) > 5);
+--------+----------+----------+--------------+
| DeptID | DeptName | Location | ParentDeptID |
+--------+----------+----------+--------------+
|     10 | IT       | Mumbai   |         NULL |
+--------+----------+----------+--------------+
1 row in set (0.03 sec)

mysql> SELECT *, (SELECT MAX(Salary) FROM EMP ) AS Max_Salary FROM EMP ;
+-------+---------+----------+--------+-----------+------------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | Max_Salary |
+-------+---------+----------+--------+-----------+------------+
|     1 | Amit    | 60000.00 |     10 |      NULL |   60000.00 |
|     2 | Priya   | 55000.00 |     10 |         1 |   60000.00 |
|     3 | Rahul   | 45000.00 |     10 |         1 |   60000.00 |
|     4 | Sneha   | 50000.00 |     10 |         2 |   60000.00 |
|     5 | Vijay   | 40000.00 |     10 |         2 |   60000.00 |
|     6 | Neha    | 42000.00 |     10 |         1 |   60000.00 |
|     7 | Karan   | 35000.00 |     20 |         1 |   60000.00 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |   60000.00 |
+-------+---------+----------+--------+-----------+------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMP WHERE SALARY = ANY ( SELECT MAX(Salary) FROM EMP);
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
+-------+---------+----------+--------+-----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM EMP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMP AS E1 SELF JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELF JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID' at line 1
mysql> SELECT * FROM EMP AS E1 SELF EMP AS E2 ON E1.EmpID = E2.ManagerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELF EMP AS E2 ON E1.EmpID = E2.ManagerID' at line 1
mysql> SELECT * FROM EMP AS E1 JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
+-------+---------+----------+--------+-----------+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID | EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |     2 | Priya   | 55000.00 |     10 |         1 |
|     1 | Amit    | 60000.00 |     10 |      NULL |     3 | Rahul   | 45000.00 |     10 |         1 |
|     2 | Priya   | 55000.00 |     10 |         1 |     4 | Sneha   | 50000.00 |     10 |         2 |
|     2 | Priya   | 55000.00 |     10 |         1 |     5 | Vijay   | 40000.00 |     10 |         2 |
|     1 | Amit    | 60000.00 |     10 |      NULL |     6 | Neha    | 42000.00 |     10 |         1 |
|     1 | Amit    | 60000.00 |     10 |      NULL |     7 | Karan   | 35000.00 |     20 |         1 |
|     2 | Priya   | 55000.00 |     10 |         1 |     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+-------+---------+----------+--------+-----------+
7 rows in set (0.00 sec)

mysql> SELECT E1.EmpName AS 'Employee Name', E2.EmpName AS 'Manager Name' FROM EMP AS E1 JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
+---------------+--------------+
| Employee Name | Manager Name |
+---------------+--------------+
| Amit          | Priya        |
| Amit          | Rahul        |
| Priya         | Sneha        |
| Priya         | Vijay        |
| Amit          | Neha         |
| Amit          | Karan        |
| Priya         | Pooja        |
+---------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT E1.EmpName AS 'Employee Name', E2.EmpName = ANY ( SELECT EmpName FROM EMP WHERE E2.EmpID = E1.EmpID ) AS 'Manager Name' FROM EMP AS E1 JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
+---------------+--------------+
| Employee Name | Manager Name |
+---------------+--------------+
| Amit          |            0 |
| Amit          |            0 |
| Priya         |            0 |
| Priya         |            0 |
| Amit          |            0 |
| Amit          |            0 |
| Priya         |            0 |
+---------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT E1.EmpName AS 'Employee Name', E2.EmpName = ANY ( SELECT EmpName FROM EMP AS E3 WHERE E3.EmpID = E2.EmpID ) AS 'Manager Name' FROM EMP AS E1 JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
+---------------+--------------+
| Employee Name | Manager Name |
+---------------+--------------+
| Amit          |            1 |
| Amit          |            1 |
| Priya         |            1 |
| Priya         |            1 |
| Amit          |            1 |
| Amit          |            1 |
| Priya         |            1 |
+---------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT E1.EmpName AS 'Employee Name', ( SELECT EmpName FROM EMP AS E3 WHERE E3.EmpID = E2.EmpID ) AS 'Manager Name' FROM EMP AS E1 JOIN EMP AS E2 ON E1.EmpID = E2.ManagerID;
+---------------+--------------+
| Employee Name | Manager Name |
+---------------+--------------+
| Amit          | Priya        |
| Amit          | Rahul        |
| Priya         | Sneha        |
| Priya         | Vijay        |
| Amit          | Neha         |
| Amit          | Karan        |
| Priya         | Pooja        |
+---------------+--------------+
7 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_assignment4 |
+-----------------------+
| dept                  |
| emp                   |
| empbackup             |
| project               |
| projectarchive        |
+-----------------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM EMP;
+-------+---------+----------+--------+-----------+
| EmpID | EmpName | Salary   | DeptID | ManagerID |
+-------+---------+----------+--------+-----------+
|     1 | Amit    | 60000.00 |     10 |      NULL |
|     2 | Priya   | 55000.00 |     10 |         1 |
|     3 | Rahul   | 45000.00 |     10 |         1 |
|     4 | Sneha   | 50000.00 |     10 |         2 |
|     5 | Vijay   | 40000.00 |     10 |         2 |
|     6 | Neha    | 42000.00 |     10 |         1 |
|     7 | Karan   | 35000.00 |     20 |         1 |
|     8 | Pooja   | 30000.00 |   NULL |         2 |
+-------+---------+----------+--------+-----------+
8 rows in set (0.00 sec)

mysql> ```sql
    `> SELECT
    `>     E1.EmpName AS 'Employee Name',
    `>     E2.EmpName AS 'Manager Name'
    `> FROM EMP AS E1
    `> JOIN EMP AS E2
    `>     ON E1.ManagerID = E2.EmpID;
    `> 
    `> 
    `> ^C
mysql> SELECT E1.EmpName AS 'Employee Name', E2.EmpName AS 'Manager Name' FROM EMP AS E1 JOIN EMP AS E2 ON E1.ManagerID = E2.EmpID;
+---------------+--------------+
| Employee Name | Manager Name |
+---------------+--------------+
| Priya         | Amit         |
| Rahul         | Amit         |
| Sneha         | Priya        |
| Vijay         | Priya        |
| Neha          | Amit         |
| Karan         | Amit         |
| Pooja         | Priya        |
+---------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM DEPT;
+--------+-----------+----------+--------------+
| DeptID | DeptName  | Location | ParentDeptID |
+--------+-----------+----------+--------------+
|     10 | IT        | Mumbai   |         NULL |
|     20 | HR        | Pune     |         NULL |
|     30 | Finance   | Mumbai   |         NULL |
|     40 | Marketing | Delhi    |         NULL |
|     50 | Sales     | Pune     |         NULL |
+--------+-----------+----------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT D1.DeptName AS 'Parent Department Name', D2.DeptName AS 'Department Name' FROM DEPT AS D1 JOIN DEPT AS D2 ON D1.ParentDeptID = D2.DeptID;
Empty set (0.00 sec)

mysql> ```sql
    `> SELECT
    `>     D1.DeptName AS 'Parent Department Name',
    `>     D2.DeptName AS 'Department Name'
    `> FROM DEPT AS D1
    `> JOIN DEPT AS D2
    `>     ON D2.ParentDeptID = D1.DeptID;
    `> ```
    -> ^C
mysql> SELECT
    ->     D1.DeptName AS 'Parent Department Name',
    ->     D2.DeptName AS 'Department Name'
    -> FROM DEPT AS D1
    -> JOIN DEPT AS D2
    ->     ON D2.ParentDeptID = D1.DeptID;
Empty set (0.00 sec)

mysql> SELECT * FROM PROJECT;
+-----------+---------------------+-----------+--------+------------------+
| ProjectID | ProjectName         | Budget    | DeptID | RelatedProjectID |
+-----------+---------------------+-----------+--------+------------------+
|       101 | Website Development | 200000.00 |     10 |             NULL |
|       102 | Recruitment Portal  | 100000.00 |     20 |             NULL |
|       103 | Banking System      | 300000.00 |     30 |              101 |
|       104 | Marketing Campaign  |  80000.00 |     40 |              101 |
|       105 | Sales Dashboard     | 120000.00 |     50 |              104 |
+-----------+---------------------+-----------+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT P1.ProjectName AS 'Related Project Name', P2.ProjectName AS 'Project Name' FROM PROJECT AS P1 JOIN PROJECT AS P2 ON P2.RelatedProjectID = P1.ProjectID; 
+----------------------+--------------------+
| Related Project Name | Project Name       |
+----------------------+--------------------+
| Website Development  | Banking System     |
| Website Development  | Marketing Campaign |
| Marketing Campaign   | Sales Dashboard    |
+----------------------+--------------------+
3 rows in set (0.00 sec)

mysql> NOTEE;
