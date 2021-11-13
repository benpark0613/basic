package example_10_05_3_generic_wildcard;

public class CourseApp {

	public static void main(String[] args) {
		Course<Student> c1 = new Course<>("전기전자 기초실험");
		Course<PostGraduatedStudent> c2 = new Course<>("석사논문 작성법");
		Course<Worker> c3 = new Course<>("직장인을 위한 엑셀기초");
		Course<Person> c4 = new Course<>("나도 유투버가 될 수 있다");
		
		Academy academy = new Academy();
		
		// 모든과정등록(Course<?> course) - <?> 제한없음
		// Course<T>에서 T의 타입을 제한하지 않음 
		academy.모든과정등록(c1);
		academy.모든과정등록(c2);
		academy.모든과정등록(c3);
		academy.모든과정등록(c4);
		
		// 전공과정등록(Course<? extends Student> course) -  <? extends Student> 상한 제한
		// Course<T>에서 T의 타입이 Student와 Student의 하위타입만 허용 
		academy.전공과정등록(c1);
		academy.전공과정등록(c2);
		//academy.전공과정등록(c3);
		//academy.전공과정등록(c4);
		
		// 대학원과정등록(Course<? extends PostGraduatedStudent> course) - <? extends PostGraduatedStudent> 상한 제한
		// Course<T>에서 T의 타입이 PostGraduatedStudent와 PostGraduatedStudent의 하위타입만 허용
		//academy.대학원과정등록(c1);
		academy.대학원과정등록(c2);
		//academy.대학원과정등록(c3);
		//academy.대학원과정등록(c4);
		
		// 직장인및일반인과정등록(Course<? super Worker> course) - <? super Worker> 하한 제한
		// Course<T>에서 T의 타입이 Worker와 Work의 상위타입만 허용 
		//academy.직장인및일반인과정등록(c1);
		//academy.직장인및일반인과정등록(c2);
		academy.직장인및일반인과정등록(c3);
		academy.직장인및일반인과정등록(c4);
	}
}
