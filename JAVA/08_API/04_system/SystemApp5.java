package example_10_01_system;

import java.util.Arrays;

public class SystemApp5 {

	public static void main(String[] args) {
		
		// 배열 복사하기
		
		// 원본 배열
		int[] src = {10, 20, 30, 40, 50};
		// 원본 배열을 복사할 배열
		int[] dest = new int[10];
		
		/*
		 * System.arraycopy(Object[] src, int srcPos, Object[] dest, int destPos, int length);
		 * 		src: 원본배열
		 * 		srcPos: 원본배열에서 복사 시작위치
		 * 		dest: 대상배열
		 * 		destPos: 대상배열에 원본배열이 저장될 위치
		 * 		length: 대상배열에 저장할 원본배열의 데이터 길이
		 */
		
		System.out.println("복사 전 대상배열: " + Arrays.toString(dest));

		// 원본배열(src)의 0번부터 대상배열(dest)의 0번째 칸에 복사한다. 복사할 총 데이터 갯수는 원본배열의 모든 데이터다.
		System.arraycopy(src, 0, dest, 0, src.length);
		System.out.println("복사 후 대상배열: " + Arrays.toString(dest));
		
	}
}
