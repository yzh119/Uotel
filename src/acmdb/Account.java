package acmdb;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Account {
    public static void add(String username, String password, String name, String address, String phone) throws Exception {
        if (exist(username)) {
            throw new Exception("Username \"" + username + "\" exists!");
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        statement.execute("INSERT INTO user values('" + name + "','" + username + "','" + password + "','" + address + "','" + phone + "')");
        connector.close();
    }

    private static boolean exist(String username) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM user WHERE login_name='" + username + "'");
        boolean response = result.next();
        connector.close();
        return response;
    }

    public static boolean checkPassword(String username, String password) throws Exception {
        if (!exist(username)) {
            return false;
        }
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT passwd FROM user WHERE login_name='" + username + "'");
        boolean response = result.next() && result.getString("passwd").equals(password);
        connector.close();
        return response;
    }

    public static void addFavorite(String username, int uid) throws Exception {
        Connector connector = new Connector();
        Statement statement = connector.statement;
        ResultSet result = statement.executeQuery("SELECT * FROM visit v, reservation r WHERE v.rid = r.rid and v.user_name = r.user_name and v.user_name = '" + username + "' and r.uid = " + uid);
        if (!result.next()) {
            throw new Exception("You have no stay records for this house yet!");
        }
        statement.execute("INSERT INTO favorite values(" + uid + ",'" + username + "')");
        connector.close();
    }

    public static List<List<String>> getHouses() throws Exception {
        return Utility.query("SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, h.year_built, a.start_date, a.end_date, h.price, h.visit_count FROM TH h, available a WHERE h.uid = a.uid");
    }

    public static List<List<String>> getHouses(String username) throws Exception {
        return Utility.query("SELECT h.uid, h.owner, h.address, h.url, h.phone_number, h.year_built, h.price, h.visit_count FROM TH h WHERE h.owner = \"" + username + "\"");
    }

    public static List<List<String>> getReservations(String username) throws Exception{
        return Utility.query("SELECT r.rid, h.name, h.owner, h.address, h.url, h.phone_number, r.start_date, r.end_date FROM reservation r, TH h WHERE r.uid = h.uid AND user_name = \"" + username + "\"");
    }

    public static List<List<String>> getVisits(String username) throws Exception {
        return Utility.query("SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, v.start_date, v.end_date, v.num_person, v.total_spent FROM visit v, TH h, reservation r WHERE v.rid = r.rid AND h.uid = r.uid AND v.user_name = r.user_name AND v.user_name = \"" + username + "\"");
    }

    public static List<List<String>> getFavorites(String username) throws Exception {
        return Utility.query("SELECT h.uid, h.name, h.owner, h.address, h.url, h.phone_number, h.year_built, h.price, h.visit_count FROM TH h, favorite f WHERE f.user_name = '" + username + "' and f.uid = h.uid");
    }

    public static List<List<String>> getRecommendations(String username) throws Exception {
        return Utility.query(
            "SELECT distinct new_th.* FROM " +
            "user u1, user u2, " +
            "visit v1, visit v2, visit all2, " +
            "reservation r1, reservation r2, reservation allr2, " +
            "TH common_th, (SELECT * FROM TH th natural join (SELECT uid, COUNT(DISTINCT user_name) AS like_cnt FROM favorite GROUP BY uid) as th_info) AS new_th " +
            "WHERE " +
            "u1.login_name = '" + username + "' and u1.login_name <> u2.login_name and " +
            "v1.user_name = u1.login_name and v1.rid = r1.rid and v1.user_name = r1.user_name and r1.uid = common_th.uid and " +
            "v2.user_name = u2.login_name and v2.rid = r2.rid and v2.user_name = r2.user_name and r2.uid = common_th.uid and " +
            "all2.user_name = u2.login_name and all2.rid = allr2.rid and all2.user_name = allr2.user_name and new_th.uid = allr2.uid " +
            "ORDER by new_th.like_cnt DESC"
        );
    }

    public static int computeDistance(String username1, String username2) throws Exception {
        if (!exist(username1)) {
            throw new Exception("Account \"" + username1 + "\" does not exist!");
        }
        if (!exist(username2)) {
            throw new Exception("Account \"" + username2 + "\" does not exist!");
        }
        if (username1.equals(username2)) {
            return 0;
        }
        String[] queries = new String[2];
        queries[0] = "SELECT * FROM " +
            "user u1, user u2, " +
            "visit s1, visit s2, " +
            "reservation r1, reservation r2 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' and u2.login_name = '" + username2 + "' and " +
            "s1.user_name = u1.login_name and s2.user_name = u2.login_name and " +
            "r1.rid = s1.rid and r1.user_name = s1.user_name and " +
            "r2.rid = s1.rid and r2.user_name = s2.user_name and " +
            "r1.uid = r2.uid";
        queries[1] = "SELECT * FROM " +
            "user u1, user u2, user u3,  " +
            "visit s1, visit s2, visit s3,  " +
            "reservation r1, reservation r2, reservation r3 " +
            "WHERE " +
            "u1.login_name = '" + username1 + "' and  " +
            "s1.user_name = u1.login_name and s3.user_name = u3.login_name and  " +
            "r1.rid = s1.rid and r1.user_name = s3.user_name and  " +
            "r3.rid = s1.rid and r3.user_name = s3.user_name and  " +
            "r1.uid = r3.uid " +
            "and " +
            "u2.login_name = '" + username2 + "' and  " +
            "s2.user_name = u2.login_name and s3.user_name = u3.login_name and  " +
            "r2.rid = s2.rid and r2.user_name = s3.user_name and  " +
            "r3.rid = s2.rid and r3.user_name = s3.user_name and  " +
            "r2.uid = r3.uid";

        int distance = -1;
        Connector connector = new Connector();
        Statement statement = connector.statement;
        for (int i = 0; i < 2; ++i) {
            ResultSet result = statement.executeQuery(queries[i]);
            if (result.next()) {
                distance = i + 1;
                break;
            }
        }
        connector.close();
        return distance;
    }

    public static String list2Table(List<List<String>> records) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < records.size(); ++i) {
            builder.append("<tr>");
            for (int j = 0; j < records.get(i).size(); ++j) {
                builder.append("<td>");
                builder.append(records.get(i).get(j));
                builder.append("</td>");
            }
            builder.append("</tr>");
        }
        return builder.toString();
    }
}