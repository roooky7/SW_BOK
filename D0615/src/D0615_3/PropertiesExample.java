package D0615_3;

import java.util.*;

public class PropertiesExample {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Properties properties = new Properties();
		properties.load(PropertiesExample.class.getResourceAsStream("database.properties"));
		
		String driver = properties.getProperty("driver");
		String url = properties.getProperty("url");
		String username = properties.getProperty("username");
		String password = properties.getProperty("password");
		String admin = properties.getProperty("admin");
		
		System.out.println(driver);
		System.out.println(url);
		System.out.println(username);
		System.out.println(password);
		System.out.println(admin);

	}

}
