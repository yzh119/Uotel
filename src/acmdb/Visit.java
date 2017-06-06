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
    public List<Integer> people = new ArrayList<>();
    public List<Integer> cost = new ArrayList<>();

    public Visit(String username) {
        this.username = username;
    }

    public void add(int id, String start, String end, int spent, int number) {
        this.indices.add(id);
        this.start.add(start);
        this.end.add(end);
        this.people.add(number);
        this.cost.add(spent);
    }

    public void remove(int index) {
        this.indices.remove(index);
        this.start.remove(index);
        this.end.remove(index);
        this.people.remove(index);
        this.cost.remove(index);
    }

    public void push() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        for (int i = 0; i < indices.size(); ++i) {
            if (exist(indices.get(i))) {
                throw new Exception("You may not record two visits for one reservation.");
            }
            ResultSet result = stmt.executeQuery("SELECT * FROM reservation r, visit v WHERE " +
                "r.rid = " + indices.get(i) + " and " +
                "r.user_name = '" + username + "' and " +
                "v.user_name = '" + username + "'" +
                " AND (" +
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
                "))");
            if (result.next()) {
                throw new Exception("You may only record the visit during the time period of one reservation.");
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

            query = "SELECT uid FROM reservation r WHERE r.rid = " + indices.get(i);
            rs = stmt.executeQuery(query);
            rs.next();
            int currentUid = rs.getInt(1);

            query = "SELECT visit_count FROM TH th WHERE th.uid = " + currentUid;
            rs = stmt.executeQuery(query);
            rs.next();
            int newCount = rs.getInt(1) + 1;

            statement = "UPDATE TH SET visit_count = " + newCount + " WHERE uid = " + currentUid;
            stmt.execute(statement);
        }
        connector.close();
    }

    public static boolean exist(int id) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM visit WHERE rid = " + id);
        boolean response = result.next();
        connector.close();
        return response;
    }

    public static List<List<String>> get(String username) throws Exception {
        return Utility.query("SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, v.start_date, v.end_date, v.num_person, v.total_spent FROM visit v, TH h, reservation r WHERE v.rid = r.rid AND h.uid = r.uid AND v.user_name = r.user_name AND v.user_name = \"" + username + "\"");
    }
}
