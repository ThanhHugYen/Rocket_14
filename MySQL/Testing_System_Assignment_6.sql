USE testing_system_3;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS dept_account;
DELIMITER $$
CREATE PROCEDURE dept_account (IN in_dept_name VARCHAR(50) ,out out_AccountID INT , out out_FullName VARCHAR(50))
BEGIN 
	SELECT a.AccountID,a.FullName INTO out_AccountID,out_FullName
    FROM department d LEFT JOIN `account` a
    ON d.DepartmentID=a.DepartmentID
    WHERE in_dept_name=d.DepartmentName;
END $$
DELIMITER ;

Set @out_AccountID="";
Set @out_FullName="";
call dept_account('Audit',@out_AccountID,@out_FullName);
SELECT @out_AccountID,@out_FullName;


-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS acc_group ;
DELIMITER $$
CREATE PROCEDURE acc_group()
BEGIN 
	SELECT GroupID,COUNT(AccountID) num_of_acc 
    FROM groupaccount 
    group by (GroupID);
END$$
DELIMITER ;

-- 4 cách gọi thủ tục 
call acc_group();
call testing_system_3.acc_group();
call acc_group ;
call testing_system_3.acc_group;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
select QuestionID ,month(CreateDate) from question;

DROP PROCEDURE IF EXISTS month_q ;
DELIMITER $$
CREATE PROCEDURE month_q ()
BEGIN
	SELECT t.TypeName , count(q.QuestionID) q_number 
    FROM typequestion t LEFT JOIN question q 
    ON t.TypeID=q.TypeID 
    WHERE month(q.CreateDate) =(select month("2021-05-20" ))
    Group by (TypeName)
    ;
END$$
DELIMITER ;

CALL month_q();


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS type_q ;
DELIMITER $$
CREATE PROCEDURE type_q ()
BEGIN
	SELECT typeID  , count(QuestionID) number_question
    FROM  question 
    GROUP BY (TypeID)
    LIMIT 1
    ;
END$$
DELIMITER ;

CALL type_q();

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question

DROP PROCEDURE IF EXISTS name_q ;
DELIMITER $$
CREATE PROCEDURE name_q ()
BEGIN
	SELECT t.typeID  ,t.TypeName, count(q.QuestionID) number_question
    FROM  question q JOIN typequestion t
    ON t.TypeID=q.TypeID
    GROUP BY (t.TypeID)
    ORDER BY number_question DESC
    LIMIT 1
    ;
END$$
DELIMITER ;

CALL name_q();

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
--   chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào

DROP PROCEDURE IF EXISTS string_string;
DELIMITER $$

CREATE PROCEDURE  string_string(in in_string VARCHAR(50))
BEGIN
	SELECT g.GroupName ,a.Username 
    FROM `group` g JOIN groupaccount ga 
    ON g.GroupID=ga.GroupID
    JOIN `account` a 
    ON a.AccountID=ga.AccountID
    WHERE   g.GroupName LIKE CONCAT("%",in_string,"%") OR a.Username LIKE CONCAT("%",in_string,"%")
    ;
END$$
  
  
/*
Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
trong store sẽ tự động gán:
username sẽ giống email nhưng bỏ phần @..mail đi
positionID: sẽ có default là developer
departmentID: sẽ được cho vào 1 phòng chờ

Sau đó in ra kết quả tạo thành công
*/

DROP PROCEDURE IF EXISTS loang_quoang;
DELIMITER $$
CREATE PROCEDURE loang_quoang(in in_fullName VARCHAR(50),in in_email VARCHAR(50))
BEGIN
	DECLARE Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(in_email,'@',1);
	DECLARE PositionID TINYINT UNSIGNED DEFAULT 1;
    DECLARE DepartmentID TINYINT UNSIGNED DEFAULT 10;
    DECLARE CreateDate DATETIME DEFAULT NOW();

SELECT fullName, Email  , Username,PositionID,departmentID 
FROM `account` a 
WHERE in_fullName=a.fullName AND in_email = a.Email  ;
END$$
DELIMITER ;


-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- 	để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

