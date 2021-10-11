package example_10_07_2_comparable;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ListSample3 {

	public static void main(String[] args) {
		List<Score> scoreList = Arrays.asList(new Score("김유신", 80, 80, 80),
				new Score("강감찬", 100, 90, 100),
				new Score("이순신", 70, 40, 90),
				new Score("류관순", 90, 80, 40),
				new Score("안중근", 40, 50, 40));
		
		// 총점을 비교해서 내림차순으로 정렬시키는 Comparator 구현객체
		System.out.println("### 총점에 대한 내림차순으로 정렬해서 출력하기");
		Comparator<Score> totalComparator = new Comparator<>() {
			public int compare(Score score1, Score score2) {
				return score2.getTotal() - score1.getTotal();
			}
		};
		Collections.sort(scoreList, totalComparator);
		for (Score score : scoreList) {
			System.out.println(score.getName() + " : " + score.getTotal());
		}
		
		// 학생이름을 비교해서 이름의 오름차순으로 정렬시키는 Comparator 구현객체
		System.out.println("### 이름에 대한 오름차순으로 정렬해서 출력하기");
		Comparator<Score> nameComparator = new Comparator<>() {
			public int compare(Score score1, Score score2) {
				return score1.getName().compareTo(score2.getName());
			}
		};
		Collections.sort(scoreList, nameComparator);
		for (Score score : scoreList) {
			System.out.println(score.getName() + " : " + score.getTotal());
		}
		
		// 국어점수를 비교해서 국어점수를 오름차순으로 정렬시키기
		System.out.println("### 국어점수에 대한 오름차순으로 정렬해서 출력하기");
		Collections.sort(scoreList, new Comparator<Score>() {
			@Override
			public int compare(Score o1, Score o2) {
				return o1.getKor() - o2.getKor();
			}
		});
		for (Score score : scoreList) {
			System.out.println(score.getName() + " : " + score.getKor());
		}
		
		// 영어점수를 비교해서 영어점수로 오름차순으로 정렬시키기
		System.out.println("### 영어점수에 대한 오름차순으로 정렬해서 출력하기");
		Collections.sort(scoreList, (s1, s2) -> s1.getEng() - s2.getEng());
		for (Score score : scoreList) {
			System.out.println(score.getName() + " : " + score.getEng());
		}
	}
	
	static class Score {
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
		
	}
}
