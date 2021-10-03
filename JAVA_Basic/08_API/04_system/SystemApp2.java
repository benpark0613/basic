package example_10_01_system;

import java.util.Date;

public class SystemApp2 {

	public static void main(String[] args) {
	
		// 시스템의 유닉스타임을 조회하기
		long unixTime = System.currentTimeMillis();
		System.out.println("유닉스 타임: " + unixTime);
		
		// 시스템의 현재 날짜와 시간정보를 제공하는 객체를 생성하기
		Date now = new Date();
		System.out.println(now);
		
		Date day = new Date(0);
		System.out.println(day);
		
		// 날짜와 시간정보를 제공하는 객체 java.util.Date
		
		// 날짜정보를 제공하는 객체 java.sql.Date
		// 시간정보를 제공하는 객체 java.sql.Timestamp
		
		// 날짜정보를 제공하는 객체 java.time.LocalDate
		// 시간정보를 제공하는 객체 java.time.LocalTime
		// 날짜와 시간정보를 제공하는 객체 java.time.LocalDateTime
	}
}
