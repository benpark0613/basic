package example_09_17_polymorphism;

public class Professor extends Person {
	
	private String dept;
	private String position;
	private String researchProject;
	
	public Professor() {}
	public Professor(String type, String name, String tel, String dept, String position, String reserchProject) {
		super(type, name, tel);
		this.dept = dept;
		this.position = position;
		this.researchProject = reserchProject;
	}
	
	public String getDept() {
		return dept;
	}
	public String getPosition() {
		return position;
	}
	public String getResearchProject() {
		return researchProject;
	}
	// Person의 print() 재정의
	@Override
	public void print() {
		super.print();
		System.out.println("담당학과: " + dept);
		System.out.println("직위: " + position);
		System.out.println("연구과제: " + researchProject);
	}
}
