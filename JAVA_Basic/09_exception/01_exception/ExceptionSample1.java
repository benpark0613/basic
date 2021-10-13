package example_10_08_exception;

import java.io.FileWriter;
import java.io.IOException;

public class ExceptionSample1 {

	public static void main(String[] args) {
		
		try {
			FileWriter writer = new FileWriter("c:/temp/java/test.txt");
			writer.write("중앙HTA 2106기 화이팅!!");
			writer.flush();
			writer.close();
			System.out.println("### 정상 실행 : 파일이 기록되었습니다.");
		} catch (IOException ex) {
			System.out.println("### 오류 발생 : 파일 생성 중 오류가 발생하였습니다.");
			// 오류 발생시 오류 수정을 위한 디버깅 정보를 화면에 출력한다.
			ex.printStackTrace();
		}
		
	}
}