/*
nhập giá trị vào nằm trong 2 trường hợp typeID 
câu essay có conten dài nhất : lấy id câu hỏi
câu multi có content dài nhất ;lấy id câu hỏi 

*/


DROP PROCEDURE IF EXISTS length_content;
DELIMITER $$
CREATE PROCEDURE length_content(in in_type_q VARCHAR(20))
BEGIN
	
	SELECT t.TypeID,q.QuestionID ,char_length(q.Content)
    from typequestion t Join question q 
    ON t.TypeID=q.TypeID
    WHERE in_type_q =t.TypeName 
    GROUP BY (TypeID) ;
END $$
DELIMITER ;


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS delete_exam;
DELIMITER $$
CREATE PROCEDURE delete_exam(in in_ExamID INT )
BEGIN 
	DELETE exam.* from exam where examID = in_ExamID;
END$$
DELIMITER ;


/*
 Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
dụng store ở câu 9 để xóa)
Sau đó in số lượng record đã remove từ các table liên quan trong khi
removing
*/
DROP PROCEDURE IF EXISTS delete_exam;
DELIMITER $$
CREATE PROCEDURE delete_exam(in in_ExamID INT )
BEGIN 
    IF (YEAR(NOW())-YEAR(CreateDate)>3 )
    THEN  DELETE exam.* from exam where examID = in_ExamID AND ;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_DeleteUser3Years;
DELIMITER $$
CREATE PROCEDURE sp_DeleteUser3Years()
BEGIN
	WITH ExamID3Year AS(
		SELECT 	ExamID
		FROM 	Exam
		WHERE	(YEAR(NOW()) - YEAR(CreateDate)) > 3
    )
	DELETE
    FROM 	Exam
    WHERE 	ExamID = (SELECT * FROM ExamID3Year);
END$$
DELIMITER ;

/*
--  Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng
-- ban default là phòng ban chờ việc
*/
DROP PROCEDURE IF EXISTS delete_dept;
DELIMITER $$
CREATE PROCEDURE delete_dept(in in_dep_name VARCHAR(50))
BEGIN
	UPDATE `account`  
    SET DepartmentID=16 WHERE DepartmentID = (select DepartmentID from department WHERE DepartmentName=in_dep_name);
   
    delete dept.* from department dept WHERE in_dep_name=DepartmentName;
    
END$$
DELIMITER ; 

SELECT 
    *
FROM
    department;


-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay



DROP PROCEDURE IF EXISTS sp_CountQuesInMonth;
DELIMITER $$
CREATE PROCEDURE sp_CountQuesInMonth()
BEGIN
		SELECT month_year.MONTH, COUNT(QuestionID) AS COUNT
		FROM
		(
             SELECT 1 AS MONTH
             UNION SELECT 2 AS MONTH
             UNION SELECT 3 AS MONTH
             UNION SELECT 4 AS MONTH
             UNION SELECT 5 AS MONTH
             UNION SELECT 6 AS MONTH
             UNION SELECT 7 AS MONTH
             UNION SELECT 8 AS MONTH
             UNION SELECT 9 AS MONTH
             UNION SELECT 10 AS MONTH
             UNION SELECT 11 AS MONTH
             UNION SELECT 12 AS MONTH
        ) AS month_year
		LEFT JOIN Question ON month_year.MONTH = MONTH(CreateDate)
		GROUP BY month_year.MONTH
		ORDER BY month_year.MONTH ASC;
END$$
DELIMITER ;

/*
 Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
tháng gần đây nhất
(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong
tháng")
*/
DROP PROCEDURE IF EXISTS sp_CountQuesPrevious6Month;
DELIMITER $$
CREATE PROCEDURE sp_CountQuesPrevious6Month()
BEGIN
		SELECT Previous6Month.MONTH, COUNT(QuestionID) AS COUNT
		FROM
		(
			SELECT MONTH(CURRENT_DATE - INTERVAL 5 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 4 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 3 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 2 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 0 MONTH) AS MONTH
        ) AS Previous6Month
		LEFT JOIN Question ON Previous6Month.MONTH = MONTH(CreateDate)
		GROUP BY Previous6Month.MONTH
		ORDER BY Previous6Month.MONTH ASC;
END$$
DELIMITER ;
