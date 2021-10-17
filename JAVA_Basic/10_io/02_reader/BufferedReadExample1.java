package example_10_14_reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class BufferedReadExample1 {

	public static void main(String[] args) {
		
		/*
		 * BufferdReader
		 * 	- 텍스트를 읽어오는 객체다.
		 * 	- 텍스트를 한 줄 씩 읽어오는 String readLine() 메소드를 제공한다.
		 * 	- readLine()은 줄바꿈문자 앞까지 읽어서 반환한다.
		 * 	- readLine()은 더이상 읽어올 데이터가 없으면(스트림의 끝에 도달하면) null을 반환한다.
		 */
		try {
			// 파일의 내용을 읽어오는 FileReader 객체를 생성한다.
			// FileReader의 읽기 메소드는 1글자씩만 읽어온다.
			FileReader fileReader = new FileReader("c:/temp/doc/example2.txt");
			// 스트림의 텍스트데이터를 한 줄씩 읽어오는 BufferedReader 객체를 생성한다.
			// 파일의 텍스트 데이터를 읽어오는 FileReader를 BufferedReader에게 전달한다.
			BufferedReader reader = new BufferedReader(fileReader);
			
			String text = null;
			// text = reader.readLine()				: 스트림에서 한 줄씩 읽어서 text에 대입한다.
			// (text = reader.readLine()) != null	: text에 대입된 값이 null이 아니면 true다. 즉, while문 블록 내의 수행문이 실행된다.
			while ((text = reader.readLine()) != null) {
				
				// 텍스트 분석
				String[] values = text.split(",");
				String name = values[0];
				int kor = Integer.parseInt(values[1].trim());
				int eng = Integer.parseInt(values[2].trim());
				int math = Integer.parseInt(values[3].trim());
				int total = kor + eng + math;
				int average = total/3;

				System.out.println("학생이름: " + name + ", 평균점수: " + average);
			}
			
			reader.close();
			
//			String text1 = reader.readLine();
//			String text2 = reader.readLine();
//			String text3 = reader.readLine();
//			String text4 = reader.readLine();
//			String text5 = reader.readLine();
//			String text6 = reader.readLine();
//			String text7 = reader.readLine();
//			String text8 = reader.readLine();
//			String text9 = reader.readLine();
//			String text10 = reader.readLine();
//			
//			System.out.println(text1);
//			System.out.println(text2);
//			System.out.println(text3);
//			System.out.println(text4);
//			System.out.println(text5);
//			System.out.println(text6);
//			System.out.println(text7);
//			System.out.println(text8);
//			System.out.println(text9);
//			System.out.println(text10);
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
