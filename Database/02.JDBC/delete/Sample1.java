package example_10_20.jdbc.delete;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.ConnectionUtil;

public class Sample1 {

	public static void main(String[] args) throws SQLException {
		
		// 1. SQL 쿼리 작성하기
		// 쿼리문 마지막엔 한칸 띄우지 않으면 붙은걸로 인식해서 오류가 난다.
		String sql = "delete from tb_sample_books "
				+ "where book_no = ? ";
		
		// 2. Connection 획득하기
		Connection connection = ConnectionUtil.getConnection();
		
		// 3. PreparedStatement 획득하기
		PreparedStatement pstmt = connection.prepareStatement(sql);
		
		// 4. ?에 값 바인딩하기
		pstmt.setInt(1, 20001);
		
		// 5. SQL 전송 및 실행결과 받기
		int rowCount = pstmt.executeUpdate();
		System.out.println(rowCount + "개의 행이 삭제되었습니다.");
		
		// 6. 자원해제
		pstmt.close();
		connection.close();
		
	}
}
