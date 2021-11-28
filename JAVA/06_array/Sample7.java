package example_09_02_array;

public class Sample7 {

	public static void main(String[] args) {
		// 다차원 배열
		// 타입 [] 변수명 = new 타입[크기];				1차원 배열
		// 타입 [][] 변수명 = new 타입[크기][크기];			2차원 배열
		// 타입 [][][] 변수명 = new 타입[크기][크기][크기];	3차원 배열
		
		// 연락처 정보(이름, 전화번호, 이메일)를 저장하는 2차원 배열 생성하기
		String[][] contacts = new String[2][3];
		
		// 2차원배열의 각 요소에 연락처 정보 저장하기
		contacts[0][0] = "홍길동";
		contacts[0][1] = "010-1234-1234";
		contacts[0][2] = "a@gmail.com";
		contacts[1][0] = "강감찬";
		contacts[1][1] = "010-3525-1212";
		contacts[1][2] = "b@gamil.com";
		
		// 내포된 for문을 사용해서 다차원 배열 다루기
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < 3; j++) {
				String value = contacts[i][j];
				System.out.println(value + "\t");
			}
			System.out.println();
		}
		
		// 내포된 향상된 for문을 사용해서 다차원 배열의 값을 출력하기
		for (String[] contact : contacts) {
			for (String value : contact) {
				System.out.println(value + "\t");
			}
			System.out.println();
		}
		
	}

}
