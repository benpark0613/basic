package example_09_02_array;

public class Sample3 {

	public static void main(String[] args) {
		// 지정된 값을 포함하고 있는 배열객체 생성하기
		/*
		 * 데이터타입[] 참조변수명 = {값, 값, 값, 값, 값, ...}
		 */
		int[] scores = {60, 70, 55, 80, 100, 50, 95};
		
		for (int score : scores) {
			System.out.println(score);
		}
		
		// 학생이름을 포함하고 있는 배열객체 생성하기
		String[] names = {"홍길동", "김둘리", "도우너", "마이콜", "박또치"};
		
		for (String name : names) {
			System.out.println(name);
		}
		
	}

}
