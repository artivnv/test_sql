Есть следующие таблицы: Emps – сотрудник, Deps – отдел и Salary – зарплата. В каждом отделе трудится от 0 до N сотрудников. Каждому сотруднику начисляется зарплата. Зарплата сотрудника меняется с течением времени. Имя сотрудника и наименование отдела считать уникальными.

![alt text](https://raw.githubusercontent.com/artivnv/test_sql/master/ER.png)


В файле test_DB.sql хранится созданная и заполненная тестовая база.


1.	Вывести список отделов с сотрудниками.
```
SELECT dep_name, emp_name
FROM Deps, Emps
WHERE Deps.dep_id = Emps.dep_id
ORDER BY dep_name;
```
2.	Вывести список отделов с сотрудниками, как в первом задании, таким образом, чтобы в нем отражались отделы, в которых вообще нет сотрудников.
```
SELECT Deps.dep_name, Emps.emp_name
FROM Deps
LEFT OUTER JOIN Emps ON Deps.dep_id = Emps.dep_id
ORDER BY dep_name;
```
3. Для каждого отдела вывести количество работающих в нем сотрудников.
```
SELECT dep_name, COUNT(emp_name) AS count
FROM Deps
LEFT OUTER JOIN Emps ON Deps.dep_id = Emps.dep_id
GROUP BY dep_name;
```
4.	Вывести отдел с максимальным количеством сотрудников.
```
SELECT dep_name, MAX(COUNT)
FROM (
SELECT dep_name, COUNT(emp_name) AS count
FROM Deps, Emps
WHERE Deps.dep_id = Emps.dep_id
GROUP BY dep_name
);
```
5.	Вывести для сотрудника с именем Bart Simpson, как изменялась его зарплата с течением времени.
```
SELECT emp_name, sum, date
FROM Emps, Salary
WHERE Salary.emp_id = Emps.emp_id AND emp_name='Bart Simpson'
GROUP BY date;
```
6.	Вывести действующую на текущую дату зарплату сотрудника Lisa Simpson.
```
SELECT emp_name, sum, MAX(date), CURRENT_DATE
FROM Emps, Salary
WHERE Salary.emp_id = Emps.emp_id AND emp_name='Lisa Simpson';
```
