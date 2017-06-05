package acmdb;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public enum State{
        atRegister,
        atLogout,
        atLogin,
        atTwoDegreesOfSeperation,
        atReservation,
        atRecommendation,
        atTemporaryHousing,
        atStay,
        atProfile,
    };

    public static State currentState;
    public static String username;
    public static int uid;

    public static String getWelcomeMessage() {
        StringBuffer resultStr = new StringBuffer();
        switch (currentState) {
            case atRegister:
                resultStr.append("Please enter the username you would like to use \n");
                break;
            case atLogout:
                resultStr.append("Welcome to Uotel System, \n");
                resultStr.append("Please input your username and password: \n");
                resultStr.append("Use EOF or 'exit' to exit.\n");
                break;
            case atLogin:
                resultStr.append("");
                break;
            case atReservation:
                break;
            case atStay:
                break;
            case atRecommendation:
                break;
            case atTemporaryHousing:
                break;
            case atTwoDegreesOfSeperation:
                break;
            case atProfile:
                break;

        }
        return resultStr.toString();
    }

    public static void main() throws IOException {
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(isr);
        String line = "";
        while (true) {
            System.out.println(getWelcomeMessage());
            if ((line = br.readLine()) == null || line.equals("exit")) break;
            process(line);
        }
        br.close();
    }

    private static void process(String line) {
        try {
            switch (currentState) {
                case atLogout:
                    break;
                case atLogin:
                    break;
                case atReservation:
                    break;
                case atStay:
                    break;
                case atRecommendation:
                    break;
                case atTemporaryHousing:
                    break;
                case atProfile:
                    break;
                case atTwoDegreesOfSeperation:
                    break;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
