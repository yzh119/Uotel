package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Utility {
    public static List<List<String>> query(String query) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;

        ResultSet result = statement.executeQuery(query);
        ResultSetMetaData meta = result.getMetaData();

        List<List<String>> records = new ArrayList<>();
        while (result.next()) {
            records.add(new ArrayList<>());
            for (int i = 1; i <= meta.getColumnCount(); ++i) {
                String record = result.getString(i);
                if (record.endsWith("00:00:00.0")) {
                    record = record.substring(0, 10);
                }
                records.get(records.size() - 1).add(record);
            }
        }
        return records;
    }
}
