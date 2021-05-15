USE testing_system_3;

select * from department;
select *from `account`;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select d.DepartmentID,d.DepartmentName,a.AccountID,a.FullName,a.PositionID 
from 
department d 
left join `account` a 
on d.DepartmentID= a.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select * from `account` where CreateDate > "2010-12-20";

-- Question 3: Viết lệnh để lấy ra tất cả các developer
select p.*,a.* from `position` p left join `account` a on p.PositionID=a.PositionID 
WHERE p.PositionID='1';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select d.DepartmentName,count(a.DepartmentID) emp_of_dep 
from department d  
join `account` a 
on d.DepartmentID=a.DepartmentID  
group by (a.DepartmentID) 
having emp_of_dep >3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select eq.ExamID,q.Content, eq.QuestionID,count(eq.QuestionID) t 
from 
	examquestion eq 
join question q 
on eq.QuestionID=q.QuestionID 
group by (QuestionID) 
having count(*);


-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select c.CategoryID , c.CategoryName ,q.QuestionID,q.Content, count(q.CategoryID) occurrences 
 from  
	categoryquestion c 
left join question q 
on c.CategoryID=q.CategoryID  
group by (CategoryID) ;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select QuestionID , ExamID, count(QuestionID) as number_use from examquestion group by (QuestionID); 

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
select q.QuestionID , q.Content , a.Content,a.AnswerID, count(a.AnswerID) dem from question q left join answer a  on q.QuestionID=a.QuestionID  group by (a.QuestionID) 
having 
count(*)=(select count(a.AnswerID) m from  answer group by (QuestionID) order by count(a.AnswerID) limit 1)
 ;

-- Question 9: Thống kê số lượng account trong mỗi `group`
SELECT  g.GroupID , count(a.AccountID) k from groupaccount g join Account a on g.AccountID=a.AccountID group by (GroupID) order by GroupID DESC  ;

-- Question 10: Tìm chức vụ có ít người nhất
select a.AccountID ,p.PositionID,p.PositionName, count(a.AccountID) o from position p join account a on p.PositionID = a.PositionID group by (a.PositionID) order by a.AccountID ASC ;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select d.DepartmentID, d.DepartmentName, count(p.PositionID) as so_luong from department d left join `account` a on d.DepartmentID=a.DepartmentID left join `position` p on p.PositionID=a.PositionID 
group by (p.PositionName) order by DepartmentID ;

select   b.DepartmentID , b.DepartmentName , count(*) dev_test_scrummaster_PM
FROM account a 	LEFT JOIN 	department b 	on a.DepartmentID=b.DepartmentID 
				LEFT JOIN 	position c 		on a.PositionID=c.PositionID
    group by (DepartmentName)
    order by DepartmentName,PositionName;
    
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- 		question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

select q.QuestionID,q.Content,q.CategoryID,q.CreatorID,q.CreateDate,t.TypeName,a.Content,a.isCorrect from question q LEFT JOIN typequestion t ON q.TypeID=t.TypeID 
	LEFT JOIN answer a ON a.QuestionID=q.QuestionID
    GROUP BY QuestionID;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select t.TypeName,count(t.TypeID)from question q JOIN typequestion t ON q.TypeID = t.TypeID 
group by t.TypeID ;

-- Question 14:Lấy ra group không có account nào

select GroupID, count(AccountID) account_number from groupaccount group by GroupID having account_number=0 order by GroupID  ;

-- Question 15: Lấy ra group không có account nào
select GroupID, count(AccountID) account_number from groupaccount group by GroupID having account_number=0 order by GroupID  ;
 
-- Question 16: Lấy ra question không có answer nào
select 
	q.QuestionID,q.Content ,count(a.AnswerID) dem_account 
from 
				question q 
	LEFT JOIN 	answer a 
	ON q.QuestionID=a.QuestionID  
group by q.QuestionID 
having dem_account=0 
order by q.QuestionID;


/* Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
*/
select a.AccountID,a.FullName,a.DepartmentID,a.PositionID,g.GroupID from account a JOIN groupaccount g on a.AccountID=g.AccountID where GroupID=1
UNION
select a.AccountID,a.FullName,a.DepartmentID,a.PositionID,g.GroupID from account a JOIN groupaccount g on a.AccountID=g.AccountID where GroupID=2;


/*
Question 18:
a) Lấy các group có lớn hơn 1 thành viên
b) Lấy các group có nhỏ hơn 1 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)
*/

select 
		g.GroupID , g.GroupName , count(ga.AccountID) kkk 
from 
		`group` g 
	JOIN groupaccount ga 
	ON 	g.GroupID=ga.GroupID 
group by GroupID 
having kkk>1
UNION
select 
		g.GroupID , g.GroupName , count(ga.AccountID) kkk 
from 
		`group` g 
	JOIN groupaccount ga 
	ON g.GroupID=ga.GroupID 
group by GroupID 
having kkk<1;
