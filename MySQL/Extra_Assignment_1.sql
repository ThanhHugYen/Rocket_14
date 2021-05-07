CREATE DATABASE IF NOT EXISTS QLyFRESHER;
USE QLyFRESHER;

CREATE TABLE Trainee
(
	TraineeID 	INT NOT NULL AUTO_INCREMENT,
    Full_Name 	VARCHAR(255),
    Birth_Date 	DATE NOT NULL,
    Gender 		ENUM('Male', 'Female', 'Unknown') NOT NULL,
    ET_IQ 		TINYINT(30) NOT NULL,
    ET_Gmath 	TINYINT(30) NOT NULL,
    ET_English 	TINYINT(30) NOT NULL,
    Training_Class 		VARCHAR(255),
    Evaluation_Notes 	VARCHAR(255),
PRIMARY KEY (TraineeID)
);
ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(255) NOT NULL UNIQUE ;
SELECT *FROM Trainee;


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


