package example_09_15_override;

public class PhoneApp {

	public static void main(String[] args) {
		
		// 전원버튼을 이용해서 화면을 켜고 싶다면, Phone 객체를 사용하자.
		System.out.println("### Phone객체 사용하기");
		Phone phone = new Phone();
		phone.setTel("010-1111-1111");
		phone.on();
		phone.call("010-2222-2222");
		phone.off();
		
		// 페이스 아이디를 이용해서 화면을 켜고 싶다면, Iphone 객체를 사용하자.
		System.out.println("### Iphone객체 사용하기");
		Iphone iphone = new Iphone();
		iphone.setTel("010-1111-1111");
		iphone.on();
		iphone.call("010-2222-2222");
		iphone.off();
		
		// 폴더를 접거나 펼쳐서 화면을 켜고 끄고 싶다면, Galaxy 객체를 사용하자.
		System.out.println("### Galaxy객체 사용하기");
		Galaxy galaxy = new Galaxy();
		galaxy.setTel("010-3333-3333");
		galaxy.on();
		galaxy.call("010-4444-4444");
		galaxy.off();
	}
}
