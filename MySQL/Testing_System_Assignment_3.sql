-- CREATE DATABASE Testing_System_2
CREATE DATABASE IF NOT EXISTS Testing_System_3;
USE Testing_System_3;

-- CREATE TABLE Department
CREATE TABLE Department 
(
	DepartmentID 	INT 	NOT NULL AUTO_INCREMENT ,
    DepartmentName 	VARCHAR(255) NOT NULL,
PRIMARY KEY (DepartmentID)
);

-- CREATE TABLE Position
CREATE TABLE Position
(
	PositionID 		INT  AUTO_INCREMENT,
    PositionName 	VARCHAR(255) NOT NULL,
PRIMARY KEY (PositionID)
);

-- CREATE TABLE Account
CREATE TABLE Account
(
	AccountID 		INT  AUTO_INCREMENT,
    Email 			VARCHAR(255) NOT NULL,
    Username 		VARCHAR(255) NOT NULL,
    FullName 		VARCHAR(255) NOT NULL,
    DepartmentID 	INT NOT NULL,
    PositionID 		INT NOT NULL,
    CreateDate 		DATE NOT NULL ,
PRIMARY KEY ( AccountID),
FOREIGN KEY (DepartmentID) REFERENCES department (DepartmentID) ON DELETE CASCADE ,
FOREIGN KEY (PositionID) REFERENCES  Position (PositionID) ON DELETE CASCADE
);

-- CREATE TABLE Group
CREATE TABLE `Group`
(
	GroupID 		INT 	AUTO_INCREMENT,
    GroupName 		VARCHAR(255)	NOT NULL,
    CreatorID 		INT 			NOT NULL,
    CreateDate 		DATE 			NOT NULL,
PRIMARY KEY (GroupID)
);

-- CREATE TABLE GroupAccount
CREATE TABLE GroupAccount
(
	GroupID 		INT auto_increment	NOT NULL,
    AccountID 		INT 	NOT NULL,
    JoinDate 		DATE 	NOT NULL,
FOREIGN KEY (GroupID) REFERENCES  `Group` (GroupID) ON DELETE CASCADE ,
FOREIGN KEY (AccountID) REFERENCES  Account(AccountID) ON DELETE CASCADE
);

-- CREATE TABLE TypeQuestion
CREATE TABLE TypeQuestion
(
	TypeID 		INT  AUTO_INCREMENT,
    TypeName 	VARCHAR(255) NOT NULL,
PRIMARY KEY (TypeID)
);

-- CREATE TABLE CategoryQuestion
CREATE TABLE CategoryQuestion
(
	CategoryID 		INT  AUTO_INCREMENT,
    CategoryName 	VARCHAR(255) NOT NULL,
PRIMARY KEY (CategoryID)
);

-- CREATE TABLE Question
CREATE TABLE Question
( 
	QuestionID 	INT  	AUTO_INCREMENT,
    Content 	VARCHAR(255) NOT NULL,
    CategoryID 	INT  		NOT NULL,
    TypeID 		INT 		NOT NULL,
    CreatorID 	INT 		NOT NULL,
    CreateDate 	DATE 		NOT NULL,
PRIMARY KEY (QuestionID),
FOREIGN KEY (CategoryID) REFERENCES  CategoryQuestion(CategoryID) ON DELETE CASCADE ,
FOREIGN KEY (TypeID) REFERENCES  TypeQuestion(TypeID) ON DELETE CASCADE
);

-- CREATE TABLE Answer
CREATE TABLE Answer
(
	AnswerID 		INT  AUTO_INCREMENT,
    Content 		VARCHAR(255) NOT NULL,
    QuestionID 		INT 		NOT NULL,
    isCorrect 		BOOL 		NOT NULL,
PRIMARY KEY  (AnswerID) ,
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) ON DELETE CASCADE
);

-- CREATE TABLE Exam

CREATE TABLE Exam
(
	ExamID 		INT 	AUTO_INCREMENT,
    `Code` 		VARCHAR(255) NOT NULL,
    Title 		VARCHAR(255) NOT NULL,
    CategoryID 	INT 		NOT NULL,
    Duration 	TIME 		NOT NULL ,
    CreatorID 	INT 		NOT NULL,
    CreateDate 	DATE 		NOT NULL,
PRIMARY KEY (ExamID),
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE
);

-- CREATE TABLE ExamQuestion
CREATE TABLE  ExamQuestion
(
	ExamID 			INT NOT NULL,
    QuestionID 		INT NOT NULL,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) ON DELETE CASCADE
);


-- --------------------------------------------------------------------
-- ------------------INSERT_INTO--------------------------------------

