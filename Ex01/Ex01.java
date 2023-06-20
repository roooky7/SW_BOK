package ch30.Ex01;

import java.sql.*;

public class Ex01 {

	public static void main(String[] args) {
		//1. 드라이버 로딩   프로젝트 파일/빌드 패스/컨피그 빌드패스/라이브러리/클래스패스/에드익스터널jars/오라클6
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 로딩 성공");

			//2.커넥션 생성   window/show view/other/data source explorer/new oracle/properties-url
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="hr";
			String pass="1234";
			Connection conn = DriverManager.getConnection(url, user, pass);
			System.out.println("커넥션 생성 성공"+conn);
			//3.stmt생성
			Statement stmt = conn.createStatement();
			System.out.println(stmt);
			//4.execute
			String sql = "select eno,ename from employee";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.println(rs.getString(1)+":"+rs.getString(2));
			}
			//5.자원 반납
			rs.close();
			stmt.close();
			conn.close();
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		
		} catch (SQLException e) {
			System.out.println("커넥션 생성 실패");
			e.printStackTrace();
		}

	}

}
