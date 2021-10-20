package example_10_20.jdbc.insert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.ConnectionUtil;

public class Sample2 {

	public static void main(String[] args) throws SQLException {
		
		// 1. SQL 정의하기
		String sql = "insert into tb_sample_books "
				+ "(book_no, book_title, book_writer, book_publisher, book_price, book_discount_Price) "
				//  NUMBER(5) VARCHAR2    VARCHAR2     VARCHAR2        NUMBER(7)   NUMBER(7) 
				+ "values "
				+ "(?, ?, ?, ?, ?, ?) ";
		
		// 2. RDMBS와 연결을 담당하는 Connection 객체 획득하기
		Connection connection = ConnectionUtil.getConnection();

		// 3. SQL과 Parameter를 데이터베이스 전송/실행시키는 PreparedStatement객체 획득하기
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		// 4. ?에 파라미터값 바인딩하기
		pstmt.setInt(1, 20001);
		pstmt.setString(2, "수도원 기행");
		pstmt.setString(3, "공지영");
		pstmt.setString(4, "창비");
		pstmt.setInt(5, 16000);
		pstmt.setInt(6, 14000);
		
		// 5. SQL 전송 및 실행결과 받기
		int rowCount = pstmt.executeUpdate();
		System.out.println(rowCount + "개의 행이 추가되었습니다.");
		
		// 6. 사용했던 자원 해제시키기
		pstmt.close();
		connection.close();
		
	}
}
