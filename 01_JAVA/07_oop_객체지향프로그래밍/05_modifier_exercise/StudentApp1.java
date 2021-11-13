package example_09_13_coding;

public class StudentApp1 {

	public static void main(String[] args) {
		
		Student student1 = new Student();	// 시험을 본 학생
		Student student2 = new Student();	// 시험을 본 학생
		Student student3 = new Student();	// 시험을 안 본 학생
		
		student1.setNo(10);
		student1.setGrade(2);
		student1.setName("이방원");
		ScoreDetail scoreDetail1 = new ScoreDetail();
		scoreDetail1.setKor(80);
		scoreDetail1.setEng(70);
		scoreDetail1.setMath(85);
		student1.setScore(scoreDetail1);
		
		student2.setNo(12);
		student2.setGrade(2);
		student2.setName("퉁두란");
		ScoreDetail scoreDetail2 = new ScoreDetail();
		scoreDetail2.setKor(60);
		scoreDetail2.setEng(55);
		scoreDetail2.setMath(40);
		student2.setScore(scoreDetail2);
		
		student3.setNo(1);
		student3.setGrade(1);
		student3.setName("이방석");

		// 이방원의 번호, 학년, 이름, 국어, 영어, 수학, 총점, 평균 출력하기
		System.out.println("### 이방원의 정보 및 시험정보");
		System.out.println("번호: " + student1.getNo());
		System.out.println("학년: " + student1.getGrade());
		System.out.println("이름: " + student1.getName());
		
		System.out.println(student1.getScore());
		System.out.println("국어: " + student1.getScore().getKor());
		System.out.println("영어: " + student1.getScore().getEng());
		System.out.println("수학: " + student1.getScore().getMath());
		System.out.println("총점: " + student1.getScore().getTotal());
		System.out.println("평균: " + student1.getScore().getAverage());
		System.out.println();
		
		// 퉁두란의 번호, 학년, 이름, 국어, 영어, 수학, 총점, 평균 출력하기
		System.out.println("### 퉁두란의 정보 및 시험정보");
		System.out.println("번호: " + student2.getNo());
		System.out.println("학년: " + student2.getGrade());
		System.out.println("이름: " + student2.getName());
		
		System.out.println(student2.getScore());
		System.out.println("국어: " + student2.getScore().getKor());
		System.out.println("영어: " + student2.getScore().getEng());
		System.out.println("수학: " + student2.getScore().getMath());
		System.out.println("총점: " + student2.getScore().getTotal());
		System.out.println("평균: " + student2.getScore().getAverage());
		System.out.println();

		// 이방석의 번호, 학년, 이름, 국어, 영어, 수학, 총점, 평균 출력하기
		System.out.println("### 이방석의 정보 및 시험정보");
		System.out.println("번호: " + student3.getNo());
		System.out.println("학년: " + student3.getGrade());
		System.out.println("이름: " + student3.getName());
		
		System.out.println(student3.getScore());
		System.out.println("국어: " + student3.getScore().getKor());
		System.out.println("영어: " + student3.getScore().getEng());
		System.out.println("수학: " + student3.getScore().getMath());
		System.out.println("총점: " + student3.getScore().getTotal());
		System.out.println("평균: " + student3.getScore().getAverage());
		System.out.println();
	}
}
