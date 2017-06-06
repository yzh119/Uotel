package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Account {
    public static void add(String username, String password, String name, String address, String phone) throws Exception {
        if (exist(username)) {
            throw new Exception("Username \"" + username + "\" exists!");
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO user values('" + name + "','" + username + "','" + password + "','" + address + "','" + phone + "')");
        connector.close();
    }

    public static boolean exist(String username) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM user WHERE login_name='" + username + "'");
        boolean response = result.next();
        connector.close();
        return response;
    }

    public static boolean check(String username, String password) throws Exception {
        if (!exist(username)) {
            return false;
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT passwd FROM user WHERE login_name='" + username + "'");
        boolean response = result.next() && result.getString("passwd").equals(password);
        connector.close();
        return response;
    }
}