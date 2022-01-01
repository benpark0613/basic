package com.sample.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sample.vo.Job;

public class JobDaoImpl implements JobDao {

	/*
	 * JdbcTemplate은 INSERT, UPDATE, DELETE, SELECT 쿼리실행 기능을 제공하는 클래스다.
	 * 스프링 컨테이너의 빈으로 등록하고, 데이터베이스 엑세스 작업을 담당하는 xxxDaoImpl를 의존성 주입을 사용해서 제공받는다.
	 * 		+ JdbcTemplate 타입의 멤버변수 선언
	 * 		+ JdbcTemplate 객체를 전달받는 setter 메소드 정의
	 */
	private JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	@Override
	public void insertJob(Job job) {
		String sql = "insert into jobs "
				+ "(job_id, job_title, min_salary, max_salary) "
				+ "values "
				+ "(?, ?, ?, ?)";
		
		template.update(sql,
				job.getId(),
				job.getTitle(),
				job.getMinSalary(),
				job.getMaxSalary());
	}

	@Override
	public void updateJob(Job job) {
		String sql = "update jobs "
				+ "set "
				+ "		min_salary = ?, "
				+ "		max_salary = ? "
				+ "where job_id = ?";
		
		template.update(sql, 
				job.getMinSalary(),
				job.getMaxSalary(),
				job.getId());
	}

	@Override
	public List<Job> getAllJobs() {
		String sql = "select * from jobs";
		return template.query(sql, new RowMapper<Job>() {
			@Override
			public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
				Job job = new Job();
				
				job.setId(rs.getString("job_id"));
				job.setTitle(rs.getString("job_title"));
				job.setMinSalary(rs.getDouble("min_salary"));
				job.setMaxSalary(rs.getDouble("max_salary"));
				
				return job;
			}
		});
	}

	@Override
	public Job getJobById(String jobId) {
		String sql = "select * from jobs where job_id = ?";
		return template.queryForObject(sql, (rs, rowNum) -> {
			Job job = new Job();
			
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getDouble("min_salary"));
			job.setMaxSalary(rs.getDouble("max_salary"));
			
			return job;
		}, jobId);
	}

	@Override
	public List<Job> getJobsBySalary(int minSalary, int maxSalary) {
		String sql = "select * from jobs where min_salary >= ? and max_salary >= ?";
		return template.query(sql, (rs, rowNum) -> {
			Job job = new Job();
			
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getDouble("min_salary"));
			job.setMaxSalary(rs.getDouble("max_salary"));
			
			return job;
		}, minSalary, maxSalary);
	}


	
}