-- INSERT DATA TABLE_1 Department
INSERT INTO Department(DepartmentName)
VALUES 		( 'Sale'),
			('Research'),
			('Quality Management'),
			('Production'),
			('Marketing'),
			('Human Resources'),
			('Finance'),
			('Development'),
			('Customer Service'),
            ( 'Training '),
			('Pulic Relations'),
			('Administration '),
			('International Payment'),
			('Audit'),
			('Local Payment');
            
-- INSERT DATA TABLE_2 Position
INSERT INTO `Position`(PositionName)
VALUES 		( 'Dev'),
			('Test'),
			('Scrum Master'),
			('PM');
            
-- INSERT DATA TABLE_3 Account
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES 			( 'opetrov0@apache.org', 'Petrov', 'Otto Petrov', '1', '1', '2020-04-05'),
				( 'jrendall1@amazon.co.jp', 'Rendall', 'Joletta Rendall', '2', '2', '2021-01-16'),
				( 'tdyka2@bloglines.com', 'Dyka', 'Trina Dyka', '3', '3', '2020-07-09'),
				( 'tatkinson3@imdb.com	', 'Atkinson', 'Truman Atkinson', '4', '4', '2020-02-19'),
				( 'mfricker4@psu.edu', 'Fricker', 'Moritz Fricker', '5', '4', '2019-12-14'),
				( 'blilly5@yale.edu', 'Lilly	', 'Bart Lilly', '6', '3', '2021-03-10'),
				( 'ebutterly6@dailymotion.com ', ' Butterly', 'Ennis Butterly ', '7', '1', '2019-09-14'),
				( ' kredon7@nifty.com', 'Redon	 ', 'Karmen Redon ', '8', '2', '2020-11-15'),
				( 'dkelshaw8@istockphoto.com ', 'Kelshaw ', 'Damara Kelshaw ', '9', '2', '2019-06-25'),
				( ' hendersby9@weather.com', 'Endersby ', ' Harmon Endersby', '10', '4', '2021-04-03'),
                ( 'anormand1@hugedomains.com ', 'Ami ', 'Ami Normand ', '11', '4', '2019-06-2'),
                ( 'gredmain2@aol.com ', 'Guinevere', 'Guinevere Redmain', '12', '2', '2019-03-25'),
                ( 'lhaughan3@va.gov ', 'Lissy ', 'Lissy Haughan', '13', '1', '2019-07-2'),
                ( 'fcovil4@netlog.com ', 'Farica', 'Farica Covil', '14', '3', '2019-08-5'),
                ( 'pwinterborne5@umich.edu ', 'Patrice', 'Patrice Winterborne', '15', '2', '2019-10-2');
                
-- INSERT DATA TABLE_4 Group
INSERT INTO `Group`( GroupName, CreatorID, CreateDate)
VALUES		( 'AAB', '1', '2020-02-03'),
			( 'ABC', '2', '2020-03-04'),
			( 'CCB', '3', '2021-02-14'),
			( 'KDH', '4', '2021-01-21'),
			( 'LIN', '5', '2020-10-10'),
            ( 'ALB', '6', '2020-02-12'),
			( 'JHC', '7', '2020-03-14'),
			( 'HCB', '8', '2021-02-15'),
			( 'KDR', '9', '2021-01-16'),
			( 'QWE', '10', '2020-10-17'),
            ( 'ASD', '11', '2020-02-18'),
			( 'IJS', '12', '2020-03-19'),
			( 'CIS', '13', '2021-02-20'),
			( 'JDJ', '14', '2021-01-21'),
			( 'JFD', '15', '2020-10-10');

-- INSERT DATA TABLE_5 GroupAccount
INSERT INTO GroupAccount ( GroupID,AccountID, JoinDate)
VALUES			('1', '16', '2020-02-03'),
				('2', '17', '2020-04-05'),
				('3', '18', '2020-03-15'),
				('4', '19', '2021-01-01'),
				('5', '20', '2020-05-27'),
                ('6','21', '2020-02-03'),
				('7', '22', '2020-04-05'),
				('8', '23', '2020-03-15'),
				('9','24', '2021-01-01'),
				('10','25', '2020-05-27'),
                ('11','26', '2020-02-03'),
				('12', '27', '2020-04-05'),
				( '13','28', '2020-03-15'),
				('14', '29', '2021-01-01'),
				('15','30', '2020-05-27');
                
-- INSERT DATA TABLE_6 TypeQuestion
INSERT INTO TypeQuestion( TypeName)
VALUES 		( 'Essay'),
			( 'Multiple-Choice');
            
-- INSERT DATA TABLE_7 CategoryQuestion
INSERT INTO CategoryQuestion ( CategoryName)
VALUES		( 'Java'),
			( '.NET'),
			( 'SQL'),
			( 'Postman'),
			( ' Ruby'),
            ( '	Python'),
			( 'HTML'),
			( 'CSS'),
			( 'JS'),
			( 'MySQL'),
            ( 'C'),
			( 'C++'),
			( 'C#'),
			( 'Pascal'),
			( 'PHP');



