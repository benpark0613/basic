package example_09_09_constructor;

public class StudentScore {

	/*
	 * 학생시험점수 객체용 클래스
	 * 		1. 멤버변수
	 * 			학번
	 * 			이름
	 * 			국어점수
	 * 			영어점수
	 * 			수학점수
	 * 			총점
	 * 			평균
	 * 		2. 생성자 메소드
	 * 			기본 생성자메소드
	 * 			학번, 이름을 초기화하는 생성자 메소드
	 * 			학번, 이름, 국어점수, 영어점수, 수학점수를 전달받아서 총점과 평균까지 초기화하는 생성자 메소드
	 * 		3. 멤버메소드
	 * 			학생의 시험점수 출력하는 메소드
	 * 			학생의 학번, 이름, 국어, 영어, 수학, 총점, 평균을 출력하는 메소드 
	 */
	
	int no;
	String name;
	int kor;
	int eng;
	int math;
	int total;
	double average;
	
	public StudentScore() {
		
	}
	
//	public StudentScore(int no, String name) {		// generate constructor to invoke 
//		this.no = no;
//		this.name = name;
//	}
//	
//	public StudentScore(int no, String name, int kor, int eng, int math) {
//		this.no = no;
//		this.name = name;
//		this.kor = kor;
//		this.eng = eng;
//		this.math = math;
//		total = kor + eng + math;
//		average = total/3.0;
//	}
	
	public StudentScore(int no, String name) {
		this.no = no;
		this.name = name;
	}
	
	public StudentScore(int no, String name, int kor, int eng, int math) {
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		total = kor + eng + math;
		average = this.total/3.0;	
	}
	
	void printStudentInfo() {
		System.out.println("학번: " + no);
		System.out.println("이름: " + name);
		System.out.println("국어: " + kor);
		System.out.println("영어: " + eng);
		System.out.println("수학: " + math);
		System.out.println("총점: " + total);
		System.out.println("평균: " + average);
		System.out.println();
	}


}

	

