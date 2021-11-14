package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.vo.Board;

import static com.sample.utils.ConnectionUtils.getConnection;

public class BoardDao {

	public void addView(int no) throws SQLException {
		String sql = "update tb_web_board "
				   + "set "
				   + "	board_view_count = ? "
				   + "where board_no = ? ";
		
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(no);
		int boardViewCount = board.getViewCount();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, ++boardViewCount);
		pstmt.setInt(2, no);
		pstmt.executeQuery();
		
		pstmt.close();
		connection.close();
	}
	
	public void addLike(int no) throws SQLException {
		String sql = "update tb_web_board "
				   + "set "
				   + "	board_like_count = ? "
				   + "where board_no = ? ";
		
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(no);
		int boardLikeCount = board.getLikeCount();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, ++boardLikeCount);
		pstmt.setInt(2, no);
		pstmt.executeQuery();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteBoard(int no) throws SQLException {
		String sql = "update tb_web_board "
				   + "set "
				   + "	board_deleted = ? "
				   + "where board_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, "Y");
		pstmt.setInt(2, no);
		pstmt.executeQuery();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		String sql = "update tb_web_board "
				   + "set "
				   + "	board_title = ?, "
				   + "	board_writer = ?, "
				   + "	board_content = ? "
				   + "where board_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getNo());
		pstmt.executeQuery();
		
		pstmt.close();
		connection.close();
	}
	
	public Board getBoardByNo(int no) throws SQLException {
		String sql = "select board_no, board_title, board_writer, board_view_count, "
				   + "board_like_count, board_content, board_deleted, board_created_date "
				   + "from tb_web_board "
				   + "where board_no = ? ";
		
		Board board = null;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setViewCount(rs.getInt("board_view_count"));
			board.setLikeCount(rs.getInt("board_like_count"));
			board.setContent(rs.getString("board_content"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setCreatedDate(rs.getDate("board_created_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public int getBoardsCount() throws SQLException {
		String sql = "select count(*) cnt "
				   + "from tb_web_board ";
		
		int boardsCount = 0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		boardsCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boardsCount;
	}
	
	public List<Board> getboards(int begin, int end) throws SQLException {
		String sql = "select rn, board_no, board_title, board_writer, board_view_count, "
				   + "       board_like_count, board_content, board_deleted, board_created_date "
				   + "from (select row_number() over (order by board_created_date desc) rn,"
				   + "      board_no, board_title, board_writer, board_view_count, "
				   + "      board_like_count, board_content, board_deleted, board_created_date "
				   + "      from tb_web_board) "
				   + "where rn >= ? and rn <= ? ";
		
		List<Board> boards = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setViewCount(rs.getInt("board_view_count"));
			board.setLikeCount(rs.getInt("board_like_count"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setCreatedDate(rs.getDate("board_created_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllboards() throws SQLException {
		String sql = "select board_no, board_title, board_writer, board_view_count, "
				   + "board_like_count, board_content, board_deleted, board_created_date "
				   + "from tb_web_board ";
		
		List<Board> boards = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setViewCount(rs.getInt("board_view_count"));
			board.setLikeCount(rs.getInt("board_like_count"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setCreatedDate(rs.getDate("board_created_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}

	public void insertBoard(String title, String writer, String content) throws SQLException {
		String sql = "insert into tb_web_board "
				   + "(board_no, board_title, board_writer, board_content) "
				   + "values "
				   + "(web_board_seq.nextval, ?, ?, ?) ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, content);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
