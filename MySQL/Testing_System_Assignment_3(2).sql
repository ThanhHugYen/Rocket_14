use testing_system_3;


-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- finish!

-- Question 2: lấy ra tất cả các phòng ban
SELECT*FROM department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID,DepartmentName from department where DepartmentName="Sale";

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *FROM `account` order by Char_Length(FullName) DESC
LIMIT 1;
SELECT AccountID,FullName, char_length(FullName) FROM `account`;
SELECT MAX(char_length(FullName)) from `account` ;
select * from account where char_length(fullname)=19 ;
SELECT MAX(char_length(FullName)) from `account` ;
select * from account where char_length(fullname)=19 and DepartmentID="3";
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *FROM `account` 
where DepartmentID=3
order by Char_Length(FullName) DESC 
LIMIT 1;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
update `group` set CreateDate="2019-5-5" where GroupID="1";

SELECT GroupName FROM `group` WHERE CreateDate<"2019-12-20";

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
-- ?????????????????
SELECT QuestionID FROM answer group by (QuestionID)having count(QuestionID)>=4;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
update exam set CreateDate="2019-1-2", Duration="01:00:00" where ExamID="3"; 
SELECT ExamID FROM exam WHERE Duration >= "01:00:00" AND CreateDate < "2019-12-20";

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *FROM `group` ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(Username)from `account` where DepartmentID="2";

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT Username from `account` where Username LIKE "D%o";

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
Delete from exam where CreateDate <"2019-12-20";
select *from exam;

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
-- all question start is " question " so im not delete !
delete from question where Content LIKE "qquestion%";
select *from question;
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
update `account`
set  FullName="Nguyễn Bá Lộc",Username="Lộc",Email="loc.nguyenba@vti.com.vn"
where AccountID="16";
select*from account;

-- Question 15: update account có id = 25 sẽ thuộc group có id = 4
-- 
select * from groupaccount;
update `groupaccount`
set GroupID="4"  
where AccountID="25";