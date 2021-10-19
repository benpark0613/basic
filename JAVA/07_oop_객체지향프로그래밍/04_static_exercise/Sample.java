package example_09_10_coding;

public class Sample {

	// 학생성적정보 객체를 전달받아서 화면에 출력하는 기능
	void printScore(Score score) {
		System.out.println("번호: " + score.no);
		System.out.println("이름: " + score.name);
		System.out.println("국어: " + score.kor);
		System.out.println("영어: " + score.eng);
		System.out.println("수학: " + score.math);
		System.out.println("총점: " + score.total);
		System.out.println("평균: " + score.average);
		System.out.println();
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 화면에 출력하는 기능
	void printAllScore(Score[] scores) {
		for (Score score : scores) {
			printScore(score);
		}
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 최고 성적을 받은 성적정보를 출력하는 기능
	void printTop1(Score[] scores) {
		Score topScore = scores[0];
		for (Score score : scores) {
			if (score.total > topScore.total) {
				topScore = score;
			}
		}
		printScore(topScore);
	}
	// 학생성적정보가 포함된 배열을 전달받아서 평균점수를 출력하는 기능
	void printAverage(Score[] scores) {
		int average = getAllScoresAverage(scores);		
		System.out.println("전체 학생의 평균점수: " + average);
		System.out.println();
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 평균점수보다 낮은 점수를 받은 성적정보를 출력하는 기능
	// 평균을 구하는 메소드가 많네? > Extract Method
	void printLowerScore(Score[] scores) {
		int average = getAllScoresAverage(scores);		

		for (Score score : scores) {
			if(score.average < average) {
				printScore(score);
			}
		}
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 불합격한 학생들의 성적정보를 출력하는 기능(평균 60점 미만 불합격)
	void printUnPassedScores(Score[] scores) {
		for (Score score : scores) {
			if (score.average < 60) {
				printScore(score);
			}
		}
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 불합격한 학생들의 성적정보를 출력하는 기능(평균 60점 미만, 과목과락(과목점수가 40점 미만)은 불합격)
	void printUnPassedScores2(Score[] scores) {
		for (Score score : scores) {
			if (score.average < 60 || isFailedSubject(score)) {
				printScore(score);
			}
		}
	}
	
	// 과목 낙제 여부를 반환한다.
	boolean isFailedSubject(Score score) {
		boolean isFailed = false;
		if(score.kor < 40 || score.eng < 40 || score.math < 40) {
			isFailed = true;
		}
		return isFailed;
	}
	
	// 학생성적정보가 포함된 배열을 전달받아서 평균점수와 가장 가까운 점수를 가진 학생의 성적정보를 출력하는 기능
	void printClosestAverageScrore(Score[] scores) {
		
	}
	// 학생성적정보가 포함된 배열을 전달받아서 평균점수별 학생수를 출력하는 기능(10점 이하 0명, 20점 이하 0명, 30점 이하 1명, 40점 이하 2명, ... )
	void printCountByAverage(Score[] scores) {

	}

	// 전체 학생에 대한 평균점수를 반환하는 기능
	private int getAllScoresAverage(Score[] scores) {
		int total = 0;
		for (Score score : scores) {
			total += score.average;		
		}
		int average = total/scores.length;
		return average;
	}
	
}

