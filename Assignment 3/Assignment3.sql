mysql> SHOW DATABASES;
+---------------------------+
| Database                  |
+---------------------------+
| assignment2               |
| assignment3               |
| information_schema        |
| learn                     |
| library_management_system |
| mysql                     |
| performance_schema        |
| sys                       |
+---------------------------+
8 rows in set (0.11 sec)

mysql> USE ASSIGNMENT3
Database changed
mysql> SHOW TABLES;
Empty set (0.03 sec)

mysql> CREATE TABLE Dept (
    ->     DeptID INT PRIMARY KEY,
    ->     DeptName VARCHAR(50),
    ->     Location VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> CREATE TABLE Employee (
    ->     EmpID INT PRIMARY KEY,
    ->     EmpName VARCHAR(50),
    ->     DeptID INT,
    ->     Salary DECIMAL(10,2),
    ->     JoiningDate DATE,
    ->     FOREIGN KEY (DeptID) REFERENCES Dept(DeptID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Dept (DeptID, DeptName, Location) VALUES
    -> (10, 'IT', 'Pune'),
    -> (20, 'HR', 'Mumbai'),
    -> (30, 'Finance', 'Pune'),
    -> (40, 'Sales', 'Delhi'),
    -> (50, 'Marketing', 'Mumbai');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Employee
    -> (EmpID, EmpName, DeptID, Salary, JoiningDate)
    -> VALUES
    -> (1, 'Amit', 10, 45000, '2020-02-15'),
    -> (2, 'Arjun', 10, 60000, '2021-05-10'),
    -> (3, 'Kiran', 10, 55000, '2022-03-20'),
    -> (4, 'Rahul', 10, 40000, '2020-11-01'),
    -> (5, 'Varun', 10, 35000, '2021-07-12'),
    -> (6, 'Ananya', 10, 70000, '2019-06-25'),
    -> (7, 'Rohan', 20, 30000, '2020-01-10'),
    -> (8, 'Priya', 20, 50000, '2021-08-18'),
    -> (9, 'Karan', 20, 40000, '2022-02-14'),
    -> (10, 'Meera', 30, 65000, '2020-09-05'),
    -> (11, 'Sagar', 30, 55000, '2021-12-15'),
    -> (12, 'Niranjan', 30, 45000, '2023-01-20'),
    -> (13, 'Aarav', 40, 35000, '2020-06-30'),
    -> (14, 'Mohan', 40, 40000, '2021-04-12'),
    -> (15, 'Sara', 40, 30000, '2022-10-08'),
    -> (16, 'Rakesh', 40, NULL, '2021-02-17'),
    -> (17, 'Tarun', 50, 50000, '2020-12-01'),
    -> (18, 'Kavita', 50, 60000, '2021-09-25'),
    -> (19, 'Asha', 50, NULL, '2022-05-19'),
    -> (20, 'Nirav', 50, 45000, '2023-07-11');
Query OK, 20 rows affected (0.01 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Dept;
+--------+-----------+----------+
| DeptID | DeptName  | Location |
+--------+-----------+----------+
|     10 | IT        | Pune     |
|     20 | HR        | Mumbai   |
|     30 | Finance   | Pune     |
|     40 | Sales     | Delhi    |
|     50 | Marketing | Mumbai   |
+--------+-----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Employee;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    16 | Rakesh   |     40 |     NULL | 2021-02-17  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|    19 | Asha     |     50 |     NULL | 2022-05-19  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
+-------+----------+--------+----------+-------------+
20 rows in set (0.00 sec)

mysql> SELECT DeptID, AVG(Salary)
    -> FROM EMPLOYEE
    -> GROUP BY DeptID;
+--------+--------------+
| DeptID | AVG(Salary)  |
+--------+--------------+
|     10 | 50833.333333 |
|     20 | 40000.000000 |
|     30 | 55000.000000 |
|     40 | 35000.000000 |
|     50 | 51666.666667 |
+--------+--------------+
5 rows in set (0.01 sec)

mysql> SELECT DeptID, COUNT(*)
    -> FROM EMPLOYEE
    -> GROUP BY DeptID;
+--------+----------+
| DeptID | COUNT(*) |
+--------+----------+
|     10 |        6 |
|     20 |        3 |
|     30 |        3 |
|     40 |        4 |
|     50 |        4 |
+--------+----------+
5 rows in set (0.01 sec)

mysql> SELECT DeptID, COUNT(*) FROM EMPLOYEE GROUP BY DeptID HAVING COUNT(*) > 5;
+--------+----------+
| DeptID | COUNT(*) |
+--------+----------+
|     10 |        6 |
+--------+----------+
1 row in set (0.03 sec)

mysql> SELECT DISTINCT Location FROM DEPT;
+----------+
| Location |
+----------+
| Pune     |
| Mumbai   |
| Delhi    |
+----------+
3 rows in set (0.03 sec)

mysql> SELECT MAX(Salary) FROM EMPLOYEE;
+-------------+
| MAX(Salary) |
+-------------+
|    70000.00 |
+-------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(*) FROM EMPLOYEE;
+----------+
| COUNT(*) |
+----------+
|       20 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    16 | Rakesh   |     40 |     NULL | 2021-02-17  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|    19 | Asha     |     50 |     NULL | 2022-05-19  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
+-------+----------+--------+----------+-------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE EmpName LIKE 'A%';
+-------+---------+--------+----------+-------------+
| EmpID | EmpName | DeptID | Salary   | JoiningDate |
+-------+---------+--------+----------+-------------+
|     1 | Amit    |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun   |     10 | 60000.00 | 2021-05-10  |
|     6 | Ananya  |     10 | 70000.00 | 2019-06-25  |
|    13 | Aarav   |     40 | 35000.00 | 2020-06-30  |
|    19 | Asha    |     50 |     NULL | 2022-05-19  |
+-------+---------+--------+----------+-------------+
5 rows in set (0.03 sec)

mysql> SELECT * FROM EMPLOYEE WHERE EmpName LIKE '%N';
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
+-------+----------+--------+----------+-------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE EmpName LIKE '%n';
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
+-------+----------+--------+----------+-------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE EmpName LIKE '%ra%';
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    16 | Rakesh   |     40 |     NULL | 2021-02-17  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
+-------+----------+--------+----------+-------------+
9 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE ORDER BY Salary DESC;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    16 | Rakesh   |     40 |     NULL | 2021-02-17  |
|    19 | Asha     |     50 |     NULL | 2022-05-19  |
+-------+----------+--------+----------+-------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE ORDER BY DeptID ASC AND Salary DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AND Salary DESC' at line 1
mysql> SELECT * FROM EMPLOYEE ORDER BY DeptID ASC, Salary DESC;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    16 | Rakesh   |     40 |     NULL | 2021-02-17  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
|    19 | Asha     |     50 |     NULL | 2022-05-19  |
+-------+----------+--------+----------+-------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 30000 AND 60000;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
+-------+----------+--------+----------+-------------+
16 rows in set (0.02 sec)

mysql> SELECT * FROM EMPLOYEE WHERE DeptID IN (10, 20, 30);
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
+-------+----------+--------+----------+-------------+
12 rows in set (0.02 sec)

mysql> SELECT MIN(Salary) FROM EMPLOYEE;
+-------------+
| MIN(Salary) |
+-------------+
|    30000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE JoiningDate BETWEEN '2020-01-01' AND '2021-12-31';
+-------+---------+--------+----------+-------------+
| EmpID | EmpName | DeptID | Salary   | JoiningDate |
+-------+---------+--------+----------+-------------+
|     1 | Amit    |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun   |     10 | 60000.00 | 2021-05-10  |
|     4 | Rahul   |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun   |     10 | 35000.00 | 2021-07-12  |
|     7 | Rohan   |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya   |     20 | 50000.00 | 2021-08-18  |
|    10 | Meera   |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar   |     30 | 55000.00 | 2021-12-15  |
|    13 | Aarav   |     40 | 35000.00 | 2020-06-30  |
|    14 | Mohan   |     40 | 40000.00 | 2021-04-12  |
|    16 | Rakesh  |     40 |     NULL | 2021-02-17  |
|    17 | Tarun   |     50 | 50000.00 | 2020-12-01  |
|    18 | Kavita  |     50 | 60000.00 | 2021-09-25  |
+-------+---------+--------+----------+-------------+
13 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE Salary IS NULL;
+-------+---------+--------+--------+-------------+
| EmpID | EmpName | DeptID | Salary | JoiningDate |
+-------+---------+--------+--------+-------------+
|    16 | Rakesh  |     40 |   NULL | 2021-02-17  |
|    19 | Asha    |     50 |   NULL | 2022-05-19  |
+-------+---------+--------+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE WHERE Salary IS NOT NULL;
+-------+----------+--------+----------+-------------+
| EmpID | EmpName  | DeptID | Salary   | JoiningDate |
+-------+----------+--------+----------+-------------+
|     1 | Amit     |     10 | 45000.00 | 2020-02-15  |
|     2 | Arjun    |     10 | 60000.00 | 2021-05-10  |
|     3 | Kiran    |     10 | 55000.00 | 2022-03-20  |
|     4 | Rahul    |     10 | 40000.00 | 2020-11-01  |
|     5 | Varun    |     10 | 35000.00 | 2021-07-12  |
|     6 | Ananya   |     10 | 70000.00 | 2019-06-25  |
|     7 | Rohan    |     20 | 30000.00 | 2020-01-10  |
|     8 | Priya    |     20 | 50000.00 | 2021-08-18  |
|     9 | Karan    |     20 | 40000.00 | 2022-02-14  |
|    10 | Meera    |     30 | 65000.00 | 2020-09-05  |
|    11 | Sagar    |     30 | 55000.00 | 2021-12-15  |
|    12 | Niranjan |     30 | 45000.00 | 2023-01-20  |
|    13 | Aarav    |     40 | 35000.00 | 2020-06-30  |
|    14 | Mohan    |     40 | 40000.00 | 2021-04-12  |
|    15 | Sara     |     40 | 30000.00 | 2022-10-08  |
|    17 | Tarun    |     50 | 50000.00 | 2020-12-01  |
|    18 | Kavita   |     50 | 60000.00 | 2021-09-25  |
|    20 | Nirav    |     50 | 45000.00 | 2023-07-11  |
+-------+----------+--------+----------+-------------+
18 rows in set (0.00 sec)

mysql> SELECT SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary > 100000;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary > 100000);
Empty set (0.00 sec)

mysql> SELECT SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary >= 100000);
Empty set (0.00 sec)

mysql> SELECT DeptID, SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary >= 100000);
Empty set (0.00 sec)

mysql> SELECT SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary) > 100000;
+-------------+
| SUM(Salary) |
+-------------+
|   305000.00 |
|   120000.00 |
|   165000.00 |
|   105000.00 |
|   155000.00 |
+-------------+
5 rows in set (0.00 sec)

