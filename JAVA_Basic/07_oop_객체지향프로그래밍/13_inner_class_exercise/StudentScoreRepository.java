package example_09_27_inner_class_example;

public class StudentScoreRepository {

	private StudentScore[] database;
	
	public StudentScoreRepository() {
		database = new StudentScore[] {
			new StudentScore("홍길동", 100, 80, 70),
			new StudentScore("김유신", 80, 90, 60),
			new StudentScore("강감찬", 80, 40, 40),
			new StudentScore("이순신", 50, 80, 60),
			new StudentScore("류관순", 70, 60, 90),
			new StudentScore("안중근", 90, 70, 70),
			new StudentScore("윤봉길", 30, 60, 50),
			new StudentScore("이봉창", 60, 40, 30),
			new StudentScore("민영환", 90, 60, 50),
			new StudentScore("김좌진", 60, 90, 70),
			new StudentScore("김구", 40, 30, 90),
			new StudentScore("이준", 90, 70, 70),
			new StudentScore("한용운", 60, 50, 50),
			new StudentScore("이성계", 70, 40, 30),
			new StudentScore("이방원", 40, 90, 40),
			new StudentScore("류성룡", 70, 90, 50),
			new StudentScore("김만중", 100, 90, 80)
		};
	}
	
	/**
	 * 새 성적 추가기능
	 * @param score 성적정보
	 */
	public void addNewStudentScore(StudentScore score) {
		
	}
	
	/**
	 * 지정된 이름으로 성적정보를 찾아서 반환하는 기능
	 * @param name 학생이름
	 * @return 성적정보
	 */
	public StudentScore getStudentScore(String name) {
		return null;
	}
	
	/**
	 * 합격점 이상의 평균점수를 얻은 학생들의 성적정보를 반환하는 기능
	 * @return 성적정보들
	 */
	public StudentScore[] getPassedStudentScores() {
		return null;
	}
	
	/**
	 * 합격점 미만의 평균점수를 얻은 학생들의 성적정보를 반환하는 기능
	 * @return 성적정보들
	 */
	public StudentScore[] getUnPassedStudenScores() {
		return null;
	}
	
	/**
	 * 성적통계정보를 제공하는 객체를 반환하는 기능
	 * @return 성적통계정보를 제공하는 객체
	 */
	public ScoreStats getStats() {
		return new ScoreStats();
	}
	
	// 학생성적정보에 대한 통계 정보를 제공하는 멤버내부클래스 구현하기
	/**
	 * 학생성적에 대한 통계정보를 제공하는 클래스다.
	 * @author 이응수
	 *
	 */
	class ScoreStats {
		/**
		 * 전 과목에 대한 평균점수를 반환한다.
		 * @return 전 과목 평균점수
		 */
		public int average() {
			int allTotal = 0;
			for (StudentScore score : database) {
				allTotal += score.getTotal();
			}
			return allTotal/(database.length*3);
		}
		/**
		 * 국어과목에 대한 평균점수를 반환한다.
		 * @return 국어과목 평균점수
		 */
		public int korAverage() {
			int korTotal = 0;
			for (StudentScore score : database) {
				korTotal += score.getKor();
			}
			return korTotal/database.length;
		}
		/**
		 * 영어과목에 대한 평균점수를 반환한다.
		 * @return 영어과목 평균점수
		 */
		public int engAverage() {
			int engTotal = 0;
			for (StudentScore score : database) {
				engTotal += score.getEng();
			}
			return engTotal/database.length;
		}
		/**
		 * 수학과목에 대한 평균점수를 반환한다.
		 * @return 수학과목 평균점수
		 */
		public int mathAverage() {
			int mathTotal  = 0;
			for (StudentScore score : database) {
				mathTotal += score.getMath();
			}
			return mathTotal/database.length;
		}		
	}
}













