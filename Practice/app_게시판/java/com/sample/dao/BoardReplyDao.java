package com.sample.dao;

import static com.sample.utils.ConnectionUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.vo.Board;
import com.sample.vo.BoardReply;

public class BoardReplyDao {
	
	public void deleteBoardReply(int replyNo) throws SQLException {
		String sql = "delete from tb_web_board_reply "
				   + "where reply_no = ? ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, replyNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<BoardReply> getAllBoardReplies() throws SQLException {
		String sql = "select R.reply_no, R.reply_writer, R.reply_content, R.reply_created_date, B.board_no "
				   + "from tb_web_board_reply R, tb_web_board B "
				   + "where R.board_no = B.board_no ";
		
		List<BoardReply> boardReplies = new ArrayList<>();
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardReply boardReply = new BoardReply();
			BoardDao boardDao = new BoardDao();
			Board board = boardDao.getBoardByNo(rs.getInt("board_no"));
			
			boardReply.setNo(rs.getInt("reply_no"));
			boardReply.setWriter(rs.getString("reply_writer"));
			boardReply.setContent(rs.getString("reply_content"));
			boardReply.setCreatedDate(rs.getDate("reply_created_date"));
			boardReply.setBoard(board);
			
			boardReplies.add(boardReply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boardReplies;
	}

	public void insertReply(BoardReply boardReply) throws SQLException {
		String sql = "insert into tb_web_board_reply"
				   + "(reply_no, reply_writer, reply_content, reply_created_date, board_no)"
				   + "values"
				   + "(web_board_seq.nextval, ?, ?, sysdate, ?) ";
		
		Connection connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, boardReply.getWriter());
		pstmt.setString(2, boardReply.getContent());
		pstmt.setInt(3, boardReply.getBoard().getNo());
		
		pstmt.executeUpdate();
	
		pstmt.close();
		connection.close();
	}
}
