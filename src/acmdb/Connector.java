package acmdb;

import java.sql.*;

public class Connector {
	private Connection connection;
	public Statement statement;

	public Connector() throws Exception {
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://localhost/acmdb10";

//		String userName = "acmuser";
//	   	String password = "acmspring17";
//		String url = "jdbc:mysql://georgia.eng.utah.edu/acmdb";

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(url, username, password);
		statement = connection.createStatement();
	}
	
	public void close() throws Exception {
		connection.close();
	}
}
