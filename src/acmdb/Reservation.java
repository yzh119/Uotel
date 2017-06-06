package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Reservation {
    public String username;
    public List<Integer> indices = new ArrayList<>();
    public List<String> start = new ArrayList<>();
    public List<String> end = new ArrayList<>();

    public Reservation(String username) throws Exception {
        this.username = username;
    }

    public void add(int id, String start, String end) {
        this.indices.add(id);
        this.start.add(start);
        this.end.add(end);
    }

    public void remove(int index) {
        this.indices.remove(index);
        this.start.remove(index);
        this.end.remove(index);
    }

    public void push() throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        for (int i = 0; i < indices.size(); ++i) {
            ResultSet result = statement.executeQuery(
                "SELECT * FROM available a WHERE " +
                "a.uid = " + indices.get(i) + " AND " +
                "a.start_date <= '" + start.get(i) + "' AND " +
                "a.end_date >= '" + end.get(i) + "'"
            );
            if (!result.next()) {
                throw new Exception("Reservation conflict!");
            }
        }
        for (int i = 0; i < indices.size(); ++i) {
            ResultSet rs = statement.executeQuery(
                "SELECT * FROM available a WHERE a.uid = " +
                indices.get(i) + " AND a.start_date <= '" +
                start.get(i) + "' AND a.end_date >= '" +
                end.get(i) + "'"
            );
            rs.next();
            String t1 = Utility.yesterday(start.get(i)), t2 = Utility.tomorrow(end.get(i));
            String start = rs.getString("start_date");
            String end = rs.getString("end_date");
            Available.remove(indices.get(i), start, end);
            if (start.compareTo(t1) < 0) {
                Available.add(indices.get(i), start, t1);
            }
            if (t2.compareTo(end.substring(0, 10)) < 0) {
                Available.add(indices.get(i), t2, end);
            }
            ResultSet result = statement.executeQuery("SELECT MAX(r.rid) FROM reservation r");
            int id = result.next() ? result.getInt(1) + 1 : 1;
            statement.execute(
                "INSERT INTO reservation values(" +
                id + "," +
                indices.get(i) + "," +
                "'" + username + "'" + "," +
                "'" + this.start.get(i) + "'" + "," +
                "'" + this.end.get(i) + "'" +
                ")"
            );
        }
        connector.close();
    }

    public static List<List<String>> get(String username) throws Exception{
        return Utility.query(
            "SELECT r.rid, h.name, h.owner, h.address, h.url, h.phone_number, r.start_date, r.end_date " +
            "FROM reservation r, TH h " +
            "WHERE r.uid = h.uid " +
                "AND r.user_name = '" + username + "' " +
                "AND r.rid NOT IN (SELECT rid user_name FROM visit)"
        );
    }

    public static Map<String, String> get(int id) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery(
            "SELECT * " +
                "FROM reservation r, TH h " +
                "WHERE r.uid = h.uid " +
                    "AND r.rid = " + id + " " +
                    "AND r.rid NOT IN (SELECT rid FROM visit)"
        );
        ResultSetMetaData meta = result.getMetaData();
        if (!result.next()) {
            throw new Exception("The reservation does not exist!");
        }
        Map<String, String> record = new HashMap<>();
        for (int i = 1; i <= meta.getColumnCount(); ++i) {
            record.put(meta.getColumnName(i), result.getString(i));
        }
        return record;
    }
}
