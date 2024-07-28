
# SQL Courses

[SQL - Intro to Computer Science - Harvard's CS50 (2018)](https://www.youtube.com/watch?v=TplT4qjz1RQ)

[SQL Tutorial - Full Database Course for Beginners](https://www.youtube.com/watch?v=HXV3zeQKqGY)

[SQLBolt - Learn SQL - SQL Lesson 1: SELECT queries 101](https://sqlbolt.com/lesson/select_queries_introduction)

# My code

[sql-code.txt](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/sql-code.txt)

[Oracle](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Oracle%209927d3fac48d4612bea60349fc695d82.md)

# SQL online practice

[SQLite online](https://sqliteonline.com/)

# SQL basis

**SQL** (Structured Query Language) is one of the languages with which we can communicate with databases. SQL is the general language, but different organisations have come up with their own dialects. 

SQLite, for example, which generally follows PostgreSQL syntax, defines a specific set of supported datatypes:

- BLOB
- INTEGER
    - smallint (2 bytes)
    - integer (4 bytes)
    - bigint (8 bytes or 32 bytes )
- NUMERIC
    - boolean
    - date
    - datetime
    - numeric(scale,precision)
    - time
    - timestamp
- REAL
    - real
    - double precision
- TEXT
    - char(n)
    - varchar(n)
    - text
    

Most common datatypes:

- INT - whole numbers
- DECIMAL (M,N) - decimal numbers
- VARCHAR(n) - string of text
- BLOB - Binary Large OBject
- DATE - 'YYYY-MM-DD'
- TIMESTAMP - 'YYYY-MM-DD HH:MM:SS'

Using a specific data type for asking the server for data can improve the response time of the query.

# SQL queries

## Create a database (in MySQL)

```sql
create database my_cool_db;
```

## Create a table

To create a table, we use the following statement:

```sql
-- Create a table called 'registrants' with columns named 'id', 'name', and 'dorm'
CREATE TABLE 'registrants' ('id' integer, 'name' varchar(255), 'dorm' varchar(255));
```

And we can make something more complex, like defining a group of primary keys and a set of foreign keys:

```sql
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);
```

### Primary key

A primary key is the column or columns that contain values that uniquely identify each row in a table. A database table must have a primary key to insert, update, restore, or delete data from a database table.

```sql
CREATE TABLE 'registrants' ('id' integer PRIMARY KEY, 'name' varchar(255), 'dorm' varchar(255)); 
```

### Autoincrement

Setting this flag to true tells the database that the field will auto increment when a new record is added.

```sql
CREATE TABLE 'registrants' ('id' integer PRIMARY KEY AUTOINCREMENT, 'name' varchar(255), 'dorm' varchar(255)); 
```

### Not null

If we don't want to allow a certain field to be null, we need to set it as 'NOT NULL':

```sql
CREATE TABLE 'registrants' ('id' integer PRIMARY KEY AUTOINCREMENT NOT NULL, 'name' varchar(255), 'dorm' varchar(255)); 
```

## View a table

To view the freshly created table (in sqlite3):

```sql
.schema
```

To view the table using SQL queries:

```sql
DESCRIBE name_of_table;
```

## Alter table

If we want to add a new field or modify an existent one, we can use the `ALTER` command.

To add a new column to a table:

```sql
ALTER TABLE 'registrants' ADD 'phone' integer;
```

To delete a column from a table:

```sql
ALTER TABLE my_table DROP COLUMN my_column;
```

To modify a column:

```sql
-- In MySQL:
ALTER TABLE students MODIFY name VARCHAR(255) NOT NULL;
-- In SQL:
ALTER TABLE students ALTER COLUMN name VARCHAR(255) NOT NULL;
```

We can alter a table to set foreign keys as follows:

```sql
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;
```

## Delete a table

To delete a table:

```sql
DROP TABLE name_of_table;
```

## Insert data into table

To insert data into a table, we use the following statement:

```sql
INSERT INTO registrants (id, name, dorm) VALUES(1, 'Brian', 'Pennypacker');
-- or
INSERT INTO registrants VALUES(1, 'Brian', 'Pennypacker'); -- The values must be in order and we can use 'NULL' to skip columns.
```

## Select (get) data from a table

To select everything from a table:

```sql
SELECT * FROM registrants;
```

To filter the selected data:

```sql
SELECT * FROM registrants WHERE dorm = "Pennypacker";
-- or
SELECT * FROM students WHERE major <> 'Eng';
```

To select a specific column from the table given a condition:

```sql
SELECT name FROM registrants WHERE dorm = "Pennypacker";
-- or
SELECT table_name.column FROM table_name WHERE condition = 'value';
```

Select data and order it:

```sql
SELECT students.name, students.major FROM students ORDER BY name DESC; -- or: ASC
-- or
SELECT students.name, students.major FROM students ORDER BY name ASC, major DESC;
```

To limit the number of results:

```sql
SELECT * FROM students LIMIT 2;
```

## Update data

To update an existing entry in a table:

```sql
UPDATE registrants SET dorm='Canaday' WHERE id = 1;
-- or
UPDATE students SET major='Social Science' WHERE major='Sociology' OR major = 'Psichology';
-- or
UPDATE students SET name='Hermione', major='Potions' WHERE name='Harry';
```

## Delete data

To delete an entry from a table:

```sql
DELETE FROM registrants WHERE id = 1;
-- or
DELETE FROM students; -- WARNING: this will delete all rows
```

## Delete data when there are foreign keys involved

Scenario:

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled.png)

What would happen if we delete the 'AC/DC' row from the 'artists' table? How this will affect the 'albums' table, in which certain rows have the 'artist_id' as a foreign key?

When this situation occurs we can do two things:

- Use `ON DELETE SET NULL`: when we use this option during the creation of the foreign key (in the 'albums' table), its value will be set to `NULL` once the primary key to which the foreign key points to is deleted.

```sql
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

DELETE FROM employee
WHERE emp_id = 102;

SELECT *
FROM branch;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%201.png)

- Use `ON DELETE CASCADE`: when we use this option during the creation of the foreign key (in the 'albums' table), its value will be **deleted** once the primary key to which the foreign key points to is deleted.

```sql
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

SELECT * FROM branch_supplier;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%202.png)

```sql
DELETE FROM branch
WHERE branch.branch_id = 2;

SELECT * FROM branch_supplier;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%203.png)

### When to use each solution

If the key that was deleted is part of the primary key in our table, we should use the ON `DELETE CASCADE`. If the key that was deleted is a foreign key in our table, or if its importance is not high, we can use `ON DELETE SET NULL` (this is the situation that we have in the screenshot above).

## Indexes

The `CREATE INDEX` statement is used to create indexes in tables.

Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

```sql
CREATE INDEX index_name ON table_name (column1, column2, ...);
```

*Source: [https://www.w3schools.com/sql/sql_create_index.asp](https://www.w3schools.com/sql/sql_create_index.asp)*

## Constraints

There are several constraints that we can apply to our columns:

- `NOT NULL`
- `UNIQUE`
- `DEFAULT 'default_value'`
- `AUTO_INCREMENT`

## Functions

SQL functions are blocks of code that can be called in our queries.

- `COUNT()`

```sql
SELECT COUNT(emp_id)
FROM employee;
```

- `AVG()`

```sql
SELECT AVG(salary)
FROM employee;
```

- `SUM()`

```sql
SELECT SUM(salary)
FROM employee;
```

- `CONCAT()`

```sql
-- Find a list of all money spent or earned by the company

SELECT CONCAT('-', salary)
FROM employee
UNION
SELECT total_sales
FROM works_with;
```

When working with number fields we can use the following functions:

- `AVG`
- `COUNT`
- `MAX`
- `MIN`
- `SUM`
- ...

## Grouping information (aggregation)

We can use `GROUP BY` to group information:

```sql
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;
```

## Wildcards

SQL presents a series of wildcards we can use in our queries:

- `%` (matches any number of characters)
- `_` (matches one character)

We should use the keyword `LIKE` instead of an equal sign when utilising the wildcards in our queries.

Example:

```sql
SELECT * 
FROM client
WHERE client_name LIKE '%LLC';
```

If we want to get data that matches certain pattern, we can the `LIKE` keyword and the `%` character as a wildcard (a placeholder for any kind of text):

```sql
SELECT * FROM albums WHERE title LIKE '%Wall';
```

This will start at the top of the table and search everything for a title matching `'Wall'`. In order to speed up this process we can use indexes.

If we know that certain column will be used for searching, we should index it.

## Unions

We can combine multiple `SELECT` statements into a single query by using the `UNION` keyword:

```sql
-- Find a list of employee, branch, and client names

SELECT first_name AS 'Name'
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;
```

Rules to make `UNION` work:

- All the involved `SELECT` statements should have the **same amount of columns**.
- All the involved `SELECT` statements should have a **similar data type**.

## Joins

*Source: [https://dataschool.com/learn-sql/joins/](https://dataschool.com/learn-sql/joins/)*

Suppose we have two tables with a shared field:

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled.png)

If we want to get the data from the first table and the one from the second table, we need to `join` them:

```sql
SELECT * FROM albums JOIN artist ON artist_id = artists.id;
-- or
SELECT * FROM albums, artists WHERE albums.artist_id = artists.id;
```

If we need to combine multiple rows on different tables we can use `JOIN` to do so by using common column as joining point (`ON`):

```sql
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;
```

We can use 4 different types of `JOIN`:

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%204.png)

- `INNER JOIN` (or just `JOIN`): combines rows from two tables whenever they share a common column.

```sql
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%205.png)

- `LEFT JOIN`: combines rows from two tables maintaining all rows from the first one (the left table).

```sql
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%206.png)

- `RIGHT JOIN`: combines rows from two tables maintaining all rows from both tables.

```sql
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%207.png)

