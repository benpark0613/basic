package example_09_17_polymorphism;

/**
 * 학생, 교수, 교직원에 대한 등록, 조회, 통계 정보를 제공하는 클래스다.
 * @author 박성근
 *
 */
public class PersonService {

	/**
	 * 학생, 교수, 교직원 정보가 저장되는 배열이다.
	 */
	private Person[] database = new Person[100];
	
	/**
	 * database가 참조하는 배열에서 새로운 정보가 저장되는 위치정보를 가지고 있는 변수다.
	 */
	private int position = 0;
	/**
	 * PersonService의 기본 생성자 메소드다.<br/>
	 * 테스트를 위해서 위의 database참조변수가 참조하는 배열에 테스트용 정보를 저장한다.
	 */
	public PersonService() {
	      database[position++] = new Student("학생", "홍길동", "010-1111-2222", 3, "전자공학과");
	      database[position++] = new Student("학생", "김유신", "010-2222-3333", 2, "컴퓨터공학과");
	      database[position++] = new Student("학생", "강감찬", "010-3333-4444", 1, "전자공학과");
	      database[position++] = new Student("학생", "이순신", "010-4444-5555", 4, "기계공학과");
	      database[position++] = new Student("학생", "류관순", "010-5555-6666", 3, "기계공학과");
	      database[position++] = new Student("학생", "안중근", "010-6666-7777", 2, "전자공학과");
	      database[position++] = new Professor("교수", "김교수", "010-7777-8888", "전자공학", "부교수", "빅데이터 분석 알고리즘");
	      database[position++] = new Professor("교수", "이교수", "010-8888-9999", "기계공학", "정교수", "극지방 탐험 로보트");
	      database[position++] = new Professor("교수", "박교수", "010-9999-0000", "전자공학", "조교수", "인공지능 로보트");
	      database[position++] = new Professor("교수", "최교수", "010-0000-1111", "컴퓨터공학", "부교수", "자동 데이터분석 머신");
	      database[position++] = new Employee("직원", "안창호", "010-1111-3333", "교육팀", "과장", 4_500_000);
	      database[position++] = new Employee("직원", "이봉창", "010-3333-5555", "인사팀", "대리", 3_500_000);
	      database[position++] = new Employee("직원", "윤봉길", "010-5555-7777", "인사팀", "과장", 4_500_000);
	      database[position++] = new Employee("직원", "김좌진", "010-7777-8888", "교육팀", "대리", 3_500_000);
	   }
	
	/**
	 * 지정된 사람을 데이터베이스에 저장한다.
	 * @param person 학생, 교수 혹은 교직원 정보
	 */
	public void addNewPerson(Person person) {	// 매개변수의 다형성이 적용되었다. Person 타입의 매개변수는 Student/Professor/Employee 객체를 전달받을 수 있다.
		database[position] = person;
		position++;
	}
	
	/**
	 * 모든 사람정보를 화면에 출력한다.
	 */
	public void printAllPerson() {
		for (Person person : database) {
			if (person == null) {
				break;
			}
			// person 참조변수는 Student/Professor/Employee 객체의 상위객체인 Person객체를 참조하고 있다.
			// person 참조변수로 print()를 실행하면, person참조변수가 참조하는 Person객체의 print가 실행되는 것이 아니라
			// Student/Professor/Employee객체에 재정의된 print() 메소드가 실행된다.
			person.print();
			System.out.println();
		}
	}
	
	/**
	 * 지정된 번호로 사람을 찾아서 반환한다.
	 * @param no 일련번호
	 * @return 사람정보, null일 수 있음
	 */
	public Person searchPerson(int no) {		// 반환타입의 다형성이 적용되었다. Person 타입의 반환타입은 Student/Professor/Employee 객체를 모두 반환할 수 있다.
		Person foundPerson = null;
		
		for (Person person : database) {
			if (person != null && person.getNo() == no) { // 두개의 순서가 바뀌면 안된다.
				foundPerson = person;
				break;
			}
		}
		
		return foundPerson;
	}
	
	/**
	 * 지정된 이름으로 사람을 찾아서 반환한다.
	 * @param name 검색할 이름
	 * @return 사람정보, null일 수 있음
	 */
	public Person searchPerson(String name) {	// 메소드 중복정의
		for (Person person : database) {
			if (person != null && person.getName().equals(name)) {
				return person;
			} 
		}
		return null;
	}
}
























