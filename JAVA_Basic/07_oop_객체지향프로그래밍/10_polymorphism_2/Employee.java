package example_09_17_polymorphism;

public class Employee extends Person {

	private String dept;
	private String job;
	private int salary;
	
	public Employee() {}
	public Employee(String type, String name, String tel, String dept, String job, int salary) {
		super(type, name, tel);
		this.dept = dept;
		this.job =job;
		this.salary = salary;
	}
	
	public String getDept() {
		return dept;
	}
	public String getJob() {
		return job;
	}
	public int getSalary() {
		return salary;
	}
	// Person의 print() 기능 재정의
	@Override
	public void print() {
		super.print();
		System.out.println("소속부서: " + dept);
		System.out.println("담당업무: " + job);
		System.out.println("급여: " + salary);
	}
}
