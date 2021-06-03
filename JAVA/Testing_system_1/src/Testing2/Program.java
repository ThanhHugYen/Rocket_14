package Testing2;

import java.util.Date;
public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
// Department:
		Department dep1=new Department();
		dep1.departmentID=1;
		dep1.departmentName="Maketing";
		
		Department dep2=new Department();
		dep2.departmentID=2;
		dep2.departmentName="Sale";
		
		Department dep3=new Department();
		dep3.departmentID=3;
		dep3.departmentName="Deverloper";

//insert		
		System.out.println("thông tin phòng ban 1: ");
		System.out.println(dep1.departmentID);
		System.out.println(dep1.departmentName);
		System.out.println("\n");
		
		System.out.println("thông tin phòng ban 2: ");
		System.out.println(dep2.departmentID);
		System.out.println(dep2.departmentName);
		System.out.println("\n");		

		
// Position:		
		Position pos1=new Position();
		pos1.positionID=1;
		pos1.positionName="DEV";
		
		Position pos2=new Position();
		pos2.positionID=2;
		pos2.positionName="PM";
		
		Position pos3=new Position();
		pos3.positionID=3;  
		pos3.positionName="Leader";
	
//	
		System.out.println("thông tin position 1:");
		System.out.println(pos1.positionID);
		System.out.println(pos1.positionName);
		
		System.out.println("thông tin position 2:");
		System.out.println(pos2.positionID);
		System.out.println(pos2.positionName);
		
// Group:
		Group gr1=new Group();
		gr1.groupID=1;
		gr1.groupName="AA1";
		gr1.createDate= new Date("2020/6/10");
		
		Group gr2=new Group();
		gr2.groupID=2;
		gr2.groupName="AA2";
		gr2.createDate= new Date("2020/6/1");
		
		Group gr3=new Group();
		gr3.groupID=3;
		gr3.groupName="AA3";
		gr3.createDate= new Date("2020/3/10");
				
		
// Account:
				Account acc1=new Account();
				acc1.ID=1;
				acc1.userName="Thành";
				acc1.fullName="Nguyễn Văn Thành ";
				acc1.email="thanh2001@gmail.com";
				acc1.department = dep1;
				acc1.position = pos3;
				acc1.createDate=new Date("2020/1/1");
				
				Group[] groupp = {gr1,gr2};
				acc1.group=groupp;
				
				Account acc2=new Account();
				acc2.ID=2;
				acc2.userName="Linh";
				acc2.fullName="Lê Linh ";
				acc2.email="linh2001@gmail.com";
				acc2.department = dep2;
				acc2.position = pos1;
				acc2.createDate=new Date("2020/2/5");
				Group[] groupp2 = {gr2,gr3};
				acc2.group=groupp2;
				
				Account acc3=new Account();
				acc3.ID=3;
				acc3.userName="Chi";
				acc3.fullName="Lê Chi ";
				acc3.email="Chi2004@gmail.com";
				acc3.department = dep1;
				acc3.position = pos1;
				acc3.createDate=new Date("2019/5/5");
				Group[] groupp3 = {gr2,gr3};
				acc3.group=groupp3;
				
		System.out.println("thông tin account 1:");
		System.out.println(acc1.ID);
		System.out.println(acc1.userName);
		System.out.println(acc1.fullName);
		System.out.println(acc1.email);
		System.out.println(acc1.department.departmentName );
		System.out.println(acc1.position.positionName );
		System.out.println(acc1.createDate);   
		
		//TypeQuestion:
				TypeQuestion tQ1=new TypeQuestion() ;
				tQ1.typeID=1;
				tQ1.typeName = Type.MULTIPLE_CHOICE;
				
				TypeQuestion tQ2=new TypeQuestion() ;
				tQ2.typeID=2;
				tQ2.typeName = Type.ESSAY;
				
				TypeQuestion tQ3=new TypeQuestion() ;
				tQ3.typeID=3;
				tQ3.typeName = Type.MULTIPLE_CHOICE;
				
				System.out.println("print:");
				System.out.println(tQ1.typeID);
				System.out.println(tQ1.typeName);		

//print:		
		System.out.println("thông tin group 1: ");
		System.out.println(gr1.groupID);
		System.out.println(gr1.groupName);
		
		System.out.println(gr1.createDate);
		
		System.out.println("thông tin group 2: ");
		System.out.println(gr2.groupID);
		System.out.println(gr2.groupName);
		System.out.println(gr2.createDate);
	

		
		
//CategoryQuestion:
		TypeQ cate1=new TypeQ();
		cate1.categoryID=1;
		cate1.categorytype=TypeCategory.NET;
		
		TypeQ cate2=new TypeQ();
		cate2.categoryID=2;
		cate2.categorytype=TypeCategory.Java;
		
		TypeQ cate3=new TypeQ();
		cate3.categoryID=3;
		cate3.categorytype=TypeCategory.PYTHON;
