-- формирование таблицы Departments;

CREATE TABLE IF NOT EXISTS departments (
	department_ID SERIAL NOT NULL PRIMARY KEY,
	department_name VARCHAR(120) NOT NULL,
	chief_ID INTEGER NOT NULL REFERENCES chief_department(chief_ID)
);

-- формирование таблицы Employee;

CREATE TABLE IF NOT EXISTS employee (
	employee_ID SERIAL NOT NULL PRIMARY KEY,
	employee_name VARCHAR(120) NOT NULL,
	department_ID INTEGER NOT NULL REFERENCES chief_department(department_ID),
	chief_ID INTEGER NOT NULL REFERENCES chief_department(chief_ID)
);

-- формирование таблицы Chief - Department;

CREATE TABLE IF NOT EXISTS chief_department (
	department_ID INTEGER NOT NULL REFERENCES departments(department_ID),
	chief_ID INTEGER NOT NULL REFERENCES employee(employee_ID),
	CONSTRAINT primary_key PRIMARY KEY (department_ID, chief_ID)
);
