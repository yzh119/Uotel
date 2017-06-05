package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Account {
    private static boolean existAccount(String username) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * from user WHERE login_name='" + username + "'");
        boolean response = result.next();
        connector.close();
        return response;
    }

    public static void createAccount(String username, String password, String name, String address, String phone) throws Exception {
        if (existAccount(username)) {
            throw new Exception("Username \"" + username + "\" exists!");
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO user values('" + name + "','" + username + "','" + password + "','" + address + "','" + phone + "')");
        connector.close();
    }

    public static boolean checkPassword(String username, String password) throws Exception {
        if (!existAccount(username)) {
            return false;
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT passwd FROM user WHERE login_name='" + username + "'");
        boolean response = result.next() && result.getString("passwd").equals(password);
        connector.close();
        return response;
    }

    public static int computeDistance(String username1, String username2) throws Exception {
        if (!existAccount(username1)) {
            throw new Exception("Account \"" + username1 + "\" does not exist!");
        }
        if (!existAccount(username2)) {
            throw new Exception("Account \"" + username2 + "\" does not exist!");
        }
        if (username1.equals(username2)) {
            return 0;
        }
        String[] queries = new String[2];
        queries[0] = "SELECT * FROM " +
            "user u1, user u2, " +
            "visit s1, visit s2, " +
            "reservation r1, reservation r2 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' and u2.login_name = '" + username2 + "' and " +
            "s1.user_name = u1.login_name and s2.user_name = u2.login_name and " +
            "r1.rid = s1.rid and r1.user_name = s1.user_name and " +
            "r2.rid = s1.rid and r2.user_name = s2.user_name and " +
            "r1.uid = r2.uid";
        queries[1] = "SELECT * FROM " +
            "user u1, user u2, user u3,  " +
            "visit s1, visit s2, visit s3,  " +
            "reservation r1, reservation r2, reservation r3 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' and  " +
            "s1.user_name = u1.login_name and s3.user_name = u3.login_name and  " +
            "r1.rid = s1.rid and r1.user_name = s3.user_name and  " +
            "r3.rid = s1.rid and r3.user_name = s3.user_name and  " +
            "r1.uid = r3.uid " +
            "and " +
            "u2.login_name = '" + username2 + "' and  " +
            "s2.user_name = u2.login_name and s3.user_name = u3.login_name and  " +
            "r2.rid = s2.rid and r2.user_name = s3.user_name and  " +
            "r3.rid = s2.rid and r3.user_name = s3.user_name and  " +
            "r2.uid = r3.uid";

        int distance = -1;
        Connector connector = new Connector();
        Statement statement = connector.statement;
        for (int i = 0; i < 2; ++i) {
            ResultSet result = statement.executeQuery(queries[i]);
            if (result.next()) {
                distance = i + 1;
                break;
            }
        }
        connector.close();
        return distance;
    }
}