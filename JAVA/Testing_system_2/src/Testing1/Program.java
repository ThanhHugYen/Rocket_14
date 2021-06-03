package Testing1;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;

public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
// Department:
		Department dep1 = new Department();
		dep1.departmentID = 1;
		dep1.departmentName = "Maketing";

		Department dep2 = new Department();
		dep2.departmentID = 2;
		dep2.departmentName = "Sale";

		Department dep3 = new Department();
		dep3.departmentID = 3;
		dep3.departmentName = "Deverloper";

// Position:		
		Position pos1 = new Position();
		pos1.positionID = 1;
		pos1.positionName = "DEV";

		Position pos2 = new Position();
		pos2.positionID = 2;
		pos2.positionName = "PM";

		Position pos3 = new Position();
		pos3.positionID = 3;
		pos3.positionName = "Leader";

// Group:
		Group gr1 = new Group();
		gr1.groupID = 1;
		gr1.groupName = "AA1";
		gr1.createDate = new Date("2020/6/10");

		Group gr2 = new Group();
		gr2.groupID = 2;
		gr2.groupName = "AA2";
		gr2.createDate = new Date("2020/6/1");

		Group gr3 = new Group();
		gr3.groupID = 3;
		gr3.groupName = "AA3";
		gr3.createDate = new Date("2020/3/10");

// Account:
		Account acc1 = new Account();
		acc1.ID = 1;
		acc1.userName = "Thành";
		acc1.fullName = "Nguyễn Văn Thành ";
		acc1.email = "thanh2001@gmail.com";
		acc1.department = dep1;
		acc1.position = pos3;
		acc1.createDate = new Date("2020/1/1");
		Group[] groupp = { gr1, gr2 };
		acc1.group = groupp;

		Account acc2 = new Account();
		acc2.ID = 2;
		acc2.userName = "Linh";
		acc2.fullName = "Lê Linh ";
		acc2.email = "linh2001@gmail.com";
		acc2.department = dep2;
		acc2.position = pos1;
		acc2.createDate = new Date("2020/2/5");
		Group[] groupp2 = { gr2, gr3 };
		acc2.group = groupp2;

		Account acc3 = new Account();
		acc3.ID = 3;
		acc3.userName = "Chi";
		acc3.fullName = "Lê Chi ";
		acc3.email = "Chi2004@gmail.com";
		acc3.department = dep1;
		acc3.position = pos1;
		acc3.createDate = new Date("2019/5/5");
		Group[] groupp3 = { gr2, gr3 };
		acc3.group = groupp3;

//TypeQuestion:
		TypeQuestion tQ1 = new TypeQuestion();
		tQ1.typeID = 1;
		tQ1.typeName = Type.MULTIPLE_CHOICE;

		TypeQuestion tQ2 = new TypeQuestion();
		tQ2.typeID = 2;
		tQ2.typeName = Type.ESSAY;

		TypeQuestion tQ3 = new TypeQuestion();
		tQ3.typeID = 3;
		tQ3.typeName = Type.MULTIPLE_CHOICE;

//CategoryQuestion:
		TypeQ cate1 = new TypeQ();
		cate1.categoryID = 1;
		cate1.categorytype = TypeCategory.NET;

		TypeQ cate2 = new TypeQ();
		cate2.categoryID = 2;
		cate2.categorytype = TypeCategory.Java;

		TypeQ cate3 = new TypeQ();
		cate3.categoryID = 3;
		cate3.categorytype = TypeCategory.PYTHON;

// Question
		Question question1 = new Question();
		question1.qID = 1;
		question1.content = "Question 1";
		question1.categorytype = TypeCategory.PYTHON;
		question1.typeName = Type.MULTIPLE_CHOICE;
		question1.creator = acc1;

		Question question2 = new Question();
		question2.qID = 2;
		question2.content = "Question 2";
		question2.categorytype = TypeCategory.SQL;
		question2.typeName = Type.ESSAY;
		question2.creator = acc2;

		Question question3 = new Question();
		question3.qID = 3;
		question3.content = "Question 3";
		question3.categorytype = TypeCategory.RUBY;
		question3.typeName = Type.ESSAY;
		question3.creator = acc3;

		System.out.println("vẫn chạy được");
