package example_09_17_polymorphism;

public class Student extends Person {

	private int grade;
	private String dept;
	
	public Student() {}
	public Student(String type, String name, String tel, int grade, String dept) {
		super(type, name, tel);
		this.grade = grade;
		this.dept = dept;
	}
	
	public int getGrade() {
		return grade;
	}
	public String getDept() {
		return dept;
	}
	// Person의 print() 기능 재정의
	@Override
	public void print() {
		super.print();
		System.out.println("학년: " + grade);
		System.out.println("소속학과: " + dept);		
	}
	
}
