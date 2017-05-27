package acmdb;

import java.sql.Statement;

/**
 * Created by zihao on 2017/5/27.
 */
public class TemporaryHousing {
    public static int uid = 0;
    public TemporaryHousing() {++uid;}
    public void addTH(int uid, String name, String address,
                        String url, String telephone,
                        String yearBuilt, String price, Statement stmt) throws Exception{

    }
    public static String getAllTHs() {
        return "hahahaha!";
    }
}
