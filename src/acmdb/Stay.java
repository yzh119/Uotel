package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Stay {
    private String username;
    private List<Integer> selectRID = new ArrayList<>();
    private List<String> startDate = new ArrayList<>();
    private List<String> endDate = new ArrayList<>();
    private List<Integer> spent = new ArrayList<>();
    private List<Integer> number = new ArrayList<>();

    public Stay(String username) {
        this.username = username;
    }

    public void addToList(int rid, String start, String end, int spent, int number) {
        selectRID.add(rid);
        startDate.add(start);
        endDate.add(end);
        this.spent.add(spent);
        this.number.add(number);
    }

    public void pushList() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;

        for (int i = 0; i < selectRID.size(); ++i) {
            String query;
            query = "SELECT * FROM reservation r, visit v WHERE " +
                    "r.rid = " + selectRID.get(i) + " and " +
                    "r.user_name = '" + username + "' and " +
                    "v.user_name = '" + username + "'" +
                    " and (" +
                    "'" + startDate.get(i) + "'" + " < r.start_date or " +
                    "'" + endDate.get(i) + "'" + " > r.end_date or " +
                    "(" +
                    "(" +
                    "'" + startDate.get(i) + "'" + " >= v.start_date and " +
                    "'" + startDate.get(i) + "'" + " <= v.end_date" +
                    ") or" +
                    "(" +
                    "'" + endDate.get(i) + "'" + " >= v.start_date and " +
                    "'" + endDate.get(i) + "'" + " <= v.end_date" +
                    ")" +
                    "))";

            System.out.println(query);
            System.out.flush();

            ResultSet rs = stmt.executeQuery(query);
            if (rs.next())
                throw new Exception("Invalid stay period or conflict!");
        }

        for (int i = 0; i < selectRID.size(); ++i) {
            String query;
            String statement;
            ResultSet rs;
            statement = "INSERT INTO visit VALUES (" +
                    selectRID.get(i) + "," +
                    "'" + username + "'" + "," +
                    "'" + startDate.get(i) + "'" + "," +
                    "'" + endDate.get(i) + "'" + "," +
                    spent.get(i) + "," +
                    number.get(i) +
                    ")";
            stmt.execute(statement);

            int currentUid = 0;
            query = "SELECT uid FROM reservation r WHERE r.rid = " + selectRID.get(i);
            rs = stmt.executeQuery(query);
            rs.next();
            currentUid = rs.getInt(1);

            int newCount = 0;
            query = "SELECT visit_count FROM TH th WHERE th.uid = " + currentUid;
            rs = stmt.executeQuery(query);
            rs.next();
            newCount = rs.getInt(1) + 1;

            statement = "UPDATE TH SET visit_count = " + newCount + " WHERE uid = " + currentUid;
            stmt.execute(statement);
        }

        connector.close();
    }

    public String getPermanentStay() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;

        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        resultStr.append("<tr>" +
                "<th>rid</th>" +
                "<th>start_date</th>" +
                "<th>end_date</th>" +
                "<th>total_spent</th>" +
                "<th>num_person</th>" +
                "</tr>");

        String query;
        query = "SELECT rid, start_date, end_date, total_spent, num_person FROM visit " +
                "WHERE user_name = '" + username + "'";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            resultStr.append("<tr>" +
                    "<th>" + rs.getInt(1) + "</th>" +
                    "<th>" + rs.getString(2).substring(0, 10) + "</th>" +
                    "<th>" + rs.getString(3).substring(0, 10) + "</th>" +
                    "<th>" + rs.getInt(4) + "</th>" +
                    "<th>" + rs.getInt(5) + "</th>" +
                    "</tr>");
        }

        resultStr.append("</table>");
        return resultStr.toString();
    }

    public String getTemporaryStay() throws Exception {
        StringBuffer resultStr = new StringBuffer();
        resultStr.append("<table>");
        resultStr.append("<tr>" +
                "<th>rid</th>" +
                "<th>start_date</th>" +
                "<th>end_date</th>" +
                "<th>total_spent</th>" +
                "<th>num_person</th>" +
                "</tr>");

        for (int i = 0; i < selectRID.size(); ++i) {
            resultStr.append("<tr>" +
                    "<th>" + selectRID.get(i) + "</th>" +
                    "<th>" + startDate.get(i) + "</th>" +
                    "<th>" + endDate.get(i) + "</th>" +
                    "<th>" + spent.get(i) + "</th>" +
                    "<th>" + number.get(i) + "</th>" +
                    "</tr>");
        }

        resultStr.append("</table>");
        return resultStr.toString();
    }
}
