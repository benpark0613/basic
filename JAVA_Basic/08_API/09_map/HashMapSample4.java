package example_10_07_1_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import example_10_07_1_map.HashMapSample5.Book;

public class HashMapSample4 {

	public static void main(String[] args) {
		
		List<Book> books = new ArrayList<>();
		
		books.add(new Book("소설", "남한산성"));
		books.add(new Book("소설", "칼의노래"));
		books.add(new Book("컴퓨터", "이것이자바다"));
		books.add(new Book("외국어", "토익보카"));
		books.add(new Book("소설", "레터의연가"));
		books.add(new Book("컴퓨터", "자바의정석"));
		books.add(new Book("외국어", "토익기출문제"));
		books.add(new Book("컴퓨터", "빅데이터실무"));
		books.add(new Book("컴퓨터", "머신러닝가이드"));
		books.add(new Book("기술", "고속도로건설공학"));
		books.add(new Book("수험서", "2022정보처리필기"));
		books.add(new Book("대학교재", "공업수학"));
		books.add(new Book("대학교재", "전자기학"));
		books.add(new Book("인문", "동양철학의이해"));
		books.add(new Book("인문", "한국근현대문학"));
		
		// Key는 장르명, Value는 장르명 도서갯수로 하는 Map객체를 생성한다.
		Map<String, Integer> genreSummary = new HashMap<>();
		
		for (Book book : books) {
			// 장르명을 조회
			String genre = book.getGenre();			
			// 조회된 장르명이 Map객체에 포함되어 있는지 체크
			if (genreSummary.containsKey(genre)) {
				// Map객체에 장르명이 존재하는 경우
				// 해당 장르명으로 저장된 도서 갯수를 조회
				int count = genreSummary.get(genre);
				// Map객체에 해당 장르명과 1 증가된 도서갯수를 다시 저장
				genreSummary.put(genre, count+1);
			} else {
				// Map객체에 장르명이 존재하지 않는 경우
				// 해당 장르를 key, 1을 value로 Map에 저장
				genreSummary.put(genre, 1);
			}
		}
		System.out.println(genreSummary);
	} 
	
	static class Book {
		private String genre;
		private String title;
		
		public Book(String genre, String title) {
			this.genre = genre;
			this.title = title;
		}

		public String getGenre() {
			return genre;
		}

		public void setGenre(String genre) {
			this.genre = genre;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}
		
	}
	
}
