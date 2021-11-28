package example_10_14_reader;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

public class BufferedReadExample2 {

	public static void main(String[] args) throws Exception {
		
		// 리소스
		String path = "https://raw.githubusercontent.com/choosunsick/Korea_Stocks/master/Korea_Stocks_since_2021/000020.csv";
		URL url = new URL(path);
		
		// url주소가 가르키는 리소스를 1byte씩 읽어오는 스트림객체를 획득함
		//InputStream inputStream = url.openStream();
		// 바이트스트림과 연결되는 Reader객체 생성하기
		//InputStreamReader isr = new InputStreamReader(inputStream);
		// 한 라인씩 읽어오는 BufferedReader와 InputStreamReader객체 연결
		//BufferedReader reader = new BufferedReader(isr);
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		
		// 첫번째줄 읽어서 버림
		reader.readLine();
		
		int totalAmount = 0;
		String text = null;
		while ((text = reader.readLine()) != null) {
			// System.out.println(text);
			String[] values = text.split(",");
			int amount = Integer.parseInt(values[5]);
			totalAmount += amount;
		}
		System.out.println("기간내 총 거래금액: " + totalAmount + "만(원)");
		
		reader.close();
		
		
//		String value1 = reader.readLine();
//		String value2 = reader.readLine();
//		String value3 = reader.readLine();
//		String value4 = reader.readLine();
//		String value5 = reader.readLine();
//		
//		System.out.println(value1);
//		System.out.println(value2);
//		System.out.println(value3);
//		System.out.println(value4);
//		System.out.println(value5);
		
		reader.close();
		
		
	}
}
