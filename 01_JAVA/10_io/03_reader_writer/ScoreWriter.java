package example_10_14_reader_writer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class ScoreWriter {

	public static void main(String[] args) {
		List<Score> scoreList = new ArrayList<>();
		scoreList.add(new Score("홍길동", 100, 90, 80));
		scoreList.add(new Score("김유신", 100, 90, 80));
		scoreList.add(new Score("강감찬", 100, 90, 80));
		scoreList.add(new Score("박술희", 100, 90, 80));
		scoreList.add(new Score("신숭겸", 100, 90, 80));
		
		// List 객체에 저장된 학생성적 정보를 score.sav 파일로 저장하기
		try (PrintWriter writer = new PrintWriter("c:/temp/doc/score.sav");) {
			
			StringBuilder sb = new StringBuilder();
			for (Score score : scoreList) {
				sb.append(score.getName() + ",");
				sb.append(score.getKor() + ",");
				sb.append(score.getEng() + ",");
				sb.append(score.getMath());
				
				writer.println(sb.toString());
				sb.setLength(0);	// StringBuilder 길이를 0으로 만든다 > 기록한 것을 지운다.
			}
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
