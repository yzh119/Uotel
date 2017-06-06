package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class House {
    public static void createHouse(int uid, String name, String owner, String address, String url, String telephone, String yearBuilt, String price) throws Exception{
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO TH VALUES (" + uid + ",'" + owner + "','" + name + "','" + address + "','" + url + "','" + telephone + "'," + yearBuilt + "," + price + ",0)");
    }

    public static void update(int id, String name, String owner, String address, String website, String phone, String year, String rental) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute(
            "UPDATE TH SET " +
            "name = \"" + name + "\", " +
            "owner = \"" + owner + "\", " +
            "address = \"" + address + "\", " +
            "url = \"" + website + "\", " +
            "phone_number = \"" + phone + "\", " +
            "year_built = \"" + year + "\", " +
            "price = \"" + rental + "\" " +
            "WHERE uid = " + String.valueOf(id)
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
}
