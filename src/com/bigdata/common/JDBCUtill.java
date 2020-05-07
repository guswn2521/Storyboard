package com.bigdata.common;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class JDBCUtill {
	public static Connection getConnection() {
		Context context = null;
		DataSource dsSource = null;
		Connection conn = null;
		try {
			context = new InitialContext();
			dsSource = (DataSource)context.lookup("java:comp/env/jdbc/Mysql");
			conn = dsSource.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;	
	}
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			rs = null;
			pstmt = null;
			conn = null;
		}
	}
	public static void close(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pstmt = null;
			conn = null;
		}
	}
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if(rs !=null) rs.close();
			if(stmt !=null) stmt.close();
			if(conn !=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			rs = null;
			stmt = null;
			conn = null;
		}
	}
	public static void close(Statement stmt, Connection conn) {
		try {			
			if(stmt !=null) stmt.close();
			if(conn !=null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			stmt = null;
			conn = null;
		}
	}	
}
