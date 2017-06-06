package acmdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connector {
	private Connection connection;
	public Statement statement;

	public Connector() throws Exception {
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost/acmdb10";

//		String username = "acmuser";
//	   	String password = "acmspring17";
//		String url = "jdbc:mysql://georgia.eng.utah.edu/acmdb";

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		try {
			connection = DriverManager.getConnection(url, username, password);
			statement = connection.createStatement();
		} catch (Exception e) {
			throw new Exception("Database connection error!");
		}
	}
	
	public void close() throws Exception {
		connection.close();
	}
}
