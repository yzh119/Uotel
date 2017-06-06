package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class Available {
    public static void add(int uid, String start, String end) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM period p WHERE p.start_date='" + start + "' and " + "p.end_date='" + end + "'");
        if (!result.next()) {
            statement.execute("INSERT INTO period values('" + start + "','" + end + "')");
        }
        result = statement.executeQuery("SELECT * FROM available a " +
            "WHERE  a.uid = " + uid +
            " AND    ((a.start_date <= '" + start + "' and a.end_date >= '" + start + "')" +
            " OR     (a.start_date <= '" + end + "' and a.end_date >= '" + end + "'))");
        if (result.next()) {
            throw new Exception("Overlay period!");
        }
        statement.execute("INSERT INTO available values(" + uid + ",'" + start + "','" + end + "')");
        connector.close();
    }

    public static void remove(int id, String start, String end) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("DELETE a FROM available a WHERE a.uid = " + id + " AND a.start_date='" + start.substring(0, 10) + "' AND a.end_date='" + end.substring(0, 10) + "'");
        connector.close();
    }

    public static List<List<String>> get(int id) throws Exception {
        return Utility.query("SELECT h.name, h.address, a.start_date, a.end_date FROM available a, TH h WHERE a.uid = h.uid AND a.uid = " + id);
    }
}
