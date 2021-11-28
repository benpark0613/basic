package example_09_09_constructor;

public class Sample1App {

	public static void main(String[] args) { // 항상 main 메소드가 진입지점
		// 값 변경 기능이 구현된 Sample1객체 생성
		Sample1 sample = new Sample1();
		// 변경할 값 생성
		int number = 100;
		Student student = new Student("컴퓨터공학과", "김유신", "010-1111-1111");
		
		System.out.println();
		System.out.println("changeValue메소드 실행 전 number: " + number);
		System.out.println("changeValue메소드 실행 전 student: ");
		student.printStudentInfo();
		
		// changeValue() 메소드를 실행해서 값 변경하기
		sample.changeValue(number);
		sample.changeValue(student);
		
		System.out.println();
		System.out.println("changeValue메소드 실행 후 number: " + number);
		System.out.println("changeValue메소드 실행 후 student: ");
		student.printStudentInfo();
		
	}
}