- `FULL OUTER JOIN`: combines rows from two tables maintaining all rows from the second one (the right table).
    
    MySQL does not support this kind of join, but we can implement a workaround:
    

```sql
SELECT * FROM t1
LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id
```

Which in our case will be:

```sql
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id
UNION
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%208.png)

## Nested queries

Nested queries are useful for accessing information in a more complex manner.

By using the `IN` keyword we can use an array to search for values that are equal to any of the values in that array:

```sql
SELECT * FROM students WHERE name IN ('Kate', 'Ron');
```

And the array can be returned from another query:

```sql
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);
```

## Triggers

A trigger is a block of SQL code that will define certain action that should happen when certain operation is performed on the database.

First, we need to change the default SQL delimiter from a semicolon (`;`) to something else, like `$$`, so we can write our trigger and use semicolons is a way that prevents SQL from interpreting those semicolons as the end of the statement.

```sql
DELIMITER $$
    ...
DELIMITER;
```

The next step is to write the actual trigger. In this case, the trigger will be triggered before a new `INSERT` is performed into the `employee` table:

```sql
DELIMITER $$
	CREATE
		TRIGGER my_trigger BEFORE INSERT
		ON employee
		FOR EACH ROW BEGIN
			INSERT INTO trigger_test VALUES('added new employee');
		END$$
