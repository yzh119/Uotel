package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Visit {
    public String username;
    public List<Integer> indices = new ArrayList<>();
    public List<String> start = new ArrayList<>();
    public List<String> end = new ArrayList<>();
    public List<Integer> cost = new ArrayList<>();
    public List<Integer> people = new ArrayList<>();

    public Visit(String username) {
        this.username = username;
    }

    public void addToList(int rid, String start, String end, int spent, int number) {
        indices.add(rid);
        this.start.add(start);
        this.end.add(end);
        this.cost.add(spent);
        this.people.add(number);
    }

    public void pushList() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;

        for (int i = 0; i < indices.size(); ++i) {
            String query;
            query = "SELECT * FROM reservation r, visit v WHERE " +
                    "r.rid = " + indices.get(i) + " and " +
                    "r.user_name = '" + username + "' and " +
                    "v.user_name = '" + username + "'" +
                    " and (" +
                    "'" + start.get(i) + "'" + " < r.start_date or " +
                    "'" + end.get(i) + "'" + " > r.end_date or " +
                    "(" +
                    "(" +
                    "'" + start.get(i) + "'" + " >= v.start_date and " +
                    "'" + start.get(i) + "'" + " <= v.end_date" +
                    ") or" +
                    "(" +
                    "'" + end.get(i) + "'" + " >= v.start_date and " +
                    "'" + end.get(i) + "'" + " <= v.end_date" +
                    ")" +
                    "))";

            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                throw new Exception("Invalid stay period or conflict!");
            }
        }

        for (int i = 0; i < indices.size(); ++i) {
            String query;
            String statement;
            ResultSet rs;
            statement = "INSERT INTO visit VALUES (" +
                    indices.get(i) + "," +
                    "'" + username + "'" + "," +
                    "'" + start.get(i) + "'" + "," +
                    "'" + end.get(i) + "'" + "," +
                    cost.get(i) + "," +
                    people.get(i) +
                    ")";
            stmt.execute(statement);

            int currentUid = 0;
            query = "SELECT uid FROM reservation r WHERE r.rid = " + indices.get(i);
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
