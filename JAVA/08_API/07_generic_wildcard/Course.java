package example_10_05_3_generic_wildcard;

public class Course<T> {

	private String name;
	private T[] requests;
	
	public Course(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
}
