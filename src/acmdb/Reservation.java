package acmdb;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class Reservation {
    public static int rid = 0;
    public String username;
    public Reservation(String username) {
        this.username = username;
    }
    public ArrayList<Integer> selectTH = new ArrayList<>();
    public ArrayList<String> startDate = new ArrayList<>();
    public ArrayList<String> endDate = new ArrayList<>();

    public void resetRidFromSQL(Statement stmt) throws Exception {
        String query;
        ResultSet rs;
        query = "SELECT MAX(rs.rid) FROM reservation rs WHERE " +
            "rs.user_name = \"" + username + "\"";
        ;

        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }

        if (rs.next()) {
            rid = rs.getInt(1);
        }
    }
    public void addToList(int uid, String start, String end) {
        selectTH.add(uid);
        startDate.add(start);
        endDate.add(end);
    }

    public String yesterday(String today) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date td = df.parse(today);
        Calendar cal = Calendar.getInstance();
        cal.setTime(td);
        cal.add(Calendar.DATE, -1);
        Date yesterday = cal.getTime();
        return df.format(yesterday);
    }

    public String tomorrow(String today) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date td = df.parse(today);
        Calendar cal = Calendar.getInstance();
        cal.setTime(td);
        cal.add(Calendar.DATE, +1);
        Date yesterday = cal.getTime();
        return df.format(yesterday);
    }

    public void pushList() throws Exception {
        Connector connector = new Connector();
        Statement stmt = connector.statement;
        resetRidFromSQL(stmt);

        ++rid;

        for (int i = 0; i < selectTH.size(); ++i) {
            String query;
            query = "SELECT * FROM available a WHERE a.uid = " +
                    selectTH.get(i) + " and a.start_date<=\"" +
                    startDate.get(i) + "\" and a.end_date>= \"" +
                    endDate.get(i) + "\"";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.next()) {
                throw new Exception("Reservation conflict!");
            }
        }

        for (int i = 0; i < selectTH.size(); ++i) {
            String query;
            query = "SELECT * FROM available a WHERE a.uid = " +
                    selectTH.get(i) + " and a.start_date<=\"" +
                    startDate.get(i) + "\" and a.end_date>= \"" +
                    endDate.get(i) + "\"";
            ResultSet rs = stmt.executeQuery(query);
            rs.next();
            String t1 = yesterday(startDate.get(i)), t2 = tomorrow(endDate.get(i));
            String start = rs.getString("start_date"),
                    end = rs.getString("end_date");
            Available.removeAvailable(selectTH.get(i), start, end);
            if (start.compareTo(t1) < 0) Available.addAvailable(selectTH.get(i), start, t1);
            if (t2.compareTo(end.substring(0, 10)) < 0) Available.addAvailable(selectTH.get(i), t2, end);

            String statement;
            statement = "INSERT INTO reservation values(" +
                    rid + "," +
                    selectTH.get(i) + "," +
                    "'" + username + "'" + "," +
                    "'" + startDate.get(i) + "'" + "," +
                    "'" + endDate.get(i) + "'" +
                    ")";
            stmt.execute(statement);
            ++rid;
        }

        connector.close();
    }


}
