package Assignment1;

import java.util.Scanner;

public class nhap {

	public static void main(String[] args) {
	Scanner sc=new Scanner(System.in);
	System.out.println("nhập điểm Toán");
	float toan=sc.nextFloat();
	System.out.println("nhập điểm hóa: ");
	float hoa=sc.nextFloat();
	System.out.println("nhập điểm lý: ");
	float ly= sc.nextFloat();
	float tong=toan+hoa+ly;
	if(tong>=35 && tong<=100) {
		System.out.println("đủ đkien");
	}else {
		System.out.println("không đủ dkien hoặc nhập sai điểm");
	}
	if(toan<35) {
		System.out.println("result is failed");
	if (ly<35) {
		System.out.println("result is failed");
		}
	if(hoa<35) {
		System.out.println("result is failed");
	}
	
	}
	}

}
