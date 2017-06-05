package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Visit {
    public String username;
    public List<Integer> selectRID = new ArrayList<>();
    public List<String> startDate = new ArrayList<>();
    public List<String> endDate = new ArrayList<>();
    public List<Integer> spent = new ArrayList<>();
    public List<Integer> number = new ArrayList<>();

    public Visit(String username) {
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
}
