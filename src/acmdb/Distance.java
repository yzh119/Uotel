package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by zihao on 2017/5/29.
 */
public class Distance {
    public static int getDis(String u1, String u2) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.stmt;

        String query;
        ResultSet rs;

        query = "SELECT * FROM " +
                "user u1, user u2, " +
                "visit s1, visit s2, " +
                "reservation r1, reservation r2 " +
                "WHERE " +
                "u1.login_name = '" + u1 + "' and u2.login_name = '" + u2 + "' and " +
                "s1.user_name = u1.login_name and s2.user_name = u2.login_name and " +
                "r1.rid = s1.rid and r1.user_name = s1.user_name and " +
                "r2.rid = s1.rid and r2.user_name = s2.user_name and " +
                "r1.uid = r2.uid";

        System.out.println(query);
        System.out.flush();

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            connector.closeConnection();
            return 1;
        }

        query = "SELECT * FROM " +
                "user u1, user u2, user u3,  " +
                "visit s1, visit s2, visit s3,  " +
                "reservation r1, reservation r2, reservation r3 " +
                "WHERE " +
                "u1.login_name = '" + u1 + "' and  " +
                "s1.user_name = u1.login_name and s3.user_name = u3.login_name and  " +
                "r1.rid = s1.rid and r1.user_name = s3.user_name and  " +
                "r3.rid = s1.rid and r3.user_name = s3.user_name and  " +
                "r1.uid = r3.uid " +
                "and  " +
                "u2.login_name = '" + u2 + "' and  " +
                "s2.user_name = u2.login_name and s3.user_name = u3.login_name and  " +
                "r2.rid = s2.rid and r2.user_name = s3.user_name and  " +
                "r3.rid = s2.rid and r3.user_name = s3.user_name and  " +
                "r2.uid = r3.uid";

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            connector.closeConnection();
            return 2;
        }


        connector.closeConnection();
        return -1;
    }
}