mysql> SELECT DeptID, SUM(Salary) FROM EMPLOYEE GROUP BY DeptID HAVING SUM(Salary) > 100000;
+--------+-------------+
| DeptID | SUM(Salary) |
+--------+-------------+
|     10 |   305000.00 |
|     20 |   120000.00 |
|     30 |   165000.00 |
|     40 |   105000.00 |
|     50 |   155000.00 |
+--------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT DISTINCT EmpName FROM EMPLOYEE;
+----------+
| EmpName  |
+----------+
| Amit     |
| Arjun    |
| Kiran    |
| Rahul    |
| Varun    |
| Ananya   |
| Rohan    |
| Priya    |
| Karan    |
| Meera    |
| Sagar    |
| Niranjan |
| Aarav    |
| Mohan    |
| Sara     |
| Rakesh   |
| Tarun    |
| Kavita   |
| Asha     |
| Nirav    |
+----------+
20 rows in set (0.00 sec)

mysql> SELECT Location, COUNT(*) FROM DEPT GROUP BY DeptID HAVING COUNT(*) > 1;
Empty set (0.00 sec)

mysql> SELECT Location, COUNT(*) FROM DEPT GROUP BY DeptID HAVING COUNT(*) > 0;
+----------+----------+
| Location | COUNT(*) |
+----------+----------+
| Pune     |        1 |
| Mumbai   |        1 |
| Pune     |        1 |
| Delhi    |        1 |
| Mumbai   |        1 |
+----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPT;
+--------+-----------+----------+
| DeptID | DeptName  | Location |
+--------+-----------+----------+
|     10 | IT        | Pune     |
|     20 | HR        | Mumbai   |
|     30 | Finance   | Pune     |
|     40 | Sales     | Delhi    |
|     50 | Marketing | Mumbai   |
+--------+-----------+----------+
5 rows in set (0.00 sec)

mysql> SELECT Location, COUNT(*) FROM DEPT GROUP BY Location HAVING COUNT(*) > 0;
+----------+----------+
| Location | COUNT(*) |
+----------+----------+
| Pune     |        2 |
| Mumbai   |        2 |
| Delhi    |        1 |
+----------+----------+
3 rows in set (0.04 sec)

mysql> SELECT Location, COUNT(*) FROM DEPT GROUP BY Location HAVING COUNT(*) > 1;
+----------+----------+
| Location | COUNT(*) |
+----------+----------+
| Pune     |        2 |
| Mumbai   |        2 |
+----------+----------+
2 rows in set (0.00 sec)

mysql> NOTEE;
