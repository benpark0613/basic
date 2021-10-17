package example_10_14_writer;

import java.io.FileWriter;
import java.io.IOException;

public class FileWriterExample1 {

	public static void main(String[] args) {
	
		/*
		 * FileWriter
		 * 	파일에 텍스트를 기록(출력한다.)
		 */
		try {
			// example1.txt 파일에 텍스트를 기록하는 FileWriter객체를 생성함
			// example1.txt 파일이 존재하지 않으면 example1.txt 파일을 생성한 다음 텍스트를 기록한다.
			// example1.txt 파일이 존재하면 새로 example1.txt 파일을 생성하지 않고, 기존 데이터에 덮어쓴다.
			FileWriter writer = new FileWriter("c:/temp/doc/example1.txt");
			
			writer.write("트와이스 조아조아\n");
			writer.write("트와이스 조아조아\n");
			writer.write("트와이스 조아조아\n");
			writer.write("트와이스 조아조아\n");
			writer.write("트와이스 조아조아" + System.lineSeparator());
			writer.write("트와이스 조아조아" + System.lineSeparator());
			writer.write("트와이스 조아조아" + System.lineSeparator());
			writer.write("트와이스 조아조아" + System.lineSeparator());
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