//Answer 
		Ansswer answer1 = new Ansswer();
		answer1.answerID = 1;
		answer1.content = "answer 1";
		answer1.question = question1;
		answer1.isCorrect = true;

		Ansswer answer2 = new Ansswer();
		answer2.answerID = 2;
		answer2.content = "answer 2";
		answer2.question = question2;
		answer2.isCorrect = false;

		Ansswer answer3 = new Ansswer();
		answer3.answerID = 3;
		answer3.content = "answer 3";
		answer3.question = question3;
		answer3.isCorrect = true;

// 	Exam:
		Exam exam1 = new Exam();
		exam1.examID = 1;
		exam1.code = "AB";
		exam1.title = "Exam1";
		exam1.acc = acc2;
		exam1.createDate = new Date("2020/9/9");

		Question[] qexam = { question1, question3 };
		exam1.questions = qexam;

		Exam exam2 = new Exam();
		exam2.examID = 2;
		exam2.code = "AC";
		exam2.title = "Exam2";
		exam2.acc = acc3;
		exam2.createDate = new Date("2020/9/9");

		Question[] qexam1 = { question2, question3 };
		exam2.questions = qexam1;

		Exam exam3 = new Exam();
		exam3.examID = 3;
		exam3.code = "CC";
		exam3.title = "Exam3";
		exam3.acc = acc1;
		exam3.createDate = new Date("2020/9/9");

		Question[] qexam2 = { question3 };
		exam3.questions = qexam2;