DELIMITER ;
```

For each of those insertions, the trigger will insert an 'added new employee' message into the `trigger_test` table.

We should do this in the terminal, because PopSQL does not allow to change the delimiter:

```bash
mysql> use my_cool_db
No connection. Trying to reconnect...
Connection id:    18
Current database: *** NONE ***

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> DELIMITER $$
mysql> CREATE
    ->         TRIGGER my_trigger BEFORE INSERT
    ->         ON employee
    ->         FOR EACH ROW BEGIN
    ->             INSERT INTO trigger_test VALUES('added new employee');
    ->         END$$
Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
```

Now, when we add a new employee to our table, the trigger should add a new message to the `trigger_test` table:

```sql
SELECT *
FROM trigger_test;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%209.png)

```sql
INSERT INTO employee
VALUE(10, 'John', 'Doe', '1981-01-24', 'M', 20000, NULL, NULL);

select * 
FROM employee;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2010.png)

```sql
SELECT *
FROM trigger_test;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2011.png)

We can create a trigger that inserts a column from the table the trigger is listening to into the table the trigger will write to:

```sql
DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name); -- NEW: the newly inserted row
    END$$
DELIMITER ;

INSERT INTO employee
VALUE(11, 'Jane', 'Doe', '1985-10-24', 'F', 25000, NULL, NULL);

SELECT *
FROM trigger_test;
```

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2012.png)

We can also use conditionals in our triggers:

```sql
DELIMITER $$
CREATE
    TRIGGER my_trigger3 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES('added female employee');
        ELSE
            INSERT INTO trigger_test VALUES('added another employee');
        END IF;
    END$$
DELIMITER ;
```

We can create triggers for any of these operations:

- `INSERT`
- `UPDATE`
- `DELETE`

We can also trigger `BEFORE` or `AFTER` an operation.

We can also `DROP` a trigger:

```sql
DROP TRIGGER my_trigger;
```

# Entity Relationship (ER) diagrams

**Database schema:** a collection of tables, attributes, and data relationships.

**Entity:** an object we want to model and store information about.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2013.png)

**Attributes:** specific pieces of information about an entity.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2014.png)

**Primary key:** an attribute(s) that uniquely identify an entry in the database table.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2015.png)

**Composite Attribute:** an attribute that can be broken down into sub-attributes.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2016.png)

**Multi-valued Attribute:** an attribute that can have more than one value.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2017.png)

**Derived Attribute:** an attribute that can be derived from the other attributes.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2018.png)

**Multiple Entities:** you can define more than one entity in the diagram. 

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2019.png)

**Relationships:** defines a relationship between two entities.

**Total participation:** all members must participate in the relationship.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2020.png)

In this case, some (single line) students take a class, but all classes (double line) are taken by students.

**Relationship Attribute:** an attribute about the relationship.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2021.png)

**Relationship Cardinality:** the number of instances of an entity from a relation that can be associated with the relation.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2022.png)

A student can take `M` number of classes, and a class can be taken by `N` number of students.

**Weak Entity:** an entity that cannot be uniquely identified by its attributes alone.

**Identifying relationship:** a relationship that serves to uniquely identify the weak entity.

