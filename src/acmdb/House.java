package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class House {
    public static int uid = 0;
    public House() throws Exception {
        Connector connector = new Connector();
        resetUidFromSQL(connector.statement);
        ++uid;
        connector.close();
    }

    public static void resetUidFromSQL(Statement stmt) throws Exception {
        String query;
        ResultSet rs;
        query = "SELECT MAX(th.uid) FROM TH th";
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            uid = rs.getInt(1);
        }
    }

    public static void createHouse(int uid, String name, String address, String url, String telephone, String yearBuilt, String price) throws Exception{
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO TH values(" + uid + ",'" + name + "','" + address + "','" + url + "','" + telephone + "'," + yearBuilt + "," + price + ",0)");
        connector.close();
    }

    public static String getTHsTable() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        String query;
        ResultSet rs;
        query = "SELECT * FROM TH";
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        resultStr.append("<tr> " +
                "<th>uid</th>" +
                "<th>name</th> " +
                "<th>address</th> " +
                "<th>url</th>" +
                "<th>telephone</th>" +
                "<th>year_built</th>" +
                "<th>price </th>" +
                "<th>visit_count </th>" +
                " </tr>");
        while (rs.next()) {
            resultStr.append("<tr> " +
                    "<th>" + rs.getString(1) + "</th>" +
                    "<th>" + rs.getString(2) + "</th>" +
                    "<th>" + rs.getString(3) + "</th>" +
                    "<th><a href=\"" + rs.getString(4) + "\">" + rs.getString(4) + "</a></th>" +
                    "<th>" + rs.getString(5) + "</th>" +
                    "<th>" + rs.getString(6) + "</th>" +
                    "<th>" + rs.getString(7) + "</th>" +
                    "<th>" + rs.getString(8) + "</th>" +
                    "</tr>");
        }

        resultStr.append("</table>");
        connector.close();
        return resultStr.toString();
    }
}