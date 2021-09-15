package example_09_15_override;

public class Phone {

	
	private String tel;
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public void call(String to) {
		System.out.println("[" + tel + "]이 " + to + "에게 전화를 겁니다.");		
	}
	
	public void off() {
		System.out.println("전원버튼을 눌러서 화면을 끕니다.");
	}
	
	public void on() {
		System.out.println("전원버튼을 눌러서 화면을 켭니다.");
	}
}
