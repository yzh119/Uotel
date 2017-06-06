package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class House {
    public static int add(String name, String owner, String address, String website, String phone, String year, String rental) throws Exception{
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT MAX(h.uid) FROM TH h");
        int id = result.next() ? result.getInt(1) + 1 : 1;
        statement.execute("INSERT INTO TH VALUES (" + id + ",'" + owner + "','" + name + "','" + address + "','" + website + "','" + phone + "'," + year + "," + rental + ",0)");
        connector.close();
        return id;
    }

    public static void update(int id, String name, String owner, String address, String website, String phone, String year, String rental) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute(
            "UPDATE TH SET " +
            "name = '" + name + "', " +
            "owner = '" + owner + "', " +
            "address = '" + address + "', " +
            "url = '" + website + "', " +
            "phone_number = '" + phone + "', " +
            "year_built = '" + year + "', " +
            "price = '" + rental + "' " +
            "WHERE uid = " + String.valueOf(id)
        );
    }

    public static List<List<String>> get() throws Exception {
        return Utility.query("SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, h.year_built, a.start_date, a.end_date, h.price, h.visit_count FROM TH h, available a WHERE h.uid = a.uid");
    }

    public static Map<String, String> get(int id) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM TH t WHERE t.uid = " + id);
        ResultSetMetaData meta = result.getMetaData();
        if (!result.next()) {
            throw new Exception("The house does not exist!");
        }
        Map<String, String> record = new HashMap<>();
        for (int i = 1; i <= meta.getColumnCount(); ++i) {
            record.put(meta.getColumnName(i), result.getString(i));
        }
        return record;
    }

    public static void addAvailable(int uid, String start, String end) throws Exception {
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

    public static void removeAvailable(int id, String start, String end) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("DELETE a FROM available a WHERE a.uid = " + id + " AND a.start_date='" + start.substring(0, 10) + "' AND a.end_date='" + end.substring(0, 10) + "'");
        connector.close();
    }

    public static List<List<String>> getAvailable(int id) throws Exception {
        return Utility.query("SELECT h.name, h.address, a.start_date, a.end_date FROM available a, TH h WHERE a.uid = h.uid");
    }
}
