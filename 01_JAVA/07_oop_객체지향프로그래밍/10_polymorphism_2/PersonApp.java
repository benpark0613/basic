package example_09_17_polymorphism;

import java.util.Scanner;

public class PersonApp {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		PersonService personService = new PersonService();
		
		while (true) {
			System.out.println("----------------------------------------------");
			System.out.println("1.조회  2.등록  3.검색  0.종료");
			System.out.println("----------------------------------------------");
			
			System.out.print("메뉴 번호 입력: ");
			int menuNo = scan.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[조회]");
				personService.printAllPerson();
				
			} else if (menuNo == 2) {
				System.out.println("[신규 등록]");
				System.out.println("### 신규 등록할 학생, 교수 혹은 직원정보를 입력하세요.");
				
				System.out.print("이름 입력: ");
				String name = scan.next();
				
				System.out.print("전화번호 입력: ");
				String tel = scan.next();
				
				System.out.print("등록타입 선택(학생, 교수, 직원 중 택일): ");
				String type = scan.next();
				if ("교수".equals(type)) {
					System.out.print("담당학과 입력: ");
					String dept = scan.next();
					
					System.out.print("직위 입력: ");
					String position = scan.next();
					
					System.out.print("연구과제 입력: ");
					String researchProject = scan.next();
					
					Professor professor = new Professor(type, name, tel, dept, position, researchProject);
					personService.addNewPerson(professor);
					
				} else if ("학생".equals(type)) {
					System.out.print("학년 입력: ");
					int grade = scan.nextInt();
							
					System.out.print("소속학과 입력: ");
					String dept = scan.next();
					
					new Student();
					
					Student student = new Student(type, name, tel, grade, dept);
					personService.addNewPerson(student);
					
				} else if ("직원".equals(type)) {
					System.out.print("소속부서 입력: ");
					String dept = scan.next();
					
					System.out.print("업무 입력: ");
					String job = scan.next();
					
					System.out.print("급여 입력: ");
					int salary = scan.nextInt();
					
					new Employee();
					
					Employee employee = new Employee(type, name, tel, dept, job, salary);
					personService.addNewPerson(employee);
					
				}
			
				
			} else if (menuNo == 3) {
				System.out.println("[검색]");
				
				System.out.print("검색방식 입력(번호, 이름 중 택일)");
				String opt = scan.next();
				
				if ("번호".equals(opt)) {
					System.out.print("번호 입력: ");
					int no = scan.nextInt();
					// 반환타입이 참조자료형인 메소드의 반환값은 null일 수도 있다.
					Person person = personService.searchPerson(no);
					if(person != null) {
						person.print();
					} else {
						System.out.println("### 입력한 번호와 일치하는 정보가 없습니다.");
					}
					
				} else if ("이름".equals(opt)) {
					System.out.print("이름 입력: ");
					String name = scan.next();
					// 반환타입이 참조자료형인 메소드의 반환값은 null일 수도 있다.
					Person person = personService.searchPerson(name);
					if(person != null) {
						person.print();
					} else {
						System.out.println("### 입력한 이름과 일치하는 정보가 없습니다.");
					}
				}
				
			} else if (menuNo == 0) {
				System.out.println("[프로그램 종료]");
				break;
			}
		}
		
		scan.close();
	}
}

























