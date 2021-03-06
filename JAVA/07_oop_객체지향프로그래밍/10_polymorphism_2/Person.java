package example_09_17_polymorphism;

import java.util.concurrent.atomic.AtomicInteger;

public class Person {

	private static AtomicInteger atomicInteger = new AtomicInteger(1000);
	private int no;
	private String type;
	private String name;
	private String tel;
	
	public Person() {}
	public Person(String type, String name, String tel) {
		this.no = atomicInteger.getAndIncrement();
		this.type = type;
		this.name = name;
		this.tel = tel;
	}
	
	public int getNo() {
		return no;
	}
	public String getType() {
		return type;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public void print() {
		System.out.println("일련번호: " + no);
		System.out.println("구분: " + type);
		System.out.println("이름: " + name);
		System.out.println("전화번호: " + tel);
	}
}
