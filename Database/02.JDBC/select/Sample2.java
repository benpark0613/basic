package example_10_20.jdbc.select;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.ConnectionUtil;

public class Sample2 {

	public static void main(String[] args) throws SQLException {
		
		// SQL
		String sql = "select * "
					+ "from employees "
					+ "order by employee_id asc ";
		// Connection 획득
		Connection connection = ConnectionUtil.getConnection();
		// PreparedStatement 획득
		PreparedStatement pstmt = connection.prepareStatement(sql);
// ?에 값 바인딩
		// SQL 전송 및 ResultSet 획득
		ResultSet rs = pstmt.executeQuery();
		
		// ResultSet 처리
		while (rs.next()) {
			int employeeId 			= rs.getInt("employee_id");			// NUMBER(6,0)
			String firstName 		= rs.getString("first_name");		// VARCHAR2(20)
			String lastName			= rs.getString("last_name");		// VARCHAR2(25)
			String email 			= rs.getString("email");			// VARCHAR2(20)
			String phoneNumber 		= rs.getString("phone_number");		// VARCHAR2(20)
			String jobId 			= rs.getString("job_id");			// VARCHAR2(10)
			Date hireDate 			= rs.getDate("hire_date");			// DATE
			double salary 			= rs.getDouble("salary");			// NUMBER(8, 2)
			double commissionPct 	= rs.getDouble("commission_pct");	// NUMBER(2, 2)
			int managerId 			= rs.getInt("manager_id");			// NUMBER(6, 0)
			int departmentId 		= rs.getInt("department_id");		// NUMBER(4, 0)
			
			System.out.printf("%d\t%10s\t%12s\t%12s\t%s\t%10s\t%s\t%.0f\t%.2f\t%d\t%d\n", employeeId, firstName, lastName, email, phoneNumber, jobId, hireDate, salary, commissionPct, managerId, departmentId);
		}
		// 자원 해제
		rs.close();
		pstmt.close();
		connection.close();
	}
}
