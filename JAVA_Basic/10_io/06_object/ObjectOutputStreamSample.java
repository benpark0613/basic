package example_10_15_object;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.Date;

public class ObjectOutputStreamSample {

	public static void main(String[] args) {
		/*
		 * ObjectOutputStream
		 * 	- 객체를 직렬화시키고 출력하는 스트림이다.
		 * 	- 직렬화는 객체를 스트림으로 출력가능한 상태로 변환하는 것을 말한다.
		 * 	- 직렬화는 생성된 객체의 클래스명, 멤버변수의 이름과 타입, 멤벼변수에 저장된 값을 스트림으로 출력하는 것이다.
		 */
		
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("c:/temp/doc/object.sav"));) {
			
			User user = new User();
			user.setId("hong");
			user.setPassword("zxcv1234");
			user.setName("홍길동");
			user.setPoint(35000);
			user.setCreateDate(new Date());
			user.setMyCar(new Car("제네시스 GV80", "현대자동차", 80000000L));	// 모든 멤버변수가 직렬화 가능해야 한다.
			
			// 생성된 User객체를 직렬화해서 스트림으로 출력하기
			oos.writeObject(user);
			
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
