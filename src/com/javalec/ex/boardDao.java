package com.javalec.ex;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import com.bigdata.common.JDBCUtill;
import com.bigdata.dto.MembersDto;
import com.bigdata.dto.boardDto;
public class boardDao {
	private static boardDao instance = new boardDao();
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;



	public boardDao() {}
	public static boardDao getInstance() {
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		conn = JDBCUtill.getConnection();
		return conn;	
	}

	//글 1개 가져오기
	public boardDto getBoardOne(int idx) {
		boardDto board = null;
		String sql = "select * from board where idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String pw = rs.getString("pw");
				int hit = rs.getInt("hit");
				String regdate = rs.getString("regdate");
				board = new boardDto(idx, name, email, homepage, title, content, pw, hit, regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return board;
	}

	//글 전체 가져오기
	public ArrayList<boardDto> getBoardAll() {
		ArrayList<boardDto> boards = new ArrayList<boardDto>();
		boardDto board = null;
		String sql = "select * from board order by idx desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String pw = rs.getString("pw");
				int hit = rs.getInt("hit");
				String regdate = rs.getString("regdate");
				board = new boardDto(idx, name, email, homepage, title, content, pw, hit, regdate);
				boards.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return boards;
	}

	public int updateBoard(boardDto board) {
		int result=0;
		String sql = "update board set name='?',email='?',homepage='?',title='?',''content='?',pw='?' where idx=?;";
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getName() );
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getHomepage());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getPw());
			pstmt.setInt(7, board.getIdx());
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return result;
	}

}