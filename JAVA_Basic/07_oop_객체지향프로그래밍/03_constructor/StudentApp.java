package example_09_09_constructor;

public class StudentApp {

	public static void main(String[] args) {
		
		// Student 객체 생성하기
		// 		1. new 키워드 다음에 생성자 메소드를 적는다.
		// 		2. new 키워드는 생성자 메소드의 이름과 동일한 이름의 실행파일(Student.class)를 메모리에 로딩한다.
		//		3. 메모리에 로딩된 실행파일(Student.class)을 설계도 삼아서 Student객체를 생성한다.
		//		4. Student객체의 생성이 완료되면, 생성자 메소드를 실행해서 객체 생성 직후에 수행할 작업을 실행시킨다.
		//		5. Student객체의 주소값이 참조변수 student1에 대입된다.
		Student student1 = new Student();
		// Student 객체 생성하기
		// 		1. new 키워드 다음에 생성자 메소드를 적는다.
		//		3. 메모리에 로딩된 실행파일(Student.class)을 설계도 삼아서 Student객체를 생성한다.
		//		4. Student객체의 생성이 완료되면, 생성자 메소드를 실행해서 객체 생성 직후에 수행할 작업을 실행시킨다.
		//		5. Student객체의 주소값이 참조변수 student2에 대입된다.
		Student student2 = new Student();
		
		// 생성된 객체의 주소값을 가지고 있는 참조변수로 생성자 메소드를 실행할 수 없다.
		// student1.Sample();
		// student2.Sample();
		
		// 생성자를 이용해서 생성된 객체의 멤버변수가 초기화 되었다. 초기화된 멤버변수의 값 출력하기
		System.out.println(student1.name+ ", " + student2.name);
		System.out.println(student1.dept+ ", " + student2.dept);
		System.out.println(student1.grade+ ", " + student2.grade);
		System.out.println(student1.email+ ", " + student2.email);
		
		// 매개변수가 있는 생성자 메소드 실행하기 - Student객체의 모든 멤버변수를 초기화하는 생성자 메소드를 사용함.
		Student student3 = new Student(100, "컴퓨터공학과", 3, "홍대영", "hong@gmail.com", "010-1234-1234");
		Student student4 = new Student(200, "환경공학과", 2, "이광수", "gwang@gmail.com", "010-1111-1234");
		
		// 매개변수가 있는 생성자 메소드로 객체를 초기화한 후 Student객체의 학생정보 출력하기
		student3.printStudentInfo();
		student4.printStudentInfo();
		
		// 매개변수가 있는 생성자 메소드 실행시키기 - Student객체의 멤버변수 중 일부만 초기화하는 생성자 메소드를 사용함.
		Student student5 = new Student("국어국문학과", "김알지", "010-1235-3522");
		Student student6 = new Student("영어영문학과", "박영어", "010-5535-3522");
		
		// 매개변수의 일부를 초기화 시키는 생성자 메소드로 객체를 초기화한 후 Student객체의 학생정보 출력하기
		student5.printStudentInfo();
		student6.printStudentInfo();
		
	}
}
