package example_09_13_coding;

public class Student {

	private int no;				// 정수
	private int grade;			// 정수
	private String name;		// 문자열
	private ScoreDetail score;	// ScoreDetail객체의 주소값 > 포함관계
	
	public Student() {}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public ScoreDetail getScore() {
		return score;
	}
	
	public void setScore(ScoreDetail score) {
		this.score = score;
	}
	
}
