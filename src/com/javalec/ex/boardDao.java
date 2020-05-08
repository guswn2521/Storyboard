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
				int group = rs.getInt("group");
				int step = rs.getInt("step");
				int indent = rs.getInt("indent");
				board = new boardDto(idx, name, email, homepage, title, content, pw, hit, regdate, group, step, indent);
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
		String sql = "select * from board order by `group` desc, step asc";
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
				int group = rs.getInt("group");
				int step = rs.getInt("step");
				int indent = rs.getInt("indent");
				board = new boardDto(idx, name, email, homepage, title, content, pw, hit, regdate, group, step, indent);
				boards.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return boards;
	}

	//조회수 증가
	public void setBoardHit(int idx) {
		String sql = "update board set hit=hit+1 where idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
	}

	//글쓰기
	public int setBoardWrite(boardDto board) {
		
		int ri=0;
		//idx값 가져오기
		int idx = getIdx();
		String sql = "insert into board (idx, name, email, homepage, title, content, pw, `group`) values(?,?,?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,idx);
			pstmt.setString(2,board.getName());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getHomepage());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getPw());
			pstmt.setInt(8, idx);
			ri = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return ri;
	}

	//글수정
	public int setBoardUpdate (boardDto board, int idx) {
		String sql = "update board set name=?, email=?, homepage=?, title=?, content=? where idx=?";
		int ri=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,board.getName());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getHomepage());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, idx);
			ri = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return ri;
	}

	//글삭제
		public int setBoardDelete (int idx) {
			String sql = "delete from board where idx=?";
			int ri=0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				ri = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtill.close(pstmt, conn);
			}
			return ri;
		}
		
		
		//답변하기
		public int setBoardReply(boardDto board) {		
			int ri=0;
			//답변 전 reply 리스트변경
			setReply(board.getGroup(),board.getStep());
			int idx=getIdx();
			String sql = "insert into board (idx, name, email, homepage, title, content, pw, `group`, step, indent) values(?,?,?,?,?,?,?,?,?,?)";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,idx);
				pstmt.setString(2,board.getName());
				pstmt.setString(3, board.getEmail());
				pstmt.setString(4, board.getHomepage());
				pstmt.setString(5, board.getTitle());
				pstmt.setString(6, board.getContent());
				pstmt.setString(7, board.getPw());
				pstmt.setInt(8, board.getGroup());
				pstmt.setInt(9, board.getStep()+1);
				pstmt.setInt(10, board.getIndent()+1);
				ri = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtill.close(pstmt, conn);
			}
			return ri;
		}
		
		//답변 전 reply 리스트변경
		public int setReply (int group, int step) {
			String sql = "update board set step=step+1";
			sql = sql + "where `group` = ? and step > ?";
			int ri=0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,group);
				pstmt.setInt(2,step);
				
				ri = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtill.close(pstmt, conn);
			}
			return ri;
		}
		
		//idx값 가져오기
		public int getIdx() {
			int idx = 0;
			String sql = "select max(idx)+1 as idx from board";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					idx = rs.getInt("idx");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtill.close(rs, pstmt, conn);
			}
			return idx;
		}

}