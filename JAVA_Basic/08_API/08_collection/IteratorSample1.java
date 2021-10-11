package example_10_06_01_collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class IteratorSample1 {
	
	public static void main(String[] args) {
		
		List<String> names = new ArrayList<>();
		names.add("홍길동");
		names.add("이순신");
		names.add("홍길동");
		names.add("김유신");
		names.add("홍길동");
		names.add("강감찬");
		
		System.out.println("### Iterator를 이용한 반복처리");
		// ArrayList가 구현한 Iterator구현객체를 획득한다.
		Iterator<String> iter = names.iterator();
		// while문을 사용해서 반복처리를 수행한다.
		// hasNext()는 반복처리할 데이터가 남아있으면 true를 반환한다.
		while (iter.hasNext()) {
			// next()는 남아있는 데이터 중에서 하나를 반환한다.
			String name = iter.next();
			System.out.println(name);
		}
		
		System.out.println("### Enhanced for문을 이용해서 반복처리");
		for (String name : names) {
			System.out.println(name);
		}
		
//		java.util.ConcurrentModificationException 오류 발생
//		향상된 for문을 사용해서 Collection<E>의 구현객체에 저장된 값을 반복처리 중에 저장된 값을 삭제할 수 없다. 
//		for (String name : names) {
//			if (name.equals("홍길동")) {
//				names.remove(name);
//			}
//				
//		}

		System.out.println(names);
	}

}