-- INSERT DATA TABLE_8 Question
INSERT INTO Question ( Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES		( 'question for Java?', '1', '2', '15', '2020-01-01'),
			( 'question for .NET?', '2', '1', '14', '2020-02-02'),
			( 'question for SQL?', '3', '1', '13', '2020-03-03'),
			( 'question for Postman?', '4', '1', '12', '2020-04-04'),
			( 'question for Ruby?', '5', '1', '11', '2020-05-05'),
            ( 'question for Python?', '6', '1', '10', '2020-01-01'),
			( 'question for HTML?', '7', '1', '9', '2020-02-02'),
			( 'question for CSS?', '8', '1', '8', '2020-03-03'),
			( 'question for JS?', '9', '1', '7', '2020-04-04'),
			( 'question for MySQL?', '10', '1', '6', '2020-05-05'),
			( 'question for C?', '11', '1', '5', '2020-01-01'),
			( 'question for C++?', '12', '1', '4', '2020-02-02'),
			( 'question for C#?', '13', '1', '3', '2020-03-03'),
			( 'question for Pascal?', '14', '1', '2', '2020-04-04'),
			( 'question for PHP?', '15', '2', '1', '2020-05-05');
			
			
-- INSERT DATA TABLE_9 Answer
INSERT INTO Answer ( Content, QuestionID, isCorrect)
VALUES		( 'the answer to java ', '16', '1'),
			( 'the answer to java ', '16', '1'),
			( 'the answer to java ', '16', '1'),
			( 'the answer to java ', '16', '1'), 
			( 'the answer to .NET', '17', '1'), 
			( 'the answer to SQL', '18', '1'), 
			( 'the answer to Postman', '19','1'), 
			( 'the answer to Ruby', '20', '1'), 
            ( 'the answer to Python', '21', '1'), 
			( 'the answer to HTML', '22', '1'), 
			( 'the answer to CSS', '23', '1'), 
			( 'the answer to JS', '24', '1'),
			( 'the answer to MySQL', '25', '1'), 
			( 'the answer to C', '26', '1'), 
			( 'the answer to C++', '27', '1'), 
			( 'the answer to C#', '28', '1'), 
			( 'the answer to Pascal', '29', '1'), 
			( 'the answer to PHP', '30', '1');
  SELECT *FROM question;          
  SELECT *FROM answer;          
-- INSERT DATA TABLE_10 Exam
INSERT INTO Exam( `Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES			( '01', 'Title1', '1', ' 01:00:00', '1', '2020-05-05'),
				( '02', 'Title2', '2', ' 02:00:00', '2', '2020-05-05'),
				( '03', 'Title3', '3', ' 02:00:00', '3', '2020-05-05'),
				( '04', 'Title4', '4', ' 03:00:00', '4', '2020-05-05'),
				( '05', 'Title5', '5', ' 03:00:00', '5', '2020-05-05'),
                ( '06', 'Title6', '6', ' 01:00:00', '6', '2020-05-05'),
				( '07', 'Title7', '7', ' 02:00:00', '7', '2020-05-05'),
				( '08', 'Title8', '8', ' 02:00:00', '8', '2020-05-05'),
				( '09', 'Title9', '9', ' 03:00:00', '9', '2020-05-05'),
				( '10', 'Title10', '10', ' 03:00:00', '10', '2020-05-05'),
                ( '11', 'Title11', '11', ' 01:00:00', '11', '2020-05-05'),
				( '12', 'Title12', '12', ' 02:00:00', '12', '2020-05-05'),
				( '13', 'Title13', '13', ' 02:00:00', '13', '2020-05-05'),
				( '14', 'Title14', '14', ' 03:00:00', '14', '2020-05-05'),
				( '15', 'Title15', '15', ' 03:00:00', '15', '2020-05-05');
                
-- INSERT DATA TABLE_11 ExamQuestion
INSERT INTO ExamQuestion( ExamID, QuestionID)
VALUES			('1', '16'),
				('2', '17'),
				('3', '18'),
				('4', '19'),
				('5', '20'),
                ('6', '21'),
				('7', '22'),
				('8', '23'),
				('9', '24'),
				('10', '25'),
                ('11', '26'),
				('12', '27'),
				('13', '28'),
				('14', '29'),
				('15', '30');
/*
SELECT*FROM Department;
SELECT*FROM `Position`;
SELECT*FROM `Account`;
SELECT*FROM `Group`;
SELECT*FROM GroupAccount;
SELECT*FROM TypeQuestion;
SELECT*FROM CategoryQuestion;
SELECT*FROM Question;
SELECT*FROM Answer;
SELECT*FROM Exam;
SELECT*FROM ExamQuestion;
*/