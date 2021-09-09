package example_09_09_constructor;

public class Student {

	int no;
	String dept;
	int grade;
	String name;
	String email;
	String phone;
	
	// 생성자가 하나도 정의되어 있지 않으면 소스(Student.java)를 컴파일해서 실행파일(Student.class)을 만들 때
	// 실행파일(Student.class)에 기본생성자 메소드가 자동으로 추가된다.
	/*
	 * 컴파일러가 자동으로 추가한 기본 생성자 메소드
	 * public Student() {
	 * 
	 * }
	 */
	
	// 직접 기본 생성자 메소드를 정의함.
	public Student() {
		System.out.println("기본 생성자 메소드가 실행됨.");
		// 멤버변수 초기화하기
		no = 0;
		dept = "컴퓨터공학과";
		grade = 1;
		name = "이응수";
		email = "eungsulee@gmail.com";
		phone = "010-1234-1234";
	}
	
	// 신입생을 위해서 학과, 이름, 전화번호만 전달받아서 Student객체를 초기화하는 생성자 메소드를 정의함
	public Student(String studDept, String studName, String studPhone) {
		no = 0;
		dept = studDept;
		grade = 1;
		name = studName;
		email = "없음";
		phone = studPhone;
	}
	
	// 매개변수가 있는 생성자를 정의함.
	public Student(int studNo, String studDept, int studGrade, String studName, String studEmail, String studPhone) {
		no = studNo;
		dept = studDept;
		grade = studGrade;
		name = studName;
		email = studEmail;
		phone = studPhone;
	}
	
	// 학생정보를 화면에 출력하는 멤버메소드 정의하기
	void printStudentInfo() {
		System.out.println("학   번: " + no);
		System.out.println("소속학과: " + dept);
		System.out.println("학   년: " + grade);
		System.out.println("이   름: " + name);
		System.out.println("메   일: " + email);
		System.out.println("전화번호: " + phone);
		System.out.println();
	}
}
