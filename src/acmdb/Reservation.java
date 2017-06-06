package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Reservation {
    public int id;
    public String username;
    public List<Integer> indices = new ArrayList<>();
    public List<String> start = new ArrayList<>();
    public List<String> end = new ArrayList<>();

    public Reservation(String username) throws Exception {
        this.username = username;
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT MAX(r.rid) FROM reservation r WHERE r.user_name = '" + username + "'");
        this.id = result.next() ? result.getInt(1) : 0;
    }

    public void add(int id, String start, String end) {
        this.indices.add(id);
        this.start.add(start);
        this.end.add(end);
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

        ++id;
        for (int i = 0; i < indices.size(); ++i) {
            ResultSet rs = statement.executeQuery("SELECT * FROM available a WHERE a.uid = " +
                indices.get(i) + " AND a.start_date <= '" +
                start.get(i) + "' AND a.end_date >= '" +
                end.get(i) + "'");
            rs.next();
            String t1 = Utility.yesterday(start.get(i)), t2 = Utility.tomorrow(end.get(i));
            String start = rs.getString("start_date");
            String end = rs.getString("end_date");
            House.removeAvailable(indices.get(i), start, end);
            if (start.compareTo(t1) < 0) {
                House.addAvailable(indices.get(i), start, t1);
            }
            if (t2.compareTo(end.substring(0, 10)) < 0) {
                House.addAvailable(indices.get(i), t2, end);
            }
            statement.execute("INSERT INTO reservation values(" +
                id + "," +
                indices.get(i) + "," +
                "'" + username + "'" + "," +
                "'" + this.start.get(i) + "'" + "," +
                "'" + this.end.get(i) + "'" +
                ")");
            ++id;
        }
        connector.close();
    }

    public static Map<String, String> get(int id) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM reservation r, TH h WHERE r.uid = h.uid AND r.rid = " + id);
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
