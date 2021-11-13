package example_10_20.jdbc.update;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.ConnectionUtil;

public class Sample1 {

	public static void main(String[] args) throws SQLException {
	
		// 1. SQL 작성하기
		String sql = "update tb_sample_books " 
				+ "set "
				+ "		book_stock = ?, "
				+ "		book_on_sale = ? "
				+ "where "
				+ "		book_publisher = ? ";
		
		// 2. Connection 획득하기
		Connection connection = ConnectionUtil.getConnection();
		
		// 3. PreparedStatement 획득하기
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		// 4. ?에 값 바인딩하기
		pstmt.setInt(1, 0);
		pstmt.setString(2, "재고없음");
		pstmt.setString(3, "한빛미디어");
		
		// 5. SQL 전송 및 실행결과 받기
		int rowCount = pstmt.executeUpdate();
		System.out.println(rowCount + "개의 행이 수정되었습니다.");
		
		// 6. 자원해제
		pstmt.close();
		connection.close();
		
	}
}
