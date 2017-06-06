package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class Favorite {
    public static void add(String username, int id) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery(
            "SELECT * FROM visit v, reservation r " +
                "WHERE v.rid = r.rid " +
                    "AND v.user_name = r.user_name " +
                    "AND v.user_name = '" + username + "' " +
                    "AND r.uid = " + id
        );
        if (!result.next()) {
            throw new Exception("You have no stay records for this house yet!");
        }
        statement.execute("INSERT INTO favorite VALUES (" + id + ",'" + username + "')");
        connector.close();
    }

    public static List<List<String>> get(String username) throws Exception {
        return Utility.query(
            "SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, h.year_built, h.price, h.visit_count " +
            "FROM TH h, favorite f " +
            "WHERE f.user_name = '" + username + "' AND f.uid = h.uid"
        );
    }
}
