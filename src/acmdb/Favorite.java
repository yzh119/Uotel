package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Favorite {
    String username;
    public Favorite(String username) {
        this.username = username;
    }



    public String getFavoriteList() throws Exception {
        StringBuffer resultStr = new StringBuffer();
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        String query = "SELECT th.uid, name, address, url, phone_number, year_built, price, visit_count " +
                "FROM TH th, favorite f " +
                "WHERE f.user_name = '" + username + "' and f.uid = th.uid";

        ResultSet rs;
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        resultStr.append("<table>");

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
