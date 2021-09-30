package example_09_28_inner_class_example;

import example_09_28_inner_class_example.Employee.EmployeeBuilder;

public class EmployeeApp {

	public static void main(String[] args) {
		
		/*
		 * Employee객체는 생성자를 이용해서 생성할 수 없다.
		 * 
		 * public class Employee {
		 * 		private int no;
		 * 		private String name;
		 * 
		 * 		private Employee() {}
		 * 		private Employee(int no, String name, String dept, ... ) {}
		 * }
		 */
//		Employee employee = new Employee();
//		Employee employee = new Employee(100, "홍길동", "영업팀", "과장", "hong@gmail.com", "010-1111-1111", "해외엽업",
//				45000000L, 0L, new Date());
		// 메소드 체이닝
		// Builder객체를 이용해서 객체를 생성하고 초기화된 객체를 획득
		EmployeeBuilder builder = Employee.builder();
		Employee employee = builder.no(100)
									.name("홍길동")
									.dept("영업1팀")
									.position("과장")
									.salary(5_000_000)
									.job("해외영업")
									.build();
		// Builder객체를 이용해서 객체를 생성하고 초기화된 객체를 획득
		Employee employee2 = Employee.builder()
								.no(200)
								.name("김유신")
								.dept("연구소")
								.salary(4_000_000)
								.build();
		
	}
}
