package example_10_08_formatting;

import java.text.MessageFormat;

public class MessageFormatSample1 {

	public static void main(String[] args) {
		
		// String MessageFormat.format(String pattern, Object ... arguments)는 아래와 같이 사용해도 된다.
		// String MessageFormat.format(String pattern, Object[] arguments)
		
		Score score = new Score("홍길동", 100, 90, 80);
		
		String pattern = "{0} 학생의 성적은 국어:{1}점, 영어:{2}점, 수학:{3}점, 평균점수:{4}점 입니다.";
		String text = MessageFormat.format(pattern, score.getName(), score.getKor(), score.getEng(), score.getMath(), score.getAverage());
		System.out.println(text);
		
		Object[] names = {"이순신", "김유신", "강감찬"};
		MessageFormat mf = new MessageFormat("참석자 명단 : {0}부장님, {1}차장님, {2}차장님");
		String text2 = mf.format(names);
		System.out.println(text2);
		
		String text3 = MessageFormat.format("참석자 명단 : {0}부장님, {1}차장님, {2}차장님", names);
		System.out.println(text3);
		
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
