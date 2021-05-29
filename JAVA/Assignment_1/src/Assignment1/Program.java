package Assignment1;


import java.util.Date;
public class Program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SinhVien sv =new  SinhVien();
		sv.maSV=001;
		sv.ten="Nguyễn Văn Thành";
		sv.tuoi=20;
		sv.queQuan="Hưng Yên";
		sv.heSV= HeSV.ĐAI_HỌC;
		sv.nghanh=NghanhHoc.CNTT;
	
		
		
		MonHoc mon1=new MonHoc();
		mon1.maMon=1;
		mon1.soTin=5;
		mon1.tenMon="Tin";
		mon1.giangVien="Nam";
		mon1.thoiGian=new Date("2020-1-1");
		
		
		Lop lop1=new Lop();
		lop1.maLop=1;
		lop1.monhoc=mon1;
		lop1.giangVien="An";
		lop1.soSV=150;
		lop1.soTin=5;
		lop1.tenLop="T01";
		lop1.thoiGian= new Date("2021-5-25");
		
		
		GiangVien gv=new GiangVien();
		gv.maGV=1;
		gv.tenGV="Giang";
		gv.maMon=mon1;
		gv.maLop=lop1;
		gv.queQuan="hà nội";
		gv.dayMon="Tin";
		gv.luong=10000;
		
	}

}
