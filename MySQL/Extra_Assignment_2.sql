CREATE DATABASE IF NOT EXISTS QLyFRESHER;
USE QLyFRESHER;


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


-- ##########################################################
DROP TABLE if exists trainee ;
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
VALUES 	("Nguyễn Văn A","2001-1-10","male",15,19,37,"01","No reviews yet","VTI_Account0"),
		("Nguyễn Văn B","2000-2-10","male",10,18,10,"02","No reviews yet","VTI_Account1"),
		("Nguyễn Văn C","2002-3-10","male",19,17,30,"01","No reviews yet","VTI_Account2"),
		("Nguyễn Văn D","1999-4-10","male",5,16,35,"03","No reviews yet","VTI_Account3"),
		("Nguyễn Văn E","1998-3-10","male",1,15,40,"01","No reviews yet","VTI_Account4"),
		("Nguyễn Văn F","2001-10-10","male",20,4,45,"03","No reviews yet","VTI_Account5"),
		("Nguyễn Văn G","2001-7-10","male",13,13,30,"01","No reviews yet","VTI_Account6"),
		("Nguyễn Văn H","2001-7-10","male",18,10,28,"02","No reviews yet","VTI_Account7"),
		("Nguyễn Văn I","2001-10-10","male",16,11,37,"01","No reviews yet","VTI_Account8"),
		("Nguyễn Văn K","2001-10-10","male",12,10,49,"02","No reviews yet","VTI_Account9");
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- 			   nhóm chúng thành các tháng sinh khác nhau

select *from trainee;

select TraineeID,Full_Name,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class, MONTH(Birth_Date) as month_birth  from trainee 
where ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18 
 order by Month_birth ASC  ;

-- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
-- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)

select * from trainee;
select  max(char_length(Full_Name)) from trainee;
select  *, char_length(Full_Name) as name_length from trainee where char_length(Full_Name)=16 ;
			
/*Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
 ET_IQ + ET_Gmath>=20
 ET_IQ>=8
 ET_Gmath>=8
 ET_English>=18
*/
select *from trainee
where ET_IQ + ET_Gmath>=20 AND ET_IQ>=8 AND ET_Gmath>=8 AND ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3
delete from trainee
where TraineeID="3";

select *from trainee;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật
-- 				thông tin vào database
update trainee
set Training_Class="02"
where TraineeID=5;

select *from trainee;








