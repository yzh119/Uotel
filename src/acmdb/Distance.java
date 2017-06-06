package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Distance {
    public static int get(String username1, String username2) throws Exception {
        if (!Account.exist(username1)) {
            throw new Exception("Account \"" + username1 + "\" does not exist!");
        }
        if (!Account.exist(username2)) {
            throw new Exception("Account \"" + username2 + "\" does not exist!");
        }
        if (username1.equals(username2)) {
            return 0;
        }
        String[] queries = new String[2];
        queries[0] = "SELECT * FROM " +
            "user u1, favorite f1, user u2, favorite f2 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' AND u2.login_name = '" + username2 + "' AND " +
            "f1.user_name = u1.login_name AND f2.user_name = u2.login_name AND " +
            "f1.uid = f2.uid";
        queries[1] = "SELECT * FROM " +
            "user u1, favorite f1, user u2, favorite f2, user u3, favorite f31, favorite f32 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' AND " +
            "f1.user_name = u1.login_name AND f31.user_name = u3.login_name AND " +
            "f1.uid = f31.uid " +
            "AND " +
            "u2.login_name = '" + username2 + "' AND " +
            "f2.user_name = u2.login_name AND f32.user_name = u3.login_name AND " +
            "f2.uid = f32.uid";
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