/*		
		System.out.println("print: ");
		System.out.println(cate1.categoryID);
		System.out.println(cate1.categorytype);
		
		System.out.println("print: ");
		System.out.println(cate2.categoryID);
		System.out.println(cate2.categorytype);
*/
//Question:
		Question question1=new Question();
		question1.qID=1;
		question1.content="Question 1";
		question1.categorytype=TypeCategory.PYTHON;
		question1.typeName=Type.MULTIPLE_CHOICE;
		question1.creator=acc1;
		question1.createDate=new Date("2020-10-10");
		
		Question question2=new Question();
		question2.qID=2;
		question2.content="Question 2";
		question2.categorytype=TypeCategory.SQL;
		question2.typeName=Type.ESSAY;
		question2.creator=acc2;
		question2.createDate=new Date("2020-10-10");
		
		Question question3=new Question();
		question3.qID=3;
		question3.content="Question 3";
		question3.categorytype=TypeCategory.RUBY;
		question3.typeName=Type.ESSAY;
		question3.creator=acc3;
		question3.createDate=new Date("2020-10-10");
/*		
		System.out.println("question: ");
		System.out.println(question1.qID);
		System.out.println(question1.content);
		System.out.println(question1.categorytype);
		System.out.println(question1.typeName);
		System.out.println(question1.creator.fullName);
		System.out.println(question1.createDate);
		
*/		
		
//Answer 
		Ansswer answer1=new Ansswer();
		answer1.answerID=1;
		answer1.content="answer 1";
		answer1.question=question1;
		
		
		Ansswer answer2=new Ansswer();
		answer2.answerID=2;
		answer2.content="answer 2";
		answer2.question=question2;
		
		Ansswer answer3=new Ansswer();
		answer3.answerID=3;
		answer3.content="answer 3";
		answer3.question=question3;
/*		
		System.out.println("answer: ");
		System.out.println(answer1.answerID);
		System.out.println(answer1.content);
		System.out.println(answer1.question.content);
		
*/		
		
// 	Exam:
		Exam exam1=new Exam();
		exam1.examID=1;
		exam1.code="AB";
		exam1.title="Exam1";
		exam1.acc=acc2;
		exam1.createDate=new Date("2020/9/9");
		
		Question[] qexam = {question1,question3};
		exam1.questions= qexam;
		
		
		Exam exam2=new Exam();
		exam2.examID=2;
		exam2.code="AC";
		exam2.title="Exam2";
		exam2.acc=acc3;
		exam2.createDate= new Date("2020/9/9");
		
		Question[] qexam1 = {question2,question3};
		exam2.questions= qexam1;
		
		
		Exam exam3=new Exam();
		exam3.examID=3;
		exam3.code="CC";
		exam3.title="Exam3";
		exam3.acc=acc1;
		exam3.createDate= new Date("2020/9/9");
	
		Question[] qexam2 = {question3};
		exam3.questions=qexam2 ;
/*		
		System.out.println("Exam: ");
		System.out.println(exam3.examID);
		System.out.println(exam3.code);
		System.out.println(exam3.title);
		System.out.println(exam3.acc.fullName);
		System.out.println(exam3.createDate);
		System.out.println(exam3.questions);
*/		
		
		
// Duration:th�?i gian thi 
// group[] exam và Exam[] group
// cú pháp các kiểu Enum , Boolean 
// Sử dụng các đối tượng tham số chiếu đến đối tượng khác 
		
//In thông tin ra :
/*
		System.out.println("thông tin phòng ban 1: ");
		System.out.println(dep1.departmentID);
		System.out.println(dep1.departmentName);
		System.out.println("\n");
*/		
		
		
		
	
//	////////////////////////////////////////////////////////////////////	
/*
  Question 1:
		Kiểm tra account thứ 2
		Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
		"Nhân viên này chưa có phòng ban"
		Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là ..."
		*/		
		
		
		if (acc2.department==null){
			System.out.println("Nhân viên này chưa có phòng ban");
		}
		else
		{System.out.println("Phòng ban của nhân viên này là " + acc2.department.departmentName);} 
		
		
/*
Kiểm tra account thứ 2
-Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
-Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
này là Java Fresher, C# Fresher"
-Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là ngư�?i
quan tr�?ng, tham gia nhi�?u group"
-Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
ngư�?i hóng chuyện, tham gia tất cả các group"		
 */
		int a = acc2.group.length;
		if(acc2.group == null ) {
			System.out.println("Nhân viên này chưa có group");
		}
		else if(a==1 || a==2 ){
			System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");	
		}else if(a==3) {
			System.out.println("Nhân viên này là ngư�?i quan tr�?ng, tham gia nhi�?u group");
		}else {
			System.out.println("Nhân viên này là ngư�?i hóng chuyện, tham gia tất cả các group");
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}

