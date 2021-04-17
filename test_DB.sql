CREATE TABLE Emps(
emp_id INT(10) PRIMARY KEY,
emp_name VARCHAR(30) UNIQUE,
dep_id INT(10),
FOREIGN KEY (dep_id) REFERENCES Deps (dep_id)
);

INSERT INTO Emps VALUES(0,'Bart Simpson', 102);
INSERT INTO Emps VALUES(1,'Rick Sanchez', 101);
INSERT INTO Emps VALUES(2,'Marge Simpson', 101);
INSERT INTO Emps VALUES(3,'Lisa Simpson', 104);
INSERT INTO Emps VALUES(4,'Philip J. Fry', 102);
INSERT INTO Emps VALUES(5,'Morty Smith', 101);
INSERT INTO Emps VALUES(6,'Stewart Gilligan', 100);
INSERT INTO Emps VALUES(7,'Eric Cartman', 104);
INSERT INTO Emps VALUES(8,'Homer Simpson', 101);
INSERT INTO Emps VALUES(9,'Summer Smith', 103);

CREATE TABLE Deps(
dep_id INT(10) PRIMARY KEY,
dep_name VARCHAR(30) UNIQUE
);

INSERT INTO Deps VALUES(99,'Отдел аналитики');
INSERT INTO Deps VALUES(100,'Отдел разработки');
INSERT INTO Deps VALUES(101,'Отдел тестирования');
INSERT INTO Deps VALUES(102,'Отдел маркетинга');
INSERT INTO Deps VALUES(103,'HR отдел');
INSERT INTO Deps VALUES(104,'Отдел логистики');

CREATE TABLE Salary(
sum INT,
emp_id INT(10),
date DATE,
FOREIGN KEY (emp_id) REFERENCES Emps (emp_id)
);

INSERT INTO Salary VALUES(99000, 0, '2021-01-01');
INSERT INTO Salary VALUES(90000, 0, '2020-01-01');
INSERT INTO Salary VALUES(81000, 0, '2019-01-01');
INSERT INTO Salary VALUES(150000, 1, '2021-01-24');
INSERT INTO Salary VALUES(120000, 2, '2021-02-01');
INSERT INTO Salary VALUES(50000, 3, '2019-01-01');
INSERT INTO Salary VALUES(95000, 3, '2020-01-01');
INSERT INTO Salary VALUES(110000, 3, '2021-01-01');
INSERT INTO Salary VALUES(55000, 4, '2021-03-01');
INSERT INTO Salary VALUES(78000, 5, '2021-03-01');
INSERT INTO Salary VALUES(39000, 7, '2021-03-01');

SELECT dep_name, emp_name
FROM Deps, Emps
WHERE Deps.dep_id = Emps.dep_id
ORDER BY dep_name;

SELECT Deps.dep_name, Emps.emp_name
FROM Deps
LEFT OUTER JOIN Emps ON Deps.dep_id = Emps.dep_id
ORDER BY dep_name;

SELECT dep_name, COUNT(emp_name) AS count
FROM Deps
LEFT OUTER JOIN Emps ON Deps.dep_id = Emps.dep_id
GROUP BY dep_name;

SELECT dep_name, MAX(COUNT)
FROM (
SELECT dep_name, COUNT(emp_name) AS count
FROM Deps, Emps
WHERE Deps.dep_id = Emps.dep_id
GROUP BY dep_name
);

SELECT emp_name, sum, date
FROM Emps, Salary
WHERE Salary.emp_id = Emps.emp_id AND emp_name='Bart Simpson'
GROUP BY date;

SELECT emp_name, sum, MAX(date), CURRENT_DATE
FROM Emps, Salary
WHERE Salary.emp_id = Emps.emp_id AND emp_name='Lisa Simpson';
