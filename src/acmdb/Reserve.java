package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by zihao on 2017/5/27.
 */
public class Reserve {
    public static int rid = 0;
    public String username;
    public Reserve(String username) {
        this.username = username;
    }
    public ArrayList<Integer> selectTH = new ArrayList<>();
    public ArrayList<String> startDate = new ArrayList<>();
    public ArrayList<String> endDate = new ArrayList<>();
    public void resetRidFromSQL(Statement stmt) throws Exception {
        String query;
        ResultSet rs;
        query = "SELECT MAX(rs.rid) FROM reserve rs WHERE " +
            "rs.user_name = \"" + username + "\"";
        ;

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            rid = rs.getInt(1);
        }
    }
    public void addToList(int uid, String start, String end) {
        selectTH.add(uid);
        startDate.add(start);
        endDate.add(end);
    }

    public void pushList() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.stmt;
        resetRidFromSQL(stmt);
        ++rid;

        for (int i = 0; i < selectTH.size(); ++i) {
            String statement;
            statement = "INSERT INTO reserve values(" +
                    rid + "," +
                    selectTH.get(i) + "," +
                    "'" + username + "'" + "," +
                    "'" + startDate.get(i) + "'" + "," +
                    "'" + endDate.get(i) + "'" +
                ")";
            stmt.execute(statement);
            ++rid;
        }
        connector.closeConnection();
    }

    public String getTemporaryReservation() {
        StringBuffer resultStr = new StringBuffer();

        resultStr.append("<table>");
        resultStr.append("<tr>" +
                "<th>uid</th>" +
                "<th>start_date</th>" +
                "<th>end_date</th>" +
                "</tr>");
        for (int i = 0; i < selectTH.size(); ++i) {
            resultStr.append("<tr>" +
                    "<th>" + selectTH.get(i) + "</th>" +
                    "<th>" + startDate.get(i) + "</th>" +
                    "<th>" + endDate.get(i) + "</th>" +
                    "</tr>");
        }
        resultStr.append("</table>");
        return resultStr.toString();
    }

    public String getPermanentReservation() throws Exception{
        Connector connector = new Connector();
        Statement stmt = connector.stmt;
        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        resultStr.append("<tr>" +
                "<th>rid</th>" +
                "<th>uid</th>" +
                "<th>start_date</th>" +
                "<th>end_date</th>" +
                "</tr>");
        String query;
        query = "SELECT rid, uid, start_date, end_date FROM reserve WHERE " +
            "user_name=\"" + username + "\"";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            resultStr.append("<tr>" +
                    "<th>" + rs.getString(1) + "</th>" +
                    "<th>" + rs.getString(2) + "</th>" +
                    "<th>" + rs.getString(3) + "</th>" +
                    "<th>" + rs.getString(4) + "</th>" +
                    "</tr>");
        }
        resultStr.append("</table>");
        return resultStr.toString();
    }
}
