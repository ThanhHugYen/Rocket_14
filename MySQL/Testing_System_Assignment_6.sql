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

CREATE PROCEDURE  string_string(in in_string VARCHAR(50),out out_group VARCHAR(50),out out_name VARCHAR(50))
BEGIN
	SELECT g.GroupName ,a.FullName INTO out_group,out_name
    FROM `group` g JOIN groupaccount ga 
    ON g.GroupID=ga.GroupID
    JOIN `account` a 
    ON a.AccountID=ga.AccountID
    WHERE   g.GroupName LIKE CONCATE("%",in_string,"%") OR a.FullName LIKE CONCATE("%",in_string,"%")
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


-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- 	để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất


DROP PROCEDURE IF EXISTS length_content;
DELIMITER $$
CREATE PROCEDURE length_content(in in_type_q VARCHAR(20),out o_question VARCHAR(50),out q INT)
BEGIN
	SELECT q.QuestionID ,max(char_length(q.Content)) INTO q , o_question 
    from typequestion t Join question q 
    ON t.TypeID=q.TypeID
    WHERE in_type_q =t.TypeName ;
END $$
DELIMITER ;



-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

