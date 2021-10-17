package example_10_14_reader_writer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ScoreReader {

	public static void main(String[] args) {
		
		// score.sav 파일에서 읽어온 성적정보를 저장하는 ArrayList객체
		List<Score> scores = new ArrayList<>();
		
		try (BufferedReader reader = new BufferedReader(new FileReader("c:/temp/doc/score.sav"));) {
		
			String text = null;
			while ((text = reader.readLine()) != null) {
				//System.out.println(text);
				
				// text > "홍길동,100,100100"
				// values > ["홍길동", "100", "100", "100"]
				String[] values = text.split(",");
				// 배열의 값 분석하기
				String name = values[0];
				int kor = Integer.parseInt(values[1]);
				int eng = Integer.parseInt(values[2]);
				int math = Integer.parseInt(values[3]);
				// Score객체를 생성해서 분석된 성적정보 저장하기
				Score score = new Score(name, kor, eng, math);
				// 성적정보가 저장된 Score객체를 ArrayList객체에 저장하기
				scores.add(score);
			}
			
			// 데이터 조작/분석하기
			// 학생들의 전체 평균점수 계산하기
			int totalAverage = 0;
			for (Score score : scores) {
				totalAverage += score.getAverage();
			}
			System.out.println("전체 평균점수: " + totalAverage/scores.size());
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
