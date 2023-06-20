package ch30.Ex01;

import java.sql.*;

public class ex02 extends Ex01 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 로딩 성공");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="hr";
			String pwd="1234";
			Connection conn=DriverManager.getConnection(url, user, pwd);
			System.out.println("커넥션 성공");
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from department");
			while(rs.next()) {
				System.out.println(rs.getInt("DNO")+":"+rs.getString("DNAME")+":"+rs.getString("loc"));
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
