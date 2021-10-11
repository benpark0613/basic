package example_10_06_01_collection;

import java.util.TreeSet;

public class TreeSetSample1 {

	public static void main(String[] args) {
		
		TreeSet<String> names = new TreeSet<>();
		
		// TreeSet<E>는 지정되는 객체를 오름차순으로 정렬해서 저장한다.
		names.add("이순신");
		names.add("김유신");
		names.add("안중근");
		names.add("류관순");
		names.add("안창호");
		names.add("김구");
		names.add("최제우");
		names.add("한용운");
		names.add("이봉창");
		
		for (String name : names) {
			System.out.print(name + "\t");
		}
		System.out.println();
		
	}
}
