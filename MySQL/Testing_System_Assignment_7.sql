USE testing_system_3;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DROP TRIGGER IF EXISTS not_in_group ;
DELIMITER $$
CREATE TRIGGER not_in_group 
BEFORE  INSERT ON `Group`
FOR EACH ROW 
BEGIN
		 IF NEW.CreateDate < DATE_SUB(CURRENT_DATE ,interval 1 year) Then
         SIGNAL SQLSTATE "12424"
         SET MESSAGE_TEXT ="NO,NO,NO,NO";
        END IF;
        
END$$
DELIMITER ;


INSERT INTO `Group`( GroupName, CreatorID, CreateDate)
Values			("thánh",1,"2019-1-1");

/*
 Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
"Sale" cannot add more user"
*/

DROP TRIGGER IF EXISTS in_user_dept;
DELIMITER $$
CREATE TRIGGER in_user_dept
BEFORE INSERT ON  `account`
FOR EACH ROW 
BEGIN 
	declare in_user int ;
    select DepartmentID into in_user from department  WHERE DepartmentName = 'Sale';
	
    IF new.DepartmentID = in_user then 
    signal sqlstate "19228"
   set  message_text ="Department\"Sale\" cannot add more user";
end if ;
END$$
DELIMITER ;
INSERT INTO account ( Email, Username, FullName, DepartmentID, PositionID, CreateDate)
VALUES				 ('test',	'test', 	'test',	   1,1,"2021-1-1" );

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user


DROP TRIGGER IF EXISTS over_acc_group ;
DELIMITER $$
CREATE TRIGGER over_acc_group 
	BEFORE INSERT ON groupaccount 
	FOR EACH ROW
	BEGIN 
		IF new.groupID IN (
			select groupID from 
			(select GroupID , count(AccountID) as number_acc_group from groupaccount group by (GroupID) having number_acc_group >=2)as temp)
		THEN
			signal sqlstate "10100"
			set message_text =" over load ";
		END IF ;
	END$$
DELIMITER ;

INSERT INTO groupaccount ( GroupID, AccountID, JoinDate)
VALUES 			( 1,18,"2020-1-1");


-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS over_ques_exam ;
DELIMITER $$
CREATE TRIGGER over_ques_exam 
	BEFORE INSERT ON examquestion 
	FOR EACH ROW
	BEGIN 
    
    IF new.ExamID IN (
			select ExamID from 
			(select ExamID , count(QuestionID) as number_question from examquestion group by (ExamID) having number_question >=2)as temp)
		THEN
			signal sqlstate "45000"
			set message_text =" over load ";
		END IF ;
	END$$
DELIMITER ;

insert into examquestion(ExamID, QuestionID)
VALUES 		(2,19),
			(2,21);
    
/*    
 Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
tin liên quan tới user đó
*/

DROP TRIGGER IF EXISTS `over` ;
DELIMITER $$
CREATE TRIGGER `over` 
	BEFORE DELETE ON `account`  
	FOR EACH ROW
	BEGIN 
			IF 	OLD.AccountID IN 
			(select a.AccountID from account a WHERE Email = 'mfricker4@psu.edu')
			THEN 
			signal sqlstate "45000"
			set message_text =" over load ";
	END IF ;
	END$$
DELIMITER ;

delete from account 
where Email='tatkinson3@imdb.com'

/*
 Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
Account, hãy tạo trigger cho phép người dùng khi tạo account không điền
vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
*/
DROP TRIGGER IF EXISTS dept_waiting;
DELIMITER $$
CREATE TRIGGER  dept_waiting 
BEFORE INSERT ON account 
FOR EACH ROW 
BEGIN
	DECLARE in_id_dept INT ;
    SELECT departmentID INTO in_id_dept FROM account 
    WHERE department_name = 'Waiting Room';
    
    
	IF NEW.departmentID IS NULL THEN 
    set new.departmentID =  in_id_dept;
    end if ;
    end$$
delimiter ;



    
    
    
    
    
    
    
