package example_10_08_exception;

import java.io.FileWriter;
import java.io.IOException;

public class ExceptionSample3 {

	// 예외처리를 위임하기
	// 1. new FileWriter(), write(), flush(), close() 메소드가 IOEception의 처리를 writeText()에게 위임함
	// 2. writeText() 메소드는 IOException의 처리를 main()에게 위암함
	// 3. main() 메소드는 IOEception의 처리를 JVM에게 위윔함
	// * JVM에게 예외처리를 위임하는 것은 예외처리를 하지 않은 것과 동일하다. (프로그램 종료)
	public static void main(String[] args) throws IOException {
	
		FileUtils.writeText("c:/temp/java/abc.txt", "예외 떠넘기기 연습.");
	}
	
	static class FileUtils {
		
		// writeText() 메소드를 호출하는 측에서는 IOException 예외를 처리해야 한다. 
		public static void writeText(String path, String text) throws IOException {
			
			FileWriter writer = new FileWriter(path);
			writer.write(text);
			writer.flush();
			writer.close();
			
		}
	}
}
