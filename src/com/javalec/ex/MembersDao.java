package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bigdata.common.JDBCUtill;
import com.bigdata.dto.MembersDto;

public class MembersDao {
	private static MembersDao instance = new MembersDao();
	private static String membersSelect = "select * from members order by id desc";
	private static String membersInsert = "Insert into members(id,pw,name,nickname,mail) values(?,?,?,?,?)";
	private static String userCheck = "select pw from members where id=?";
	private static String confirmId = "select count(id) as cnt from members where id=?";
	private static String membersUpdate = "update members set pw=?,name=?,nickname=?,mail=? where id=?";
	private static String getMemberInfo = "select * from members where id=?";
	private static String membersDelete = "delete from members where id=?";
	
	
	
	public MembersDao() {
	}

	public static MembersDao getInstance() {
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		conn = JDBCUtill.getConnection();
		return conn;	
	}

	//member
	public ArrayList<MembersDto> getMemberList(){
		ArrayList<MembersDto> members = new ArrayList<MembersDto>();
		MembersDto member = new MembersDto();
		//1. DB설정
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		//2. 연결
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(membersSelect);
			rs = pstmt.executeQuery();//쿼리실행
			
			//rs에서 값 꺼내서 member에 넣기.
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String mail = rs.getString("mail");
				/*
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setNickname(rs.getString("nickname"));
				member.setMail(rs.getString("mail"));
				*/
				
				member = new MembersDto(id, pw, name, nickname, mail); //회원한명생성.
				members.add(member);//각 방에 집어넣기.
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return members;
	}
	

	//join
	public int membersInsert(MembersDto dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(membersInsert);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getMail());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return result;
	}
	

	//join
	public int confirmId(String id) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//1.connection
			conn = getConnection();
			//2.query
			pstmt = conn.prepareStatement(confirmId);
			pstmt.setString(1, id);
			//3.쿼리실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");//sql의 cnt컬럼
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return result;
		
	}
	

	//login,delete
	public int userCheck(String id, String pw) {
		int ri = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(userCheck);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();//쿼리실행
			if(rs.next()) {
				String dbPw = rs.getString("pw");
				if(pw.equals(dbPw)) {
					ri=1;
				}else {
					ri=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return ri;
	}
	
	//modify
	public MembersDto getMemberInfo(String id) {
		MembersDto member = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//1.connection
			conn = getConnection();
			//2.query창 띄우고, 쿼리 치기
			pstmt = conn.prepareStatement(getMemberInfo);
			pstmt.setString(1, id);
			//3.쿼리실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String pw = rs.getString("pw");//db의 컬럼명
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String mail = rs.getString("mail");
				member = new MembersDto(id, pw, name, nickname, mail);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(rs, pstmt, conn);
		}
		return member;
		
	}
	
	//modify
	public int membersUpdate(MembersDto member) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1.connection
			conn = getConnection();
			//2.query
			pstmt = conn.prepareStatement(membersUpdate);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getMail());
			pstmt.setString(5, member.getId());
			//3.쿼리실행
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return result;
	}
	
	//delete
	public int membersDelete(String id) {
		int result=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//1.connection
			conn = getConnection();
			//2.query
			pstmt = conn.prepareStatement(membersDelete);
			pstmt.setString(1, id);
			
			//3.쿼리실행
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtill.close(pstmt, conn);
		}
		return result;
	
	}
	
}
