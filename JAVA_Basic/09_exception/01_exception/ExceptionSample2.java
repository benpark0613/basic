package example_10_08_exception;

import java.io.FileWriter;
import java.io.IOException;

public class ExceptionSample2 {

	// throws는 수행문에서 발생한 예외를 직접 처리하지 않고, 이 메소드를 호출한 측에게 예외처리를 떠넘기는 키워드다.
	public static void main(String[] args) throws IOException {
		
		FileWriter writer = new FileWriter("test.txt");
		writer.write("중앙HTA 2106기 화이팅!!");
		writer.flush();
		writer.close();
		System.out.println("### 정상 실행 : 파일이 기록되었습니다.");
		
	}
}
