package ch30.Ex01;

import java.sql.*;

public class Ex03 {

	public static void main(String[] args) {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hr";
		String pwd="1234";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection(url, user, pwd);
			String sql="insert into member values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "sky77");
			pstmt.setString(2,"김철수");
			pstmt.setString(3, "1234");
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
