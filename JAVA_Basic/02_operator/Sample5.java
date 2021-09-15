package example_08_31_operator;

public class Sample5 {

	public static void main(String[] args) {
		// 증감연산자
		// ++ --
		// 변수의 값을 1증가시키거나 1감소시킨다.
		int num = 5;
		
		num++;	// num += 1; 과 동일하다.
		System.out.println("num의 값: " + num);
		++num;
		System.out.println("num의 값: " + num);

		num--;	// num -= 1; 과 동일하다.
		System.out.println("num의 값: " + num);
		--num;
		System.out.println("num의 값: " + num);
		
		// 증감연산자의 위치에 따른 값의 차이
		int x = 10;
		int y = 10;
		
		int value1 = ++x;	// x의 값을 1증가시키고 x의 값을 value1에 대입한다.
		int value2 = y++;	// y의 값을 value2에 대입하고 y의 값을 1증가시킨다.
		
		System.out.println("x의 값: " + x);
		System.out.println("y의 값: " + y);
		System.out.println("value1의 값: " + value1);
		System.out.println("value2의 값: " + value2);

		// 증감연산자와 다른 연산자를 조합해서 수행문을 작성하지 않는다.
		++x;
		int value3 = x;
		y++;
		int value4 = y;
		
		System.out.println("x의 값: " + x);
		System.out.println("x의 값: " + y);
		System.out.println("value3의 값: " + value3);
		System.out.println("value4의 값: " + value4);
	}

}
