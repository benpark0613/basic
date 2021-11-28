package example_09_13_coding;

public class StudentApp2 {

	public static void main(String[] args) {
		
		Student[] students = new Student[3]; 
		
		
//		Student student1 = new Student(10, 1, "강감찬", new ScoreDetail(100, 90, 80));
//		Student student2 = new Student(20, 3, "류관순", new ScoreDetail(80, 70, 85));
//		Student student3 = new Student(30, 2, "이순신", new ScoreDetail(70, 70, 60));
//		students[0] = student1;
//		students[1] = student2;
//		students[2] = student3;
		
		// 배열의 각 칸에 학생정보를 저장함(학생정보는 시험성적정보를 포함하고 있음)_ 정보 = 객체라 생각하자
		students[0] = new Student(10, 1, "강감찬", new ScoreDetail(100, 90, 80));
		students[1] = new Student(20, 3, "류관순", null);
		students[2] = new Student(30, 2, "이순신", new ScoreDetail(70, 70, 60));
		
//		System.out.println("배열의 0번째에 저장된 Student 객체: " + students[0]);
//		System.out.println("배열의 1번째에 저장된 Student 객체: " + students[1]);
//		System.out.println("배열의 2번째에 저장된 Student 객체: " + students[2]);
//		System.out.println();
		
		// 향상된 for문을 사용해서 배열의 각 칸에 저장된 학생정보를 출력하기
		for (Student student : students) {
//			System.out.println("student가 순서대로 참조하는 Student 객체: " + student);
			System.out.println("번호: " + student.getNo());
			System.out.println("학년: " + student.getGrade());
			System.out.println("이름: " + student.getName());
			
//			System.out.println("국어: " + student.getScore().getKor());
//			System.out.println("영어: " + student.getScore().getEng());
//			System.out.println("수학: " + student.getScore().getMath());
//			System.out.println("총점: " + student.getScore().getTotal());
//			System.out.println("평균: " + student.getScore().getAverage());
	
			ScoreDetail score = student.getScore();
			if (score != null) {
				System.out.println("국어: " + score.getKor());
				System.out.println("영어: " + score.getEng());
				System.out.println("수학: " + score.getMath());
				System.out.println("총점: " + score.getTotal());
				System.out.println("평균: " + score.getAverage());
			} else {
				System.out.println("시험성적 정보가 존재하지 않습니다.");
			}
			System.out.println();
		}
		
	}
}

































