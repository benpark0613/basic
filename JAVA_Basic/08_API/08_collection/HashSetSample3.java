package example_10_06_01_collection;

import java.util.HashSet;
import java.util.Objects;

public class HashSetSample3 {

	public static void main(String[] args) {
		// Employee객체를 여러개 저장하는 HashSet객체 생성하기
		HashSet<Employee> employees = new HashSet<>();
		employees.add(new Employee(100, "김유신", "홍보팀"));
		employees.add(new Employee(101, "강감찬", "경리팀"));
		employees.add(new Employee(102, "이순신", "관리팀"));
		employees.add(new Employee(103, "류관순", "총무팀"));
		employees.add(new Employee(104, "안중근", "홍보팀"));
		employees.add(new Employee(105, "안창호", "영업팀"));
		
		System.out.println("### HashSet객체에 저장된 객체의 정보르 빠르게 살펴보기");
		System.out.println(employees);
		
		
		System.out.println("HashSet객체에 저장된 Employee객체의 객수는? " + employees.size());
	}
	
	// 정적 내부 클래스
	static class Employee {
		private int id;
		private String name;
		private String dept;
		
		public Employee(int id, String name, String dept) {
			this.id = id;
			this.name = name;
			this.dept = dept;
		}
		public int getId() {
			return id;
		}
		public String getName() {
			return name;
		}
		public String getDept() {
			return dept;
		}
		@Override
		public int hashCode() {
			return Objects.hash(id);
		}
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Employee other = (Employee) obj;
			return id == other.id;
		}
		@Override
		public String toString() {
			return "Employee [id=" + id + ", name=" + name + ", dept=" + dept + "]";
		}
		
	}
}
