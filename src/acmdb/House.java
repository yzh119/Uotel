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
        return Utility.query(
            "SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, h.year_built, a.start_date, a.end_date, h.price, h.visit_count " +
            "FROM TH h, available a " +
            "WHERE h.uid = a.uid"
        );
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

    public static List<List<String>> get(String username) throws Exception {
        return Utility.query(
            "SELECT h.uid, h.name, h.address, h.url, h.phone_number, h.year_built, h.price, h.visit_count " +
            "FROM TH h " +
            "WHERE h.owner = '" + username + "'"
        );
    }
}
