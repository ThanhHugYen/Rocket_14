CREATE DATABASE IF NOT EXISTS QLyFRESHER;
USE QLyFRESHER;

CREATE TABLE Trainee
(
	TraineeID 	INT NOT NULL AUTO_INCREMENT,
    Full_Name 	VARCHAR(255),
    Birth_Date 	DATE NOT NULL,
    Gender 		ENUM('Male', 'Female', 'Unknown') NOT NULL,
    ET_IQ 		TINYINT UNSIGNED NOT NULL CHECK(0<=ET_IQ AND ET_IQ<=20)  ,
    ET_Gmath 	TINYINT UNSIGNED NOT NULL CHECK(0<=ET_Gmath  AND ET_Gmath <=20),
    ET_English 	TINYINT UNSIGNED NOT NULL CHECK(0<=ET_English  AND ET_English <=50),
    Training_Class 		VARCHAR(255),
    Evaluation_Notes 	VARCHAR(255),
PRIMARY KEY (TraineeID)
);
ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(255) NOT NULL UNIQUE ;
SELECT *FROM Trainee;

INSERT INTO Trainee ( Full_Name,Birth_Date,Gender,ET_IQ ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes,VTI_Account)
VALUES 	("Nguyễn Văn A","2001-10-10","male",15,19,37,"01","No reviews yet","VTI_Account0"),
		("Nguyễn Văn B","2000-10-10","male",10,18,26,"02","No reviews yet","VTI_Account1"),
		("Nguyễn Văn C","2002-10-10","male",19,17,30,"01","No reviews yet","VTI_Account2"),
		("Nguyễn Văn D","1999-10-10","male",5,16,35,"03","No reviews yet","VTI_Account3"),
		("Nguyễn Văn E","1998-10-10","male",19,15,40,"01","No reviews yet","VTI_Account4"),
		("Nguyễn Văn F","2001-10-10","male",20,14,45,"03","No reviews yet","VTI_Account5"),
		("Nguyễn Văn G","2001-10-10","male",13,13,30,"01","No reviews yet","VTI_Account6"),
		("Nguyễn Văn H","2001-10-10","male",8,12,28,"02","No reviews yet","VTI_Account7"),
		("Nguyễn Văn I","2001-10-10","male",6,11,37,"01","No reviews yet","VTI_Account8"),
		("Nguyễn Văn K","2001-10-10","male",12,10,49,"02","No reviews yet","VTI_Account9");
select* from trainee;
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- 			   nhóm chúng thành các tháng sinh khác nhau







CREATE TABLE EXERSICE_2
(
	ID INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) ,
    `Code` VARCHAR(5),
    ModifiedDate TIME ,
PRIMARY KEY (ID)
);

CREATE TABLE EXERCISE_3
(
	ID 			INT NOT NULL AUTO_INCREMENT,
    `Name` 		VARCHAR(255) ,
    BirthDate 	DATE ,
    Gender		ENUM('Male','Female','Unknown'),
    IsDeletedFlag BOOL ,
PRIMARY KEY (ID)
);


