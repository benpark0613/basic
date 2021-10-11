package example_10_08_formatting;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateformatSample2 {

	public static void main(String[] args) throws ParseException {
		
		// 오늘
		Date today = new Date();
		
		// 생일
		String text1 = "1991-06-13";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(text1);
		
		long todayUnixTime = today.getTime();
		long birthdayUnixTime = birthday.getTime();
		
		long day = (todayUnixTime - birthdayUnixTime)/(60*60*24*1000);
		System.out.println("내가 살아온 날: " +day);
	}
}
