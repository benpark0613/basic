package example_09_09_constructor;

public class StudentScoreApp {

	public static void main(String[] args) {
		
		StudentScore score1 = new StudentScore(100, "김길수", 90, 80, 100);
		StudentScore score2 = new StudentScore(200, "김현태", 70, 80, 50);
		StudentScore score3 = new StudentScore(300, "박건희", 50, 80, 70);
		StudentScore score4 = new StudentScore(400, "박희수", 30, 90, 80);
		StudentScore score5 = new StudentScore(500, "강수현", 80, 100, 90);

		score1.printStudentInfo();
		score2.printStudentInfo();
		score3.printStudentInfo();
		score4.printStudentInfo();
		score5.printStudentInfo();
	}
	
}
