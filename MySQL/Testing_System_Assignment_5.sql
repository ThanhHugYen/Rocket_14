USE testing_system_3;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW emp_Sale AS
    SELECT 
        a.*, d.DepartmentName
    FROM
        Department d
            JOIN
        account a ON d.DepartmentID = a.DepartmentID
    WHERE
        d.DepartmentName = 'Sale';

SELECT 
    *
FROM
    emp_Sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS account_gr;
CREATE VIEW account_gr AS
    SELECT 
        a.AccountID,
        a.FullName,
        a.DepartmentID,
        a.PositionID,
        a.CreateDate,
        g.GroupID,
        COUNT(g.GroupID) number_account
    FROM
        `account` a
            LEFT JOIN
        groupaccount g ON a.AccountID = g.AccountID
    GROUP BY AccountID
    HAVING number_account = (SELECT 
            COUNT(GroupID)
        FROM
            groupaccount
        WHERE
            AccountID = 25)
    ORDER BY number_account DESC;
SELECT 
    *
FROM
    account_gr;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
DROP VIEW IF EXISTS question_long ;
CREATE VIEW question_long AS
    SELECT 
        QuestionID, Content, CHAR_LENGTH(Content) length_content
    FROM
        question
    HAVING length_content > 20;
SELECT 
    *
FROM
    question_long;
    
    
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
DROP VIEW IF EXISTS emp_dept ;
CREATE VIEW emp_dept AS
    SELECT 
        d.DepartmentID,
        d.DepartmentName,
        COUNT(AccountID) number_account
    FROM
        department d
            LEFT JOIN
        `account` a ON d.DepartmentID = a.DepartmentID
    GROUP BY DepartmentID
    HAVING number_account = (SELECT 
            COUNT(AccountID)
        FROM
            account
        WHERE
            DepartmentID = 5)
    ORDER BY number_account DESC;
    
select * from emp_dept;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS question_Ng ;
CREATE VIEW question_Ng AS
    SELECT 
        QuestionID, Content, CreatorID, COUNT(QuestionID)
    FROM
        question q
            JOIN
        `account` a ON q.CreatorID = a.AccountID
    WHERE
        FullName LIKE 'Nguyễn%'
            OR FullName LIKE '%Nguyễn%';

SELECT 
    *
FROM
    question_Ng;


