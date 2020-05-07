package com.javalec.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.bigdata.common.JDBCUtill;
import com.bigdata.dto.MembersDto;

public class 손현주_memberDao {
	private static MembersDao instance = new MembersDao();
	public static MembersDao getInstance() {
		return instance;
	}
	private static String membersSelect = "select * from members order by id desc";
	private Connection getConnection() {
		//Context context = null;
		//DataSource dsSource = null;
		Connection conn = null;
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/bigdata";
		url += "?useSSL=false&serverTimezone=UTC";
		String uid = "root";
		String upw = "rootpass";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;	
	}
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
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String nickname = rs.getString("nickname");
				String mail = rs.getString("mail");
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
}