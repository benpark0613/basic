package example_09_14_extends;

public class PersonApp {

	public static void main(String[] args) {
		// Person객체를 생성하면 최상위 객체인 Object객체와 Person객체가 생성된다.
		Person person = new Person();
		// Student객체를 생성하면 최상위 객체인 Object객체, 상위객체인 Person객체와 Student객체가 생성된다.
		Student student = new Student();
		// Employee객체를 생성하면 최상위 객체인 Object객체, 상위객체인 Person객체와 Employee객체가 생성된다.
		Employee employee = new Employee();
	
		// person으로 참조되는 Person객체는 name, tel, email과 getter/setter 메소드를 가지고 있다.
		person.setName("홍길동");
		person.setTel("010-1111-1111");
		person.setEmail("hong@gmail.com");
		
		// student로 참조되는 Student객체는 dept, grade와 getter/setter 메소드를 가지고 있다.
		// student로 참조되는 Student객체는 상위 클래스인 Person객체의 공개된 변수 혹은 기능을 사용할 수 있다.
		student.setName("김유신");			// Person객체의 공개된(상속받은) 기능
		student.setTel("010-2222-2222");	// Person객체의 공개된(상속받은) 기능
		student.setEmail("kim@gmail.com");	// Person객체의 공개된(상속받은) 기능
		student.setDept("전기전자공학과");		// Student객체의 기능
		student.setGrade(3);				// Student객체의 기능
		
		// employee로 참조되는 Employee객체는 company, position, salary와 getter/setter 메소드를 가지고 있다.
		// employee로 참조되는 Employee객체는 상위 클래스인 Person객체의 공개된 변수 혹은 기능을 사용할 수 있다.
		employee.setName("강감찬");			// Person객체의 공개된(상속받은) 기능
		employee.setTel("010-3333-3333");	// Person객체의 공개된(상속받은) 기능
		employee.setEmail("kang@gmail.com");// Person객체의 공개된(상속받은) 기능
		employee.setCompany("삼성전자");		// Employee객체의 기능
		employee.setPosition("부장");			// Employee객체의 기능
		employee.setSalary(10_000_000);		// Employee객체의 기능
	}
}
