package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;

public class House {
    public static int getInitUidFromSQL() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        String query;
        ResultSet rs = null;
        query = "SELECT MAX(th.uid) FROM TH th";
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int ret = 0;
        if (rs.next()) {
            ret = rs.getInt(1);
        }
        connector.close();
        return ret;
    }

    public static int uid;

    static {
        try {
            uid = getInitUidFromSQL();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void createHouse(int uid, String name, String owner, String address, String url, String telephone, String yearBuilt, String price) throws Exception{
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO TH values(" + uid + ",'" + owner + "','" + name + "','" + address + "','" + url + "','" + telephone + "'," + yearBuilt + "," + price + ",0)");
        connector.close();
    }
}