![Untitled](SQL%20(full%20notes)%2001f424f3f84f47ae986d8db464e5e925/Untitled%2023.png)

A class can have an exam, but an exam cannot exist without a class.

## Converting ER diagrams into database schemas

[https://youtu.be/HXV3zeQKqGY?t=14158](https://youtu.be/HXV3zeQKqGY?t=14158)

# Advanced topics

## Race conditions

A race condition is given when two people (two threads) are trying to do the same thing at roughly the same time. For example, I chose a username on a website, and another person chose the same username at the same time, both are going to check if the username is available (check the **state variable**) and discover it is available. By the time the users clicked on 'submit', confident on having selected their usernames, the state variable could have changed. 

If race conditions are not well handled by the database, wrong data could be entered, and security issues could be risen (for example, extracting money from a bank account using multiple computers at the same time, if the state variable does not handles the race condition properly it could allow the extract much more money than what actually is present in the account).

Databases resolve this by 'locking' the state variable as a result of a query to that variable so it can guarantee atomicity (doing multiple things back to back without being interrupted until commit). More here: [https://stackoverflow.com/questions/6477574/do-database-transactions-prevent-race-conditions](https://stackoverflow.com/questions/6477574/do-database-transactions-prevent-race-conditions)

## SQL injection attacks

Source: [https://www.youtube.com/watch?v=TplT4qjz1RQ&t=6264s](https://www.youtube.com/watch?v=TplT4qjz1RQ&t=6264s)

SQL injection is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database. It generally allows an attacker to view data that they are not normally able to retrieve. This might include data belonging to other users, or any other data that the application itself is able to access. In many cases, an attacker can modify or delete this data, causing persistent changes to the application's content or behaviour.

Source: [https://portswigger.net/web-security/sql-injection](https://portswigger.net/web-security/sql-injection)

## Natural keys and Surrogate keys

A **natural key** is a single column or set of columns that uniquely identifies a single record in a table, where the key columns are made up of real data.  When I say “real data” I mean data that has meaning and occurs naturally in the world of data.  A natural key is a column value that has a relationship with the rest of the column values in a given data record.   Here are some examples of natural keys values: Social Security Number, ISBN, and TaxId.

A **surrogate key** like a natural key is a column that uniquely identifies a single record in a table.  But this is where the similarity stops.  Surrogate keys are similar to surrogate mothers.   They are keys that don’t have a natural relationship with the rest of the columns in a table.  The surrogate key is just a value that is generated and then stored with the rest of the columns in a record.

## Foreign key

A **foreign key** is a column or group of columns in a relational database table that provides a link between data in two tables. It acts as a cross-reference between tables because it references the primary key of another table, thereby establishing a link between them.

We can create a foreign key as follows:

```sql
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
```

## Composite key

Is a primary key comprised of two or more columns that, together, create a primary key.

A composite key, in the context of relational databases, is a combination of two or more columns in a table that can be used to uniquely identify each row in the table. Uniqueness is only guaranteed when the columns are combined; when taken individually the columns do not guarantee uniqueness.

## Comparison operators

- `=` (equal)
- `<>` (not equal)
- `>` (greater than)
- `<` (less than)
- `>=` (greater or equal than)
- `<=` (less or equal than)
- `AND`
- `OR`

## SQL Keywords

- `AS`
- `DISTINCT`

# Related topics

## CRUD

Stands for Create, Read (Retrieve), Update and Delete. This acronym represents the four main operations that we can do in a database.

## Types of databases

### Relational Databases (SQL)

It organises data into one or more tables, each table has columns and rows, and it has unique key identifiers in each row.

### Non-relational Databases (noSQL /  not just SQL)

Organised data is not in a traditional table:

- Key-value stores
- Documents (JSON, XML, etc.)
- Graphs
- Flexible tables

Examples are:

- MongoDB
- Firebase
- DynamoDB
- Apache Cassandra

## Relational Database Management Systems (RDMS)

Help users create an maintain a relational database:

- mySQL
- Oracle
- postgreSQL
- mariaDB

The Structured Query Language (SQL) is a standardised language for interacting with RDMS that users employ to perform CRUD operations and administrative tasks. SQL code used in one specific RDMS is not always portable to another one without some modification.

# Using MySQL as a database server on macOS

1. Install MySQL from the web.
2. Add MySQL path to the `bash_profile`

```bash
echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile
```

1. Reload the `bash_profile`

```bash
. ~/.bash_profile
```

1. Execute `mysql` and log in into the SQL server

```bash
mysql -u root -p
```

Use the password defined during the installation process.

1. Change the `root` password if necessary

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
```

# Using PopSQL editor

PopSQL is a program to write SQL queries in a better manner than what can be achieved by doing so in the terminal. It is an SQL editor.