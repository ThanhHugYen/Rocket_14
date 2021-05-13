USE testing_system_3;

select * from department;
select *from `account`;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select d.DepartmentID,d.DepartmentName,a.AccountID,a.FullName,a.PositionID from department d inner join `account` a on d.DepartmentID= a.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select * from `account` where CreateDate > "2010-12-20";

-- Question 3: Viết lệnh để lấy ra tất cả các developer
select p.*,a.* from `position` p join `account` a on p.PositionID=a.PositionID WHERE p.PositionID='1';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
