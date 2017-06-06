package acmdb;

import java.util.List;

public class Suggestion {
    public static List<List<String>> get(String username) throws Exception {
        return Utility.query(
            "SELECT * FROM ( " +
            "SELECT new_th.*, count(*) as like_cnt FROM " +
            "user u1, user u2, " +
            "visit all2, " +
            "reservation allr2, " +
            "TH new_th " +
            "WHERE " +
            "u1.login_name = '" + username + "' and u1.login_name <> u2.login_name and " +
            "exists (select * from visit v1, reservation r1, visit v2, reservation r2 where " +
            "v1.user_name = u1.login_name and v1.rid = r1.rid and v1.user_name = r1.user_name and " +
            "v2.user_name = u2.login_name and v2.rid = r2.rid and v2.user_name = r2.user_name and " +
            "r1.uid = r2.uid " +
            ") and " +
            "all2.user_name = u2.login_name and all2.rid = allr2.rid and all2.user_name = allr2.user_name and new_th.uid = allr2.uid " +
            "group by new_th.uid) as result order by result.like_cnt DESC "
        );
    }
}
