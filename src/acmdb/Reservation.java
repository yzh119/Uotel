package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
        ResultSet result = statement.executeQuery("SELECT MAX(rs.rid) FROM reservation rs WHERE rs.user_name = '" + username + "'");
        this.id = result.next() ? result.getInt(1) : 0;
    }

    public void add(int uid, String start, String end) {
        this.indices.add(uid);
        this.start.add(start);
        this.end.add(end);
    }

    public void push() throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;

        ++id;

        for (int i = 0; i < indices.size(); ++i) {
            ResultSet rs = statement.executeQuery("SELECT * FROM available a WHERE a.uid = " +
                indices.get(i) + " AND a.start_date<=\"" +
                start.get(i) + "\" AND a.end_date>= \"" +
                end.get(i) + "\"");
            if (!rs.next()) {
                throw new Exception("Reservation conflict!");
            }
        }

        for (int i = 0; i < indices.size(); ++i) {
            ResultSet rs = statement.executeQuery("SELECT * FROM available a WHERE a.uid = " +
                indices.get(i) + " AND a.start_date <= '" +
                start.get(i) + "' AND a.end_date >= '" +
                end.get(i) + "'");
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
}
