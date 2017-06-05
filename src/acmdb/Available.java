package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class Available {
    public Available() {}

    public static void removeAvailable(int uid, String startTime, String endTime) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        String statement = "DELETE a FROM available a WHERE a.uid = " + uid + " and " +
                "a.start_date='" + startTime.substring(0, 10) + "' and a.end_date='" + endTime.substring(0, 10) + "'";
        stmt.execute(statement);
        connector.close();
    }

    public static void addAvailable(int uid, String startTime, String endTime) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        String query = "SELECT * FROM period p WHERE p.start_date='" + startTime +
                "' and " + "p.end_date='" + endTime + "'";
        ResultSet rs;
        String statement;
        rs = stmt.executeQuery(query);

        if (!rs.next()) {
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
        }

        query = "SELECT * FROM available a " +
                "WHERE  a.uid = " + uid +
                " and    ((a.start_date <= '" + startTime + "' and a.end_date >= '" + startTime + "')" +
                " or     (a.start_date <= '" + endTime + "' and a.end_date >= '" + endTime + "'))" ;

        rs = stmt.executeQuery(query);

        if (rs.next()) {
            throw new Exception("Overlay period!");
        }

        statement = "INSERT INTO available values(" +
                    uid + "," +
                    "'" + startTime + "'," +
                    "'" + endTime + "'" +
                    ")";
        stmt.execute(statement);

        connector.close();
    }

    public static String getAvailableTable(int uid) throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        StringBuffer builder = new StringBuffer();
        builder.append("<table>");
        builder.append("<tr> " +
                "<th> start_time </th>" +
                "<th> end_time </th>" +
                "</tr>"
        );

        String query;
        ResultSet rs;
        query = "SELECT * FROM available WHERE uid=" + uid;

        rs = stmt.executeQuery(query);

        while (rs.next()) {
            builder.append("<tr>" +
                    "<th>" + rs.getString("start_date") + "</th>" +
                    "<th>" + rs.getString("end_date") + "</th>" +
                    "</tr>"
            );
        }

        builder.append("</table>");
        connector.close();
        return builder.toString();
    }
}
