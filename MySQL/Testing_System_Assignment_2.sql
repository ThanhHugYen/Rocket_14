-- CREATE DATABASE Testing_System_2
CREATE DATABASE IF NOT EXISTS Testing_System_2;
USE Testing_System_2;

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
	GroupID 		INT 	NOT NULL,
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
			('Customer Service');
            
-- INSERT DATA TABLE_2 Position
INSERT INTO `Position`(PositionName)
VALUES 		( 'Dev'),
			('Test'),
			('Scrum Master'),
			('PM'),
			('Test'),
			('Dev');
            
-- INSERT DATA TABLE_3 Account
INSERT INTO `Account`(AccountID ,Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES 			('45', 'opetrov0@apache.org', 'Petrov', 'Otto Petrov', '3', '1', '2020-04-05'),
				('46', 'jrendall1@amazon.co.jp', 'Rendall', 'Joletta Rendall', '4', '4', '2021-01-16'),
				('47', 'tdyka2@bloglines.com', 'Dyka', 'Trina Dyka', '2', '3', '2020-07-09'),
				('48', 'tatkinson3@imdb.com	', 'Atkinson', 'Truman Atkinson', '1', '5', '2020-02-19'),
				('49', 'mfricker4@psu.edu', 'Fricker', 'Moritz Fricker', '9', '2', '2019-12-14'),
				('50', 'blilly5@yale.edu', 'Lilly	', 'Bart Lilly', '5', '3', '2021-03-10'),
				('51', 'ebutterly6@dailymotion.com ', ' Butterly', 'Ennis Butterly ', '7', '1', '2019-09-14'),
				('52', ' kredon7@nifty.com', 'Redon	 ', 'Karmen Redon ', '6', '2', '2020-11-15'),
				('53', 'dkelshaw8@istockphoto.com ', 'Kelshaw ', 'Damara Kelshaw ', '8', '5', '2019-06-25'),
				('54', ' hendersby9@weather.com', 'Endersby ', ' Harmon Endersby', '2', '4', '2021-04-03');
                
-- INSERT DATA TABLE_4 Group
INSERT INTO `Group`( GroupName, CreatorID, CreateDate)
VALUES		( 'AAB', '1', '2020-02-03'),
			( 'ABC', '2', '2020-03-04'),
			( 'CCB', '3', '2021-02-14'),
			( 'KDH', '4', '2021-01-21'),
			( 'LIN', '5', '2020-10-10');
            
-- INSERT DATA TABLE_5 GroupAccount
INSERT INTO GroupAccount ( GroupID,AccountID, JoinDate)
VALUES			('1', '45', '2020-02-03'),
				('2', '52', '2020-04-05'),
				('3', '47', '2020-03-15'),
				('4', '49', '2021-01-01'),
				('5', '50', '2020-05-27');
                
-- INSERT DATA TABLE_6 TypeQuestion
INSERT INTO TypeQuestion( TypeName)
VALUES 		( 'Essay'),
			( 'Multiple-Choice'),
			( 'Essay'),
			( 'Multiple-Choice'),
			( 'Essay');
            
-- INSERT DATA TABLE_7 CategoryQuestion
INSERT INTO CategoryQuestion ( CategoryName)
VALUES		( 'Java'),
			( '.NET'),
			( 'SQL'),
			( 'Postman'),
			( ' Ruby');

-- INSERT DATA TABLE_8 Question
INSERT INTO Question ( Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES		( 'WHAT IS SELECT?', '2', '1', '5', '2020-01-01'),
			( 'WHAT IS NUMBER?', '4', '2', '4', '2020-02-02'),
			( 'WHAT IS STRING?', '5', '3', '3', '2020-03-03'),
			( 'WHAT IS CREATE?', '1', '4', '2', '2020-04-04'),
			( 'WHAT IS DATABASE?', '3', '5', '1', '2020-05-05');
			
-- INSERT DATA TABLE_9 Answer
INSERT INTO Answer ( Content, QuestionID, isCorrect)
VALUES		( 'Query display', '4', '1'),
			( 'String', '3', '1'),
			( 'Number', '2', '1'),
			( 'CREATE', '1', '1'),
			( 'DATABASE', '5', '1');
            
-- INSERT DATA TABLE_10 Exam
INSERT INTO Exam( `Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
VALUES			( '01', 'Title1', '1', ' 01:00:00', '1', '2020-05-05'),
				( '02', 'Title2', '2', ' 02:00:00', '2', '2020-05-05'),
				( '03', 'Title3', '3', ' 02:00:00', '3', '2020-05-05'),
				( '04', 'Title4', '4', ' 03:00:00', '4', '2020-05-05'),
				( '05', 'Title5', '5', ' 03:00:00', '5', '2020-05-05');
                
-- INSERT DATA TABLE_11 ExamQuestion
INSERT INTO ExamQuestion( ExamID, QuestionID)
VALUES			('5', '1'),
				('4', '2'),
				('3', '3'),
				('2', '4'),
				('1', '5');
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







    




