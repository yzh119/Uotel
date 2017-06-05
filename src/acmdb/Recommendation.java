package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Recommendation {
    public static String getRecommendations(String username) throws Exception {
        StringBuffer resultStr = new StringBuffer();
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        String query = "SELECT distinct new_th.* FROM " +
                "user u1, user u2, " +
                "visit v1, visit v2, visit all2, " +
                "reservation r1, reservation r2, reservation allr2, " +
                "TH common_th, TH new_th " +
                "WHERE " +
                "u1.login_name = '" + username + "' and u1.login_name <> u2.login_name and " +
                "v1.user_name = u1.login_name and v1.rid = r1.rid and v1.user_name = r1.user_name and r1.uid = common_th.uid and " +
                "v2.user_name = u2.login_name and v2.rid = r2.rid and v2.user_name = r2.user_name and r2.uid = common_th.uid and " +
                "all2.user_name = u2.login_name and all2.rid = allr2.rid and new_th.uid = allr2.uid " +
                "ORDER by new_th.visit_count DESC";

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
