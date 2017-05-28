package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by zihao on 2017/5/28.
 */
public class Available {
    public Available() {}

    /*
    public void removeAvailable(int uid,
                                String startTime, String endTime) throws Exception {
        Connector connector = new Connector();

    }*/

    public void addAvailable(int uid,
                      String startTime, String endTime) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.stmt;
        String statement;
        statement = "INSERT INTO period values(" +
                    "'" + startTime + "'," +
                    "'" + endTime + "'" +
                ")";
        try {
            stmt.execute(statement);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        String query;
        ResultSet rs;
        query = "SELECT * FROM available a " +
                "WHERE  a.uid = " + uid +
                " and    ((a.start_date <= '" + startTime + "' and a.end_date >= '" + startTime + "')" +
                " or     (a.start_date <= '" + endTime + "' and a.end_date >= '" + endTime + "'))" ;

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next())
            throw new Exception("This period is not available!");

        statement = "INSERT INTO available values(" +
                    uid + "," +
                    "'" + startTime + "'," +
                    "'" + endTime + "'" +
                    ")";
        try {
            stmt.execute(statement);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        connector.closeConnection();
    }

    public static String getAvailableTable(int uid) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.stmt;
        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        resultStr.append("<tr> " +
                "<th> start_time </th>" +
                "<th> end_time </th>" +
                "</tr>"
        );

        String query;
        ResultSet rs;
        query = "SELECT * FROM available WHERE uid=" + uid;

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        while (rs.next()) {
            resultStr.append("<tr>" +
                    "<th>" + rs.getString("start_date") + "</th>" +
                    "<th>" + rs.getString("end_date") + "</th>" +
                    "</tr>"
            );
        }

        resultStr.append("</table>");
        connector.closeConnection();
        return resultStr.toString();
    }
}
