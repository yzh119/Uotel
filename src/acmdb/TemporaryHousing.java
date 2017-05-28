package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by zihao on 2017/5/27.
 */
public class TemporaryHousing {
    public static int uid = 0;
    public TemporaryHousing() {++uid;}
    public void addPH(int uid, String name, String address,
                      String url, String telephone,
                      String yearBuilt, String price, Statement stmt) throws Exception{
        String statement;
        statement = "INSERT INTO TH values(" +
                uid + "," +
                "'" + name + "'" + "," +
                "'" + address + "'" + "," +
                "'" + url + "'" + "," +
                "'" + telephone + "'" + "," +
                yearBuilt + "," +
                price +
                ")";
        try {
            stmt.execute(statement);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public static String getTHsTable(Statement stmt) throws Exception {
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
                "<th>year built</th>" +
                "<th>price </th>" +
                " </tr>");
        while (rs.next()) {
            resultStr.append("<tr> " +
                    "<th>" + rs.getString("uid") + "</th>" +
                    "<th>" + rs.getString("name") + "</th>" +
                    "<th>" + rs.getString("address") + "</th>" +
                    "<th><a href=\"" + rs.getString("url") + "\">" + rs.getString("url") + "</a></th>" +
                    "<th>" + rs.getString("phone_number") + "</th>" +
                    "<th>" + rs.getString("year_built") + "</th>" +
                    "<th>" + rs.getString("price") + "</th>" +
                    "</tr>");
        }

        resultStr.append("</table>");
        return resultStr.toString();
    }
}
