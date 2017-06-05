package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Account {
    public static boolean createAccount(String username, String password, String name, String address, String phonenumber) {
        if (password.length() < 6) {
            return false;
        }
        try {
            Connector connector = new Connector();
            Statement statement = connector.statement;
            statement.execute("INSERT INTO user values(" +
              "'" + name + "'" + ","  +
              "'" + username + "'" + "," +
              "'" + password + "'" + "," +
              "'" + address + "'" + "," +
              "'" + phonenumber + "'" +
              ")");
            connector.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean checkPassword(String username, String password) {
        boolean response;
        try {
            Connector connector = new Connector();
            Statement statement = connector.statement;
            ResultSet result = statement.executeQuery("SELECT passwd FROM user WHERE login_name='" + username + "'");
            response = result.next() && result.getString("passwd").equals(password);
            connector.close();
        } catch (Exception e) {
            e.printStackTrace();
            response = false;
        }
        return response;
    }

    public static int computeDistance(String username1, String username2) throws Exception {
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
        try {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return distance;
    }
}