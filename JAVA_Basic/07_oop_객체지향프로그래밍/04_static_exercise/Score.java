package example_09_10_coding;

public class Score {

	int no;
	String name;
	int kor;
	int eng;
	int math;
	int total;
	int average;
	
	public Score(int no, String name, int kor, int eng, int math) {
		super();
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.total = kor + eng + math;
		this.average = this.total/3;
	}
	
}
