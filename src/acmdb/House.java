package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class House {
    public static int uid = 0;
    public House() throws Exception {
        Connector connector = new Connector();
        resetUidFromSQL(connector.statement);
        ++uid;
        connector.close();
    }

    public static void resetUidFromSQL(Statement stmt) throws Exception {
        String query;
        ResultSet rs;
        query = "SELECT MAX(th.uid) FROM TH th";
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            uid = rs.getInt(1);
        }
    }

    public static void createHouse(int uid, String name, String address, String url, String telephone, String yearBuilt, String price) throws Exception{
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO TH values(" + uid + ",'" + name + "','" + address + "','" + url + "','" + telephone + "'," + yearBuilt + "," + price + ",0)");
        connector.close();
    }
}
