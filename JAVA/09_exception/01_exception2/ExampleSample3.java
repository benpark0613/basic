package example_10_13_exception;

import java.util.ArrayList;
import java.util.List;

public class ExampleSample3 {

	public static void main(String[] args) {
		EmployeeManager manager = new EmployeeManager();
		
		// 직원번호로 조회했을 때, 직원정보 혹은 null이 반환되는 경우
		Employee emp1 = manager.getEmployee1(101);
		if (emp1 != null) {
			System.out.println(emp1.getNo() + ", " + emp1.getName());
		} else {
			System.out.println("### 직원정보가 존재하지 않습니다.");
		}
		
		Employee emp2 = manager.getEmployee2(101);
		if (emp2 != null) {
			System.out.println(emp2.getNo() + ", " + emp2.getName());
		} else {
			System.out.println("### 직원정보가 존재하지 않습니다.");
		}
		
		// 직원번호로 조회했을 때, 직원정보가 반환되거나 예외가 발생하는 경우
		// 예외처리여부를 체크하는 예외가 발생하는 경우
		try {
			Employee emp3 = manager.getEmployee3(102);
			System.out.println(emp3.getNo() + ", " + emp3.getName());
		} catch (Exception ex) {
			System.out.println("### 직원정보가 존재하지 않습니다.");
		}
		// 예외처리여부를 체크하지 않는 예외가 발생하는 경우
		Employee emp4 = manager.getEmployee4(300);
		System.out.println(emp4.getNo() + " " + emp4.getName());
	}
	
	static class EmployeeManager {
		private List<Employee> employeeList = new ArrayList<>();
		
		public EmployeeManager() {
			employeeList.add(new Employee(101, "hong", "홍길동", "영업팀"));
			employeeList.add(new Employee(102, "kim", "김유신", "영업팀"));
			employeeList.add(new Employee(103, "kang", "강감찬", "기술팀"));
			employeeList.add(new Employee(104, "lee", "이순신", "기술팀"));
			employeeList.add(new Employee(105, "ryu", "류관순", "기술팀"));
			employeeList.add(new Employee(106, "ahn", "안중근", "영업팀"));
			employeeList.add(new Employee(107, "han", "한용운", "영업팀"));
			employeeList.add(new Employee(108, "yoon", "윤봉길", "영업팀"));
		}
		
		/**
		 * 직원번호를 전달받아서 직원정보를 반환한다.
		 * @param empNo 직원번호
		 * @return 직원정보, 직원번호에 해당하는 사원이 존재하지 않으면 null이 반환된다.
		 */
		public Employee getEmployee1(int empNo) {
			Employee foundEmployee = null;
			for (Employee employee : employeeList) {
				if (employee.getNo() == empNo) {
					foundEmployee = employee;
					break;
				}
			}
			return foundEmployee;
		}
		
		/**
		 * 직원번호를 전달받아서 직원정보를 반환한다.
		 * @param empNo 직원번호
		 * @return 직원정보, 직원번호에 해당하는 사원이 존재하지 않으면 null이 반환된다.
		 */
		public Employee getEmployee2(int empNo) {
			for (Employee employee : employeeList) {
				if (employee.getNo() == empNo) {
					return employee;
				}
			}
			return null;
		}
		
		/**
		 * 직원번호를 전달받아서 직원정보를 반환한다.
		 * @param empNo 직원번호
		 * @return 직원정보
		 * @throws Exception 직원번호에 해당하는 직원이 존재하지 않으면 예외가 발생된다.
		 */
		public Employee getEmployee3(int empNo) throws Exception {
			for (Employee employee : employeeList) {
				if (employee.getNo() == empNo) {
					return employee;
				}
			}
			// for문안에 구현된 if문의 조건식이 true로 판정되는 경우가 한번도 없으면 직원번호에 해당하는 직원정보가 없는 경우고, 직원정보가 반환되지 않는다.
			// 직원번호에 해당하는 직원정보가 존재하지 않을 때만 아래 수행문이 실행되고, 예외객체가 강제 발생된다.
			throw new Exception();			// 컴파일러가 예외처리여부를 체크하는 예외가 강제발생함. 
											// throws 키워드를 사용해서 강제발생시킨 예외를 이 메소드를 호출한 측에게 전달한다.
		}
		
		/**
		 * 직원번호를 전달받아서 직원정보를 반환한다.
		 * @param empNo 직원번호
		 * @return 직원정보, 직원번호에 해당하는 사원이 존재하지 않으면 RunTimeException이 발생한다.
		 */
		public Employee getEmployee4(int empNo) {
			for (Employee employee : employeeList) {
				if (employee.getNo() == empNo) {
					return employee;
				}
			}
			throw new RuntimeException();	// 컴파일러가 예외처리여부를 체크하지 않는 예외가 강제발생함
											// throws 키워드를 사용해서 강제발생시킨 예외를 이 메소드를 호출할 측에 전달해도 되고, 하지 않아도 된다.
		}
		
	}
	
	static class Employee {
		private int no;
		private String id;
		private String name;
		private String dept;
		
		public Employee(int no, String id, String name, String dept) {
			this.no = no;
			this.id = id;
			this.name = name;
			this.dept = dept;
		}

		public int getNo() {
			return no;
		}

		public String getId() {
			return id;
		}

		public String getName() {
			return name;
		}

		public String getDept() {
			return dept;
		}
		
	}
}
