package example_09_06_class;

public class ScoreApp1 {

	public static void main(String[] args) {
		// Score 클래스를 이용해서 성적정보를 관리하기
		// 여러 명(3명)의 성적정보를 관리하는 애플리케이션 구현
		Score score1 = new Score();
		score1.name = "이말년";
		score1.kor = 50;
		score1.eng = 80;
		score1.math = 70;
		score1.total = score1.kor + score1.eng + score1.math;
		score1.average = score1.total/3;
		
		Score score2 = new Score();
		score2.name = "주호민";
		score2.kor = 80;
		score2.eng = 70;
		score2.math = 30;
		score2.total = score2.kor + score2.eng + score2.math;
		score2.average = score2.total/3;
		
		Score score3 = new Score();
		score3.name = "김풍";
		score3.kor = 90;
		score3.eng = 60;
		score3.math = 100;
		score3.total = score3.kor + score3.eng + score3.math;
		score3.average = score3.total/3;
		
		// Score a;						Score 클래스로 생성한 Score객체의 주소값을 저장하는 참조변수 a를 생성함
		//								Score 타입의 참조변수 a를 생성함
		// new Score();					Score 클래스로 객체를 생성하고, 생성된 객체가 위치하고 있는 메모리의 주소값을 반환함
		// Score a = new Score();		Score 클래스로 객체를 생성하고, 생성된 객체가 위취하고 있는 메모리의 주소값을 Score 타입의 참조변수 a에 대입함
		//								참조변수 a는 주소값에 해당하는 곳에 위치하고 있는 Score객체를 참조하기 시작함.
		// Score b = a;					참조변수 a에 저장된 주소값을 Score 타입의 변수 b에 대입함
		//								참조변수 b도 참조변수 a가 참조하는 객체를 참조하게 됨
		// a.name = "홍길동";				참조변수 a가 참조하는 객체 안에 위치한 멤버변수 name에 문자열 "홍길동"을 대입함.
		// a.kor = 100					참조변수 a가 참조하는 객체 안에 위치한 멤버변수 kor에 정수 100을 대입함
		// int c = a.kor				참조변수 a가 참조하는 객체 안에 위치한 멤버변수 kor에 저장된 값을 int 타입 변수 c에 대입함
		// System.out.println(a.name);	참조변수 a가 참조하는 객체 안에 위치한 멤버변수 name에 저장된 값을 화면에 출력함
	
		// 이번 시험에 참가한 학생의 이름을 출력하기
		System.out.println("시험에 참가한 학생들의 이름");
		System.out.println(score1.name);
		System.out.println(score2.name);
		System.out.println(score3.name);
		
		System.out.println("시험에 참가한 학생들의 평균점수");
		System.out.println(score1.average);
		System.out.println(score2.average);
		System.out.println(score3.average);
		
		System.out.println("시험에 참가한 학생들의 과목별 성적");
		System.out.println(score1.kor + ", " + score1.eng + ", " + score1.math);
		System.out.println(score2.kor + ", " + score2.eng + ", " + score2.math);
		System.out.println(score3.kor + ", " + score3.eng + ", " + score3.math);
		
		
	}
	
}
