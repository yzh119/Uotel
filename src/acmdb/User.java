package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by zihao on 2017/5/27.
 */
public class User {
    public User() {}
    public void addUser(String userName, String passWord,
                          String name, String address,
                          String phonenumber, Statement stmt) throws Exception {
        if (passWord.length() < 6)
            throw new Exception("Too short p******* for a man!");

        String statement;
        statement = "INSERT INTO user values(" +
                "'" + name + "'" + ","  +
                "'" + userName + "'" + "," +
                "'" + passWord + "'" + "," +
                "'" + address + "'" + "," +
                "'" + phonenumber + "'" +
                ")";
        try {
            stmt.execute(statement);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public String getPasswd(String userName, Statement stmt) throws Exception {
        String query;
        ResultSet rs;
        query = "SELECT passwd FROM user WHERE login_name='" + userName + "'";
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        rs.next();
        return rs.getString("passwd");
    }

    public String getReservationTable(String userName, Statement stmt) throws Exception {
        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        resultStr.append("</table>");
        return resultStr.toString();
    }
}
