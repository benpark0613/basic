package example_10_07_1_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HashMapSample5 {

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
		
		// 도서를 장르별로 구분해서 관리하는 Map객체 생성하기
		Map<String, List<Book>> bookMap = new HashMap<>();
		
		for (Book book : books) {
			String genre = book.getGenre();
			if (bookMap.containsKey(genre)) {
				List<Book> list = bookMap.get(genre);
				list.add(book);
			} else {
				List<Book> list = new ArrayList<>();
				list.add(book);
				
				bookMap.put(genre, list);
			}
		}
		
		System.out.println("### 집계 결과 간단히 출력해보기");
		System.out.println(bookMap);
		
		// 컴퓨터 서적만 출력하기
		List<Book> computerBooks = bookMap.get("컴퓨터");
		for (Book book : computerBooks) {
			System.out.println(book.getGenre() + " : " + book.getTitle());
		}
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
		
		public String toString() {
			return "[" + genre + ", " + title + "]";
		}
	}
	
	
}