//             ................................EXERCISE 1............................................................			
//                   ............................................................................................			
		/*
		 * Question 1: Kiểm tra account thứ 2 Nếu không có phòng ban (tức là department
		 * == null) thì sẽ in ra text "Nhân viên này chưa có phòng ban" Nếu không thì sẽ
		 * in ra text "Phòng ban của nhân viên này là ..."
		 */

		if (acc2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			System.out.println("Phòng ban của nhân viên này là " + acc2.department.departmentName);
		}

		/*
		 * Kiểm tra account thứ 2 -Nếu không có group thì sẽ in ra text
		 * "Nhân viên này chưa có group" -Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra
		 * text "Group của nhân viên này là Java Fresher, C# Fresher" -Nếu có mặt trong
		 * 3 Group thì sẽ in ra text "Nhân viên này là người quan trọng, tham gia nhiều
		 * group" -Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
		 * người hóng chuyện, tham gia tất cả các group"
		 */
		if (acc2.group == null) {
			System.out.println("Nhân viên này chưa có group");
		} else {
			int a = acc2.group.length;
			if (a == 1 || a == 2) {
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
			} else if (a == 3) {
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
			} else {
				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
			}
		}

		/*
		 * Question 3: Sử dụng toán tử ternary để làm Question 1
		 */
		System.out.println(acc2.department == null ? "Nhân viên này chưa có phòng ban"
				: "Phòng ban của nhân viên này là " + acc2.department.departmentName);

		/*
		 * Question 4: Sử dụng toán tử ternary để làm yêu cầu sau: Kiểm tra Position của
		 * account thứ 1 Nếu Position = Dev thì in ra text "Đây là Developer" Nếu không
		 * phải thì in ra text "Người này không phải là Developer"
		 */

		System.out.println(
				acc1.position.positionName == "DEV" ? "Đây là Developer" : "Người này không phải là Developer");

		/*
		 * Question 5: Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format
		 * sau: Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên" Nếu số lượng
		 * account = 2 thì in ra "Nhóm có hai thành viên" Nếu số lượng account = 3 thì
		 * in ra "Nhóm có ba thành viên" Còn lại in ra "Nhóm có nhiều thành viên"
		 */

		if (gr1.acount == null) {
			System.out.println("nhóm không có thành viên nào");
		} else {
			int a = gr1.acount.length;
			switch (a) {
			case 1:
				System.out.println("Nhóm có một thành viên");
				break;
			case 2:
				System.out.println("Nhóm có hai thành viên");
				break;
			case 3:
				System.out.println("Nhóm có ba thành viên");
				break;
			default:
				System.out.println("Nhóm có một đống thành viên");
				break;

			}
		}

		/*
		 * Question 6: Sử dụng switch case để làm lại Question 2
		 */

		if (acc2.group == null) {
			System.out.println("Nhân viên này chưa có group");
		} else {
			int count_group = acc2.group.length;
			switch (count_group) {
			case 1:
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
				break;
			case 2:
				System.out.println("Group của nhân viên này là Java Fresher, C# Fresher ");
				break;
			case 3:
				System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
				break;
			default:
				System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
				break;
			}

		}

		/*
		 * Question 7: Sử dụng switch case để làm lại Question 4
		 */

		String accp = acc1.position.positionName;
		switch (accp) {
		case "DEV": {
			System.out.println("Đây là Developer");
			break;
		}
		default: {
			System.out.println("Người này không phải là Developer");
			break;
		}
		}

		/*
		 * Question 8: In ra thông tin các account bao gồm: Email, FullName và tên phòng
		 * ban của họ
		 */
		Account[] acc = { acc1, acc2, acc3 };
		for (Account acount : acc) {
			System.out.println("\n" + "email: " + acount.email + "\n" + "fullName: " + acount.fullName + "\n"
					+ "phòng ban: " + acount.department.departmentName + "\n");
		}

		/*
		 * Question 9: In ra thông tin các phòng ban bao gồm: id và name
		 */

		Department[] dep = { dep1, dep2, dep3 };
		for (Department a : dep) {
			System.out.println(a.departmentID + a.departmentName);
		}

		/*
		 * Question 10: In ra thông tin các account bao gồm: Email, FullName và tên
		 * phòng ban của họ theo định dạng như sau: Thông tin account thứ 1 là: Email:
		 * NguyenVanA@gmail.com Full name: Nguyễn Văn A Phòng ban: Sale Thông tin
		 * account thứ 2 là: Email: NguyenVanB@gmail.com Full name: Nguyễn Văn B Phòng
		 * ban: Marketting
		 */
		Account[] arrayAccount = { acc1, acc2, acc3 };
		for (int i = 0; i < arrayAccount.length; i++) {
			System.out.println("\nThông tin account thứ " + (i + 1) + " là: ");
			System.out.println("Email: " + arrayAccount[i].email);
			System.out.println("Full name: " + arrayAccount[i].fullName);
			System.out.println("Phòng ban: " + arrayAccount[i].department.departmentName);
		}

		/*
		 * Question 11: In ra thông tin các phòng ban bao gồm: id và name theo định dạng
		 * sau: Thông tin department thứ 1 là: Id: 1 Name: Sale Thông tin department thứ
		 * 2 là: Id: 2 Name: Marketing
		 */

		Department[] depk = { dep1, dep2, dep3 };
		for (int i = 0; i < depk.length; i++) {
			System.out.println("Thông ti department thứ " + (i + 1) + " là: ");
			System.out.println("Id: " + depk[i].departmentID);
			System.out.println("Name: " + depk[i].departmentName);
		}

		/*
		 * Question 12: Chỉ in ra thông tin 2 department đầu tiên theo định dạng như
		 * Question 10
		 */

		Account[] arrayAccountt = { acc1, acc2, acc3 };
		for (int i = 0; i < 2; i++) {
			System.out.println("\n\nThông tin account thứ " + (i + 1) + " là: ");
			System.out.println("Email: " + arrayAccountt[i].email);
			System.out.println("Full name: " + arrayAccountt[i].fullName);
			System.out.println("Phòng ban: " + arrayAccountt[i].department.departmentName);

		}

		/*
		 * Question 13: In ra thông tin tất cả các account ngoại trừ account thứ 2
		 */
		System.out.println("\n\nCâu 13:");
		Account[] array = { acc1, acc2, acc3 };
		for (int i = 0; i < array.length; i++) {
			if (i == 1) {
			} else {
				System.out.println("\nThông tin account thứ " + (i + 1) + " là: ");
				System.out.println("Email: " + array[i].email);
				System.out.println("Full name: " + array[i].fullName);
				System.out.println("Phòng ban: " + array[i].department.departmentName);
			}
		}

		/*
		 * Question 14: In ra thông tin tất cả các account có id < 4
		 */
		System.out.println("\n\nCâu 14:");
		for (int i = 0; i < array.length; i++) {
			if (array[i].ID < 4) {
				System.out.println("\nThông tin account thứ " + (i + 1) + " là: ");
				System.out.println("Email: " + array[i].email);
				System.out.println("Full name: " + array[i].fullName);
				System.out.println("Phòng ban: " + array[i].department.departmentName);
			} else {
				System.out.println("không có account nào có ID nhỏ hơn 4");
			}
		}

		/*
		 * Question 15: In ra các số chẵn nhỏ hơn hoặc bằng 20
		 */
		System.out.println("\nCâu 15: ");
		System.out.println("các số chẵn <= 20 là: ");
		for (int i = 0; i <= 20; i++) {
			if (i % 2 == 0) {

				System.out.print(i + " ");
			}

		}

		/*
		 * WHILE 
		 * Question 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE
		 * kết hợp với lệnh break, continue
		 */
		System.out.println("\n\nCâu 16a:");
		Account[] arr = { acc1, acc2, acc3 };
		int i = 0;
		while (i < arr.length) {
			System.out.println("\nThông tin account thứ " + (i + 1) + " là: ");
			System.out.println("Email: " + arr[i].email);
			System.out.println("Full name: " + arr[i].fullName);
			System.out.println("Phòng ban: " + arr[i].department.departmentName);
			i++;
		}

		// Câu 16b:

		System.out.println("Câu 16b: ");
		int i1 = 0;
		while (i1 < depk.length) {
			System.out.println("Thông ti department thứ " + (i1 + 1) + " là: ");
			System.out.println("Id: " + depk[i1].departmentID);
			System.out.println("Name: " + depk[i1].departmentName);
			i1++;
		}

		// Câu 16c:
		System.out.println("Câu 16c: ");

		int i2 = 0;
		while (i2 < 2) {
			System.out.println("\n\nThông tin account thứ " + (i2 + 1) + " là: ");
			System.out.println("Email: " + arrayAccountt[i2].email);
			System.out.println("Full name: " + arrayAccountt[i2].fullName);
			System.out.println("Phòng ban: " + arrayAccountt[i2].department.departmentName);
			i2++;
		}

		// Câu 16d:
		System.out.println("Câu 16d: ");

		int i3 = 0;
		while (i3 < array.length) {
			if (i3 == 1) {
			} else {
				System.out.println("\nThông tin account thứ " + (i3 + 1) + " là: ");
				System.out.println("Email: " + array[i3].email);
				System.out.println("Full name: " + array[i3].fullName);
				System.out.println("Phòng ban: " + array[i3].department.departmentName);
			}
			i3++;
		}

		// Câu 16e:

		System.out.println("Câu 16e: ");

		int i4 = 0;
		while (i4 < array.length) {
			if (array[i4].ID < 4) {
				System.out.println("\nThông tin account thứ " + (i4 + 1) + " là: ");
				System.out.println("Email: " + array[i4].email);
				System.out.println("Full name: " + array[i4].fullName);
				System.out.println("Phòng ban: " + array[i4].department.departmentName);
			} else {
				System.out.println("không có account nào có ID nhỏ hơn 4");
			}
			i4++;
		}

		// Câu 16f :
		System.out.println("Câu 16f: ");
		int i5 = 0;
		while (i5 <= 20) {
			if (i5 % 2 == 0) {
				System.out.println(i5 + " ");
			}
			i5++;
		}

		/*
		 * DO-WHILE Question 17: Làm lại các Question ở phần FOR bằng cách sử dụng
		 * DO-WHILE kết hợp với lệnh break, continue
		 */
		System.out.println("câu 17a: ");
		int l = 0;
		do {
			System.out.println("\nThông tin account thứ " + (l + 1) + " là: ");
			System.out.println("Email: " + arr[l].email);
			System.out.println("Full name: " + arr[l].fullName);
			System.out.println("Phòng ban: " + arr[l].department.departmentName);
			l++;
		} while (l < arr.length);

		
		
		/*
		 * #######################------Exercise 2-----#################################### 
		 * (Optional): System out printf
		 *  Question 1: Khai báo 1 số nguyên = 5
		 * và sử dụng lệnh System out printf để in ra số nguyên đó
		 */

		
		System.out.println("\n\nCâu 1(exercise 2)");
		Scanner sc = new Scanner(System.in);
		System.out.println("\nnmời nhập 1 số nguyên: ");
		int number = sc.nextInt();
		System.out.println("số nguyên bạn vừa nhập là: " + number);
		 

		/*
		 * Question 2: Khai báo 1 số nguyên = 100 000 000 và sử dụng lệnh System out
		 * printf để in ra số nguyên đó thành định dạng như sau: 100,000,000
		 */

		System.out.println("\n\nCâu 2: ");
		int trieu = 100000000;
		System.out.printf(Locale.US, "%,d%n", trieu);

		/*
		 * Question 3: Khai báo 1 số thực = 5,567098 và sử dụng lệnh System out printf
		 * để in ra số thực đó chỉ bao gồm 4 số đằng sau
		 */

		float f = 5.567098f;
		System.out.printf("%5.4f 1%n", f);

		/*
		 * Question 4: Khai báo Họ và tên của 1 học sinh và in ra họ và tên học sinh đó
		 * theo định dạng như sau: Họ và tên: "Nguyễn Văn A" thì sẽ in ra trên console
		 * như sau: Tên tôi là "Nguyễn Văn A" và tôi đang độc thân.
		 */
		
		Scanner ny = new Scanner(System.in);
		System.out.println("\nHọ và tên: ");
		String hvt = ny.nextLine();

		System.out.println("Tên tôi là " + hvt + " và tôi có người yêu");
		  
		 /* // Question 5: //Lấy thời gian bây giờ và in ra theo định dạng sau: //
		 * 24/04/2020 11h:16p:20s
		 * 
		 */
		String parttern = "dd,MM,yyyy HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(parttern);
		String date = sdf.format(new Date());
		System.out.println(date);

		/*
		 * Question 6: In ra thông tin account (như Question 8 phần FOREACH) theo định
		 * dạng table (giống trong Database)
		 */

		Account[] bien = { acc1, acc2, acc3 };
		System.out.printf("%-25s%-25s%-15s\n", "email", "fullName", "departmentName");
		for (Account bien1 : bien) {
			System.out.printf("%-25s%-25s%-15s\n", bien1.email, bien1.fullName, bien1.department.departmentName);
		}

		
		
		
		
		
		/*
		 * ---------------------Exercise 3 (Optional): Date Format ------------------------
		 * Question 1: In ra thông tin Exam thứ 1 và
		 * property create date sẽ được format theo định dạng vietnamese
		 */

		Locale locale = new Locale("vn", "VN");
		DateFormat dateformat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
		String datea = dateformat.format(exam1.createDate);
		System.out.println(exam1.examID + ": " + datea);
		System.out.println(exam1.code);
		System.out.println(exam1.title);
		System.out.println(exam1.acc);
		System.out.println(exam1.questions);

		/*
		 * Question 2: In ra thông tin: Exam đã tạo ngày nào theo định dạng Năm – tháng
		 * – ngày – giờ – phút – giây
		 */
		String q2 = "yyyy,MM,dd HH:mm:ss";
		SimpleDateFormat ohno = new SimpleDateFormat(q2);
		System.out.println(exam1.examID);
		String q23 = ohno.format(exam1.createDate);
		System.out.println(q23);
		/*
		 * Question 3: Chỉ in ra năm của create date property trong Question 2
		 */

		String t1 = "yyyy";
		SimpleDateFormat t2 = new SimpleDateFormat(t1);
		String t3 = t2.format(exam2.createDate);
		System.out.println(t3);

		/*
		 * Question 4: Chỉ in ra tháng và năm của create date property trong Question 2
		 */
		String h1 = "yyyy-MM";
		SimpleDateFormat h2 = new SimpleDateFormat(h1);
		String h3 = h2.format(exam2.createDate);
		System.out.println(h3);

		/*
		 * Question 5: Chỉ in ra "MM-DD" của create date trong Question 2
		 */
		h1 = "dd-MM";
		h2 = new SimpleDateFormat(h1);
		h3 = h2.format(exam2.createDate);
		System.out.println(h3);

		
		
		
		
		
		/*--------------------------Exercise 4 (Optional): Random Number---------------------
		 * Question 1: In ngẫu nhiên ra 1 số nguyên
		 */

		Random random = new Random();

		int n = random.nextInt();
		System.out.println("Số ngẫu nhiên: " + n);

		/*
		 * Question 2: In ngẫu nhiên ra 1 số thực
		 */

		float k = random.nextFloat();
		System.out.println(k);

		/*
		 * Question 3: Khai báo 1 array bao gồm các tên của các bạn trong lớp, sau đó in
		 * ngẫu nhiên ra tên của 1 bạn
		 */
		String name[] = { "thành", "linh", "chi" };

		int nameRandom = random.nextInt(name.length);
		System.out.println(name[nameRandom]);

		/*
		 * Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12- 1995
		 */

		int minDay = (int) LocalDate.of(1995, 7, 24).toEpochDay();
		int maxDay = (int) LocalDate.of(1995, 12, 20).toEpochDay();
		System.out.println("minday:" + minDay);
		System.out.println("maxday:" + maxDay);
		long randomInt = minDay + random.nextInt(maxDay - minDay);
		LocalDate randomDay = LocalDate.ofEpochDay(randomInt);
		System.out.println(randomDay);

		/*
		 * Question 5: Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
		 */

		int now = (int) LocalDate.now().toEpochDay();
		int randomDate = now - random.nextInt(365);
		LocalDate reusultDate = LocalDate.ofEpochDay(randomDate);
		System.out.println("Ngày ngẫu nhiên là: " + reusultDate);

		/*
		 * Question 6: Lấy ngẫu nhiên 1 ngày trong quá khứ
		 */
		now = (int) LocalDate.now().toEpochDay();
		randomDate = now - random.nextInt(now);
		LocalDate reusultDated = LocalDate.ofEpochDay(randomDate);
		System.out.println("Ngày ngẫu nhiên là: " + reusultDated);
		/*
		 * Question 7: Lấy ngẫu nhiên 1 số có 3 chữ số
		 */
		int z = random.nextInt(10 - 5 + 1) + 5;
		System.out.println(z);

		
		
		
		
		
		/*--------------Exercise 5: Input from console---------------------
		 * Question 1: Viết lệnh cho phép người dùng nhập 3 số nguyên vào chương trình
		 */

		Scanner scd = new Scanner(System.in);
		
		  System.out.println("nhập số nguyên 1 : "); int l1=sc.nextInt();
		  System.out.println("nhập số nguyên 2 : "); int l2=sc.nextInt();
		  System.out.println("nhập số nguyên 3 : "); int l3=sc.nextInt();
		  System.out.println(l1+" "+l2+" "+l3);
		  
		  /* Question 2: Viết lệnh cho phép người dùng nhập 2 số thực vào chương trình
		 */ 
		  
		  
		  System.out.println("nhập số thực 1 : "); float k1=sc.nextFloat();
		  System.out.println("nhập số thực 2 : "); float k2=sc.nextFloat();
		  System.out.println(k1+" "+k2);
		  
		  /* Question 3: Viết lệnh cho phép người dùng nhập họ và tên
		 */ 
		  System.out.println("nhập họ: "); String j1=sc.nextLine();
		  
		  System.out.println("nhập tên: "); String j2=sc.nextLine();
		  System.out.println("họ tên:"+j1+" "+j2);
		  
		  /* Question 4: Viết lệnh cho phép người dùng nhập vào ngày sinh nhật của họ
		 */ 
		  
		  System.out.println("nhập ngày sinh nhật: "); int pp=sc.nextInt();
		  System.out.println("nhập tháng sinh nhật: "); int pp2=sc.nextInt();
		  System.out.println("nhập năm sinh nhật: "); int pp3=sc.nextInt(); LocalDate
		  new2=LocalDate.of(pp3,pp2,pp); System.out.println("Ngày sinh của bạn là: " +
		  new2);
		  
		  /* Question 5: Viết lệnh cho phép người dùng tạo account (viết thành method)
		 * Đối với property Position, Người dùng nhập vào 1 2 3 4 5 và vào chương trình
		 * sẽ chuyển thành Position.Dev, Position.Test, Position.ScrumMaster,
		 * Position.PM
		 */
		 /*
		  System.out.println("tạo acc: ");
		  
		  
		  Account acc4 = new Account(); System.out.println("Nhập ID: "); acc4.ID =
		  (byte) sc.nextInt(); System.out.println("Nhập email: "); acc4.email =
		  sc.next(); System.out.println("Nhập userName: "); acc4.userName = sc.next();
		  System.out.println("Nhập fullName: "); acc4.fullName = sc.next(); System.out.
		  println("Nhập position (Nhập các số từ 1 đến 4 tương ứng với: 1.Dev, 2.Test, 3.Scrum_Master, 4.PM): "
		  );
		  
		  System.out.println("nhập 1 số: "); int zx=sc.nextInt(); switch(zx) { case 1:
		  Position pos4 = new Position(); pos4.positionName ="DEV"; acc4.position =
		  pos4; break; case 2: Position pos5 = new Position(); pos2.name = "Test";
		  acc.position = pos2; break; case 3: Position pos3 = new Position(); pos3.name
		  = PositionName.Scrum_Master; acc.position = pos3; break; case 4: Position
		  pos4 = new Position(); pos4.name = PositionName.PM; acc.position = pos4;
		  break; } System.out.println("Thông tin Acc vừa nhập, ID: " + acc.id + "
		  
		  Email: " + acc.email + " UserName: "
		  
		  + acc.userName + " FullName: " + acc.fullName + "
		  
		  Position: " + acc.position.name); }
		 */

		/*
		 * Question 6: Viết lệnh cho phép người dùng tạo department (viết thành method)
		 * 
		 */
		 
		  Department dep4 = new Department(); System.out.println("Nhập ID: ");
		  dep4.departmentID = (byte) sc.nextInt(); System.out.println("Nhập Name: ");
		  dep4.departmentName = sc.next();
		  System.out.println("Thông tin Department vừa nhập, ID: " + dep4.departmentID
		  
		  + " Name: " + dep4.departmentName);
		  
		  /*Question 7: Nhập số chẵn từ console
		  */
		  
		  System.out.println("nhập số chẵn"); int chan=sc.nextInt(); if(chan%2==0) {
		  System.out.println(" hợp lệ"); }else { System.out.println("không hợp lệ"); }
		  
		  /* Question 8: Viết chương trình thực hiện theo flow sau: Bước 1: Chương
		  trình in ra text "mời bạn nhập vào chức năng muốn sử dụng" Bước 2: Nếu người
		 * dùng nhập vào 1 thì sẽ thực hiện tạo account Nếu người dùng nhập vào 2 thì sẽ
		 * thực hiện chức năng tạo department Nếu người dùng nhập vào số khác thì in ra
		 * text "Mời bạn nhập lại" và quay trở lại bước 1
		 */
		 
		  System.out.println("mời bạn nhập chức năng :" + "1.tạo account: " +
		  "2.tạo department: "); int nhap=sc.nextInt(); if (nhap==1) { Account acc5 =
		  new Account(); System.out.println("Nhập ID: "); acc5.ID = (byte)
		  sc.nextInt(); System.out.println("Nhập email: "); acc5.email = sc.next();
		  System.out.println("Nhập userName: "); acc5.userName = sc.next();
		  System.out.println("Nhập fullName: "); acc5.fullName = sc.next(); }else
		  if(nhap==2) { Department dep5 = new Department();
		  System.out.println("Nhập ID: "); dep5.departmentID = (byte) sc.nextInt();
		  System.out.println("Nhập Name: "); dep5.departmentName = sc.next(); }else
		  {System.out.println("Mời bạn nhập lại");}
		  
		  /* Question 9: Viết method cho phép người dùng thêm group vào account theo
		 * flow sau: Bước 1: In ra tên các usernames của user cho người dùng xem Bước 2:
		 * Yêu cầu người dùng nhập vào username của account Bước 3: In ra tên các group
		 * cho người dùng xem Bước 4: Yêu cầu người dùng nhập vào tên của group Bước 5:
		 * Dựa vào username và tên của group người dùng vừa chọn, hãy thêm account vào
		 * group đó
		 */ 
		  Account[] uso= {acc1,acc2,acc3};
		  
		  for(Account userN : uso) { System.out.println(userN.userName); }
		  System.out.println("nhập tên user: "); String dark=sc.next(); Group[] gg=
		  {gr1,gr2,gr3}; for(Group ggg:gg) { System.out.println(ggg.groupName); }
		  System.out.println("mời nhập tên group: "); String burk=sc.next();
		  
		  Account acc6 = new Account(); System.out.println("Nhập ID: "); acc6.ID =
		  (byte) sc.nextInt(); System.out.println("Nhập email: "); acc6.email =
		  sc.next();
		  
		  acc6.userName = dark;
		  
		 acc6.fullName = burk;
		  
		  System.out.println("ID: "+acc6.ID+"email: "+acc6.email+"fullName: "+acc6.
		  fullName+"userName: "+acc6.userName+"group: "+acc6.group);
		 

		/*
		 * Bổ sung thêm vào bước 2 của Question 8 như sau: Nếu người dùng nhập vào 3 thì
		 * sẽ thực hiện chức năng thêm group vào account
		 * 
		 * Bổ sung thêm Bước 3 của Question 8 như sau: Sau khi người dùng thực hiện xong
		 * chức năng ở bước 2 thì in ra dòng text để hỏi người dùng
		 * "Bạn có muốn thực hiện chức năng khác không?". Nếu người dùng chọn "Có" thì
		 * quay lại bước 1, nếu người dùng chọn "Không" thì kết thúc chương trình (sử
		 * dụng lệnh return để kết thúc chương trình)
		 */
		/*
		 * while(true) { System.out.println("mời bạn nhập chức năng :" +
		 * "1.tạo account: " + "2.tạo department: "); int nhap2=sc.nextInt(); if
		 * (nhap2==1) { Account acc5 = new Account(); System.out.println("Nhập ID: ");
		 * acc5.ID = (byte) sc.nextInt(); System.out.println("Nhập email: "); acc5.email
		 * = sc.next(); System.out.println("Nhập userName: "); acc5.userName =
		 * sc.next(); System.out.println("Nhập fullName: "); acc5.fullName = sc.next();
		 * }else if(nhap2==2) { Department dep5 = new Department();
		 * System.out.println("Nhập ID: "); dep5.departmentID = (byte) sc.nextInt();
		 * System.out.println("Nhập Name: "); dep5.departmentName = sc.next(); }else
		 * if(nhap2==3) { Group gr5=new Group(); System.out.println("id group:");
		 * gr5.groupID=(byte) sc.nextInt(); System.out.println("name group: ");
		 * gr5.groupName=sc.next(); System.out.println("acc create: ");
		 * gr5.creator=acc2; } else {System.out.println("Mời bạn nhập lại");}
		 * System.out.println("bạn có muốn nhập lại:"
		 * 
		 * + "0.không" +"1.có"); int cnang=sc.nextInt(); if(cnang==0) {
		 * System.out.println("out!"); return;
		 * 
		 * } else { System.out.println("cbi nhập "); } }
		 */
		/*
		 * Question 11: Tiếp tục Question 10 Bổ sung thêm vào bước 2 của Question 8 như
		 * sau: Nếu người dùng nhập vào 4 thì sẽ thực hiện chức năng thêm account vào 1
		 * nhóm ngẫu nhiên, chức năng sẽ được cài đặt như sau: Bước 1: In ra tên các
		 * usernames của user cho người dùng xem
		 * 
		 * 
		 * Bước 2: Yêu cầu người dùng nhập vào username của account Bước 3: Sau đó
		 * chương trình sẽ chọn ngẫu nhiên 1 group Bước 4: Thêm account vào group chương
		 * trình vừa chọn ngẫu nhiên
		 */
		/*
		  while(true) { System.out.println("mời bạn nhập chức năng :" +
		  "1.tạo account: " + "2.tạo department: "); int nhap2=sc.nextInt(); if
		  (nhap2==1) { Account acc5 = new Account(); System.out.println("Nhập ID: ");
		  acc5.ID = (byte) sc.nextInt(); System.out.println("Nhập email: "); acc5.email
		  = sc.next(); System.out.println("Nhập userName: "); acc5.userName =
		  sc.next(); System.out.println("Nhập fullName: "); acc5.fullName = sc.next();
		  }else if(nhap2==2) { Department dep5 = new Department();
		  System.out.println("Nhập ID: "); dep5.departmentID = (byte) sc.nextInt();
		  System.out.println("Nhập Name: "); dep5.departmentName = sc.next(); }else
		  if(nhap2==3) { Group gr5=new Group(); System.out.println("id group:");
		  gr5.groupID=(byte) sc.nextInt(); System.out.println("name group: ");
		  gr5.groupName=sc.next(); System.out.println("acc create: ");
		  gr5.creator=acc2; } else if(nhap2==4) { Account[] test7= {acc1,acc2,acc3};
		  for(Account test8:test7) System.out.println(test8.userName); } else
		  {System.out.println("Mời bạn nhập lại");}
		  System.out.println("bạn có muốn nhập lại:"
		  
		  + "0.không" +"1.có"); int cnang=sc.nextInt(); if(cnang==0) {
		  System.out.println("out!"); return;
		  
		  } else { System.out.println("cbi nhập "); } }
		 */

		/*
		 * EXERCISE 6 : Question 1: Tạo method để in ra các số chẵn nguyên dương nhỏ hơn
		 * 10
		 */

		for (int il = 0; il < 10; il++) {
			if (il % 2 == 0) {
				System.out.println(il);
			} else
				continue;
		}
		/*
		 * Question 2: Tạo method để in thông tin các account
		 */
		Account[] aco = { acc1, acc2, acc3 };
		for (int m = 0; m < aco.length; m++) {
			System.out.println("ID: " + aco[m].ID + " Email: " + aco[m].email + " Username: " + aco[m].userName
					+ " FullName: " + aco[m].fullName + " CreareDate: " + aco[m].createDate);
		}

		/*
		 * Question 3: Tạo method để in ra các số nguyên dương nhỏ hơn 10
		 */

		for (int het = 0; het < 10; het++) {
			System.out.println(het);
		}

	}

}
