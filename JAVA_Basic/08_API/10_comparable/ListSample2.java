package example_10_07_2_comparable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ListSample2 {

	public static void main(String[] args) {
		List<Score> scoreList = Arrays.asList(new Score("김유신", 80, 80, 80),
				new Score("강감찬", 100, 100, 100),
				new Score("이순신", 70, 70, 70),
				new Score("류관순", 90, 90, 90),
				new Score("안중근", 85, 85, 85));
		
		// List객체에 저장된 Score객체를 오름차순으로 정렬하기(정렬기준 compareTo(Score o)에서 재정의한 총점이 기준이다.
		Collections.sort(scoreList);
		
		// 총점이 가장 낮은 학생부터 출력된다.
		for (Score score : scoreList) {
			System.out.println(score.getName() + " : " + score.getTotal());
		}
	}
	
	static class Score implements Comparable<Score> {
		private String name;
		private int kor;
		private int eng;
		private int math;
		
		public Score(String name, int kor, int eng, int math) {
			this.name = name;
			this.kor = kor;
			this.eng = eng;
			this.math = math;
		}

		public String getName() {
			return name;
		}

		public int getKor() {
			return kor;
		}

		public int getEng() {
			return eng;
		}

		public int getMath() {
			return math;
		}
		
		public int getTotal() {
			return kor + eng + math;
		}
		
		public int getAverage() {
			return getTotal()/3;
		}

		/*
		 * 이 객체의 점수와 다른 객체의 점수를 비교했을 때
		 * 	0보다 큰 값이 나오는 경우		이 객체의 점수가 높다.
		 * 	0보다 작은 값이 나오는 경우		이 객체의 점수가 낮다.
		 * 	0이 나오는 경우				점수가 같다.
		 */
		@Override
		public int compareTo(Score other) {
			return this.getTotal() - other.getTotal();
		}
		
		
	}
}
