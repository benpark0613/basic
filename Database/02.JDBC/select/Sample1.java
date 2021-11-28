package example_10_20.jdbc.select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import utils.ConnectionUtil;

public class Sample1 {

	public static void main(String[] args) throws SQLException {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("### 책 검색 프로그램");
		System.out.println("### 검색할 키워드를 입력하세요");
		System.out.print("### 키워드: ");
		
		String keyword = scanner.next();
		
		// 1. SQL 작성하기
		String sql = "select book_no, book_title, book_writer, book_publisher, book_price, book_discount_price, "
				+ "			 book_stock, book_on_sale "
				+ "from tb_sample_books "
				+ "where book_title like '%' || ? || '%' "	// 오라클에서 글자를 이어붙일 때 || 
				+ "order by book_no desc ";
		
		// 2. Connection 객체 획득하기
		Connection connection = ConnectionUtil.getConnection();
		
		// 3. PreparedStatment 객체 획득하기
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		// 4. ?에 값 바인딩하기
		pstmt.setString(1, keyword);
		
		// 5. SQL을 RDBMS로 전송해서 실행시키고, 조회결과가 포함된 ResultSet객체를 획득한다.
		ResultSet rs = pstmt.executeQuery();
		
		// 6. ResultSet의 API를 사용해서 조회결과를 추출해서 화면에 출력한다.
		while (rs.next()) {
			int no = rs.getInt("book_no");
			String title = rs.getString("book_title");
			String writer = rs.getString("book_writer");
			String publisher = rs.getString("book_publisher");
			int price = rs.getInt("book_price");
			int discountPrice = rs.getInt("book_discount_price");
			int stock = rs.getInt("book_stock");
			String onSale = rs.getString("book_on_sale");
			
			System.out.printf("%d %s %s %s %d %d %d %s\n", no, title, writer, publisher, price, discountPrice, stock, onSale);
		}
		
		// 7. 사용했던 자원을 해제한다.
		rs.close();
		pstmt.close();
		connection.close();
	}
}
