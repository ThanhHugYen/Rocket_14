CREATE DATABASE IF NOT EXISTS QlyVTI;
USE QlyVTI;

CREATE TABLE Department
( 	Department_Number INT auto_increment primary key ,
	Department_Name VARCHAR(255) NOT NULL );
    
CREATE TABLE Employee_Table 
(
	Employee_Number INT auto_increment primary key ,
    Employee_Name VARCHAR(255) NOT NULL,
    Department_Number INT ,
    FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number) on delete cascade);
    
CREATE TABLE Employee_Skill_Table
(
	Employee_Number INT ,
    Skill_Code VARCHAR(255) NOT NULL ,
    Date_Registered DATE NOT NULL ,
FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number) ON DELETE CASCADE);

INSERT INTO Department(Department_Name)
VALUES 		( "Sale"),
			(	"Research"),
			(	"Quality Management"),
			(	"Production"),
			(	"Marketing"),
			(	"Human Resources"),
			(	"Finance"),
			(	"Development"),
			(	"Customer Service"),
			(	"Training ");
                
SELECT *FROM Department;
INSERT INTO Employee_Table(Employee_Name,Department_Number)
VALUES 		( "Joletta Rendall",2),	
			("Trina Dyka",	3),
            ( "Truman Atkinson",4),	
			("Moritz Fricker",	1),
            ( "Bart Lilly",1),	
			("Ennis Butterly",	5),
            ( "Karmen Redon",8),	
			("Damara Kelshaw",	9),
            ( "Harmon Endersby",9),	
			("Ami Normand ",	10),
            ( "Joletta Rendall",10),	
			("Trina Dyka",	7),
            ( "Joletta Rendall",10),	
			("Trina Dyka",	6);
select*from Employee_Table;

INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered )
VALUES 		( 1,"JAVA","2019-2-5"),
			( 2,"JAVA","2019-4-3"),
            ( 2,"PYTHON","2020-2-15"),
            ( 3,"PHP","2019-12-5"),
            ( 3,"JAVA","2020-1-5"),
            ( 3,"HTML","2020-2-7"),
            ( 4,"MYSQL","2020-5-5"),
            ( 5,"JAVA","2019-2-17"),
			( 5,"HTML","2021-3-25"),
            ( 6,"CSS","2019-6-15"),
            ( 7,"MYSQL","2020-7-23"),
            ( 8,"JAVA","2020-2-1"),
            ( 9,"HTML","2019-12-25"),
            ( 9,"CSS","2019-6-28");
SELECT*FROM Employee_Skill_Table;
SELECT *FROM Department;
select*from Employee_Table;

			
-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT 
    et.Employee_Number, et.Employee_Name, est.Skill_Code
FROM
    Employee_Table et
        JOIN
    Employee_Skill_Table est ON et.Employee_Number = est.Employee_Number
WHERE
    Skill_Code = 'JAVA';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên
SELECT 
    d.Department_Number,
    d.Department_Name,
    COUNT(e.Employee_Number) AS number_emp
FROM
    employee_table e
        JOIN
    department d ON e.Department_Number = d.Department_Number
GROUP BY d.Department_Number
HAVING number_emp > 2;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT 
    d.Department_Number, e.Employee_Name
FROM
    employee_table e
        JOIN
    department d ON e.Department_Number = d.Department_Number
ORDER BY d.Department_Number;

-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT 
    e.*, COUNT(s.Skill_Code) number_skill
FROM
    Employee_Skill_Table s
        JOIN
    Employee_Table e ON e.Employee_Number = s.Employee_Number
GROUP BY Employee_Number
HAVING number_skill > 1;

