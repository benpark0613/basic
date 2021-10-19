package example_10_08_exception;

import java.io.File;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExceptionSample4 {

	public static void method1() throws IOException {
		File file = new File("c:/temp/java/sample.txt");
		file.createNewFile();					// java.io.IOException 예외 발생
	}
	
	public static void method2() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date date = sdf.parse("2000-01-01");	// java.text.ParseException 예외 발생
		System.out.println(date);
	}
	
	public static void method3() throws IOException, ParseException, ClassNotFoundException {
		Class.forName("java.util.ArrayList");	// java.lang.ClassNotFoundException 예외 발생
		ExceptionSample4.method1();
		ExceptionSample4.method2();
	}
	
	public static void method4() throws SQLException {
		DriverManager.getConnection("jdbc:oracle:thin@localhost:1521:xe");
	}
	
	public static void main(String[] args) {
		try {
			ExceptionSample4.method3();
			ExceptionSample4.method4();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
