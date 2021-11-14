package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.sample.utils.ConnectionUtils.getConnection;

import com.sample.vo.Department;
import com.sample.vo.Employee;
import com.sample.vo.Job;

public class EmployeeDao {

	/**
	 * 지정된 사용자정보를 저장한다.
	 * @param employee 새 사용자정보
	 * @throws SQLException 데이터베이스 엑세스 작업중 오류 발생했을 때 
	 */
	public void insertEmployee(Employee employee) throws SQLException {
		String sql = "insert into employees "
				   + "(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) "
				   + "values "
				   + "(employees_seq.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?) ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, employee.getFirstName());
		pstmt.setString(2, employee.getLastName());
		pstmt.setString(3, employee.getEmail());
		pstmt.setString(4, employee.getPhoneNumber());
		pstmt.setString(5, employee.getJob().getId());
		pstmt.setDouble(6, employee.getSalary());
		pstmt.setDouble(7, employee.getCommissionPct());
		pstmt.setInt(8, employee.getManager().getId());
		pstmt.setInt(9, employee.getDepartment().getId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
		
	}
	
	/**
	 * 모든 관리자들을 반환한다.
	 * @return 관리자 목록
	 * @throws SQLException 데이터베이스 엑세스 작업중 오류 발생했을 때
	 */
	public List<Employee> getAllManagers() throws SQLException {
		String sql = "select E.employee_id, E.first_name, E.last_name, D.department_id, D.department_name "
				   + "from employees E, departments D "
				   + "where E.department_id = D.department_id "
				   + "and E.employee_id in (select distinct manager_id "
				   + "                      from employees) "
				   + "order by D.department_id asc ";
		
		List<Employee> managers = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Employee employee = new Employee();
			Department department = new Department();
			
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			
			department.setId(rs.getInt("department_id"));
			department.setName(rs.getString("department_name"));
			employee.setDepartment(department);
			
			managers.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return managers;
	}
	
	/**
	 * 전체 사원수를 반환한다.
	 * @return 사원수
	 * @throws SQLException 데이터베이스 엑세스 작업중 오류 발생했을 때
	 */
	public int getEmployeesCount() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from employees ";
		
		int employeesCount = 0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		employeesCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employeesCount;
	}
	
	/**
	 * 모든 사원정보를 반환한다.
	 * @return 사원정보 목록
	 * @throws SQLException 데이터베이스 엑세스 작업중 오류 발생했을 때
	 */
	public List<Employee> getEmployees(int begin, int end) throws SQLException {
		String sql = "SELECT rn, employee_id, first_name, last_name, phone_number, email, job_id, department_id, department_name "
				   + "FROM  (select row_number() over (order by e.employee_id desc) rn, "
			       + "       E.employee_id, E.first_name, E.last_name, E.phone_number, E.email, "
			       + "       E.job_id, D.department_id, D.department_name "
			       + "       from employees E, departments D "
			       + "       where E.department_id = D.department_id(+)) "
			       + "where rn >= ? and rn <= ? ";

		List<Employee> employees = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Employee employee = new Employee();
			Department department = new Department();
			Job job = new Job();
			
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setEmail(rs.getString("email"));
			
			job.setId(rs.getString("job_id"));
			
			department.setId(rs.getInt("department_id"));
			department.setName(rs.getString("department_name"));
			
			employee.setJob(job);
			employee.setDepartment(department);
			
			employees.add(employee);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}

	/**
	 * 지정된 부서아이디에 소속된 사원정보를 반환한다.
	 * @param departmentId 부서아이디
	 * @return 해당 부서에 소속된 사원정보 목록
	 * @throws SQLException 데이터베이스 엑세스작업중 오류가 발생했을 때
	 */
	public List<Employee> getEmployeesByDepartmentId(int departmentId) throws SQLException {
		String sql = "select employee_id, first_name, last_name, email, phone_number, hire_date "
				   + "from employees "
				   + "where department_id = ? "
				   + "order by first_name asc ";
		
		List<Employee> employees = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, departmentId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Employee employee = new Employee();
			employee.setId(rs.getInt("employee_id"));
			employee.setFirstName(rs.getString("first_name"));
			employee.setLastName(rs.getString("last_name"));
			employee.setEmail(rs.getString("email"));
			employee.setPhoneNumber(rs.getString("phone_number"));
			employee.setHireDate(rs.getDate("hire_date"));
			
			employees.add(employee);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return employees;
	}
}
