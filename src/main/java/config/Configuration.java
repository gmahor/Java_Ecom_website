package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class Configuration implements ServletContextListener {

	public static final Connection conn = getConnection();

	private static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			System.out.println("--DB CONNECTED--");

			return DriverManager.getConnection("jdbc:mysql://localhost:3306/gourav", "gmahor", "password");
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("--DB CONNECTION FAILURE--");

		}

		return null;
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("--DB DISCONNECTION FAILURE--");
		}

	}

	public void contextInitialized(ServletContextEvent arg0) {

	//	Category c = new Category("a","a");
	//	CategoryHandler ch = new CategoryHandler();
//		System.out.println(ch.fetchAllCategories());
	
	}

}
