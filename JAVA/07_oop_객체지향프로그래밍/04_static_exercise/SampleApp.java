package example_09_10_coding;

public class SampleApp {

	public static void main(String[] args) {
		// 10명의 성적정보를 저장하는 배열객체 생성하기
		Score[] scores = new Score[10];
		// 배열객체에 성적정보를 저장하기
		scores[0] = new Score(101, "홍길동", 100, 70, 80);
		scores[1] = new Score(102, "김유신", 30, 50, 90);
		scores[2] = new Score(103, "강감찬", 40, 30, 100);
		scores[3] = new Score(104, "이순신", 50, 10, 90);
		scores[4] = new Score(105, "류관순", 60, 30, 80);
		scores[5] = new Score(106, "윤봉길", 70, 50, 70);
		scores[6] = new Score(107, "안창호", 80, 70, 60);
		scores[7] = new Score(108, "안중근", 90, 90, 35);
		scores[8] = new Score(109, "이봉창", 100, 10, 40);
		scores[9] = new Score(110, "김좌진", 80, 20, 30);
		
		Sample sample = new Sample();
		
		// 학생성적정보 객체를 전달받아서 화면에 출력하기
		System.out.println("### 학생성적정보 객체를 전달받아서 화면에 출력하는 기능");
		sample.printScore(scores[0]);
		sample.printScore(scores[5]);
		sample.printScore(scores[scores.length - 1]);
		
		// 모든 배열을 전달해서 모든 학생성적정보 출력하기
		System.out.println("### 모든 학생성적정보 출력하기");
		sample.printAllScore(scores);
		
		// 점수 가장 높은 학생의 성적정보 출력하기
		System.out.println("### 1등한 학생의 성적정보 출력하기");
		sample.printTop1(scores);
		
		// 전체 학생의 평균점수 출력하기
		System.out.println("### 전체 학생의 평균점수 출력하기");
		sample.printAverage(scores);
		
		// 전체 평균점수보다 낮은 점수를 받은 학생성적정보 출력하기
		System.out.println("### 전체 평균점수보다 낮은 점수를 받은 학생정보 출력하기");
		sample.printLowerScore(scores);
		
		// 60점 미만 학생 불합격
		System.out.println("### 불합격자 출력하기");
		sample.printUnPassedScores(scores);
		
		// 60점 미만 학생 불합격, 40점 미만 과락
		System.out.println("### 불합격자 출력하기2");
		sample.printUnPassedScores2(scores);
		
	}
}
