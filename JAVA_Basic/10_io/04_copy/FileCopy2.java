package example_10_14_copy;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class FileCopy2 {

	public static void main(String[] args) throws IOException {
		
		URL url = new URL("https://img.hankyung.com/photo/202011/01.24436115.1.jpg"); 
		InputStream in = url.openStream();
		
		// 복사본파일로 1byte씩 출력하는 스트림객체 생성
		FileOutputStream out = new FileOutputStream("c:/temp/doc/악뮤.jpg");
		
		int value = 0;
		while((value = in.read()) != -1) {
			out.write(value);
		}
		
		in.close();
		out.close();
		
	}
}
