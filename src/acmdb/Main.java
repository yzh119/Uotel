package acmdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

public class Main {
    public enum State{
        atRegister,
        atLogout,
        atLogin,
        atTwoDegreesOfSeperation,
        atReservation,
        atRecommendation,
        atTemporaryHousing,
        atVisit,
        atFavorite,
    };

    public static State currentState;
    public static String username;
    public static int currentTHUid;
    public static Reserve reserve;
    public static Visit visit;
    public static int uid;

    public static String formatChart(List<List<String>> raw) {
        StringBuffer resultStr = new StringBuffer();
        for (int i = 0; i < raw.size(); ++i) {
            for (int j = 0; j < raw.get(i).size(); ++j) {
                resultStr.append(raw.get(i).get(j) + "\t");
            }
            resultStr.append("\n");
        }
        return resultStr.toString();
    }

    public static String getWelcomeMessage() throws Exception {
        StringBuffer resultStr = new StringBuffer();
        switch (currentState) {
            case atRegister:
                resultStr.append("Please enter the username you would like to use \n");
                break;
            case atLogout:
                resultStr.append("Welcome to Uotel System, \n\n");
                resultStr.append("In case you don't have an account, please register first with the format below:\n");
                resultStr.append("\tUsername | Password | Real Name | Home address | Mobile Phone\n");
                resultStr.append("In case you have an account, please login with the format below: \n");
                resultStr.append("\tUsername | Password\n");
                resultStr.append("You could use EOF or 'exit' to exit at any time.\n");
                break;
            case atLogin:
                resultStr.append("Welcome to Uotel System, " + username + "\n\n");
                resultStr.append("Please input your choice:\n");
                resultStr.append("\t1:\tReserve.\n");
                resultStr.append("\t2:\tNew TH.\n");
                resultStr.append("\t3:\tStays.\n");
                resultStr.append("\t4:\tFavorite recordings.\n");
                resultStr.append("\t5:\tTH suggestions.\n");
                resultStr.append("\t6:\tTwo degrees of seperation.\n");
                resultStr.append("\t7:\tLogout\n");
                break;
            case atReservation:
                if (reserve == null)
                    reserve = new Reserve(username);

                resultStr.append("Functionality 2 | Reserve\n\n");
                resultStr.append("After registration, a user can record a reservation to any TH (the same user may reserve the same TH multiple times from different available dates). Each user session (meaning each time after a user has logged into the system) may add one or more researvations, and all reservations added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database.\n\n");
                resultStr.append("All your reservations\n");
                resultStr.append(formatChart(Database.getReservations(username)) + "\n");
                resultStr.append("All possible houses and their available dates\n");
                resultStr.append(formatChart(Database.getHouses()) + "\n");
                resultStr.append("Your stacked reservation list\n");
                for (int i = 0; i < reserve.selectTH.size(); ++i) {
                    resultStr.append(reserve.selectTH.get(i) + "\t");
                    resultStr.append(reserve.startDate.get(i) + "\t");
                    resultStr.append(reserve.endDate.get(i) + "\n");
                }
                resultStr.append("\nTo reserve a new house, fill the chart with format below: \n");
                resultStr.append("\t UID | Start date(yyyy-mm-dd) | End date(yyyy-mm-dd)\n");
                resultStr.append("Type in 'confirm' to confirm your reservation.\n");
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
            case atVisit:
                if (visit == null)
                    visit = new Visit(username);
                resultStr.append("Functionality 4 | Stays\n\n");
                resultStr.append("A user can record a stay at any TH (the same user may stay at the same TH multiple times). Each user session (meaning each time after a user has logged into the system) may add one or more stays, and all stays added by a user in a user session are reported to him/her for the ﬁnal review and conﬁrmation, before they are added into the database. Note that a user may only record a stay at a TH during a period he/she has a reservation.\n\n");
                resultStr.append("All your visits\n");
                resultStr.append(formatChart(Database.getVisits(username)) + "\n");
                resultStr.append("All your reservations\n");
                resultStr.append(formatChart(Database.getReservations(username)) + "\n");
                resultStr.append("Your stacked visit list\n");
                for (int i = 0; i < visit.selectRID.size(); ++i) {
                    resultStr.append(visit.selectRID.get(i) + "\t");
                    resultStr.append(visit.startDate.get(i) + "\t");
                    resultStr.append(visit.endDate.get(i) + "\t");
                    resultStr.append(visit.spent.get(i) + "\t");
                    resultStr.append(visit.number.get(i) + "\n");
                }
                resultStr.append("\nTo record a new stay, fill the chart with the format below:\n");
                resultStr.append("\t RID | Start date(yyyy-mm-dd) | End date(yyyy-mm-dd) | Total spent | Number of people\n");
                resultStr.append("Type in 'confirm' to confirm your visit.\n");
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
            case atRecommendation:
                resultStr.append("Functionality 11 | TH suggestions\n\n");
                resultStr.append("Like most e-commerce websites, when a user records his/her reservations to a TH ‘A’, your system should give a list of other suggested THs. TH ‘B’ is suggested, if there exist a user ‘X’ that visited both ‘A’ and ‘B’. The suggested THs should be sorted on decreasing total visit count (i.e., most popular ﬁrst); count only visits by users like ‘X’.\n");
                resultStr.append(formatChart(Database.getRecommendations(username)));
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
            case atTemporaryHousing:
                resultStr.append("Functionality 3 | New TH\n\n");
                resultStr.append("A user may record the details of a new TH, and may update the information regarding an existing TH he/she owns.\n");
                resultStr.append("To add a new TH, fill the chart with the format below to continue:\n");
                resultStr.append("\t Name | Address | Website | Telephone | Year built | Price \n");
                resultStr.append("To add an available period to current TH, fill the chart with the format below to continue:\n");
                resultStr.append("\t start_date(yyyy-mm-dd) | end_date(yyyy-mm-dd) \n");
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
            case atTwoDegreesOfSeperation:
                resultStr.append("Functionality 12 | Two degrees of separation\n\n");
                resultStr.append("Given two user names (logins), determine their ‘degree of separation’, deﬁned as follows: Two users ‘A’ and ‘B’ are 1-degree away if they have both favorited at least one common TH; they are 2-degrees away if there exists an user ‘C’ who is 1-degree away from each of ‘A’ and ‘B’, AND ‘A’ and ‘B’ are not 1-degree away at the same time.\n");
                resultStr.append("To compute distance between two users, fill in the chart with the format below:\n");
                resultStr.append("\t Username 1 | Username 2\n");
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
            case atFavorite:
                resultStr.append("Functionality 5 | Favorite recordings\n\n");
                resultStr.append("Users can declare a TH as his/her favorite place to stay.\n");
                resultStr.append("All your visits\n");
                resultStr.append(formatChart(Database.getVisits(username)) + "\n");
                resultStr.append("All your favorites\n");
                resultStr.append(formatChart(Database.getFavorites(username)) + "\n");
                resultStr.append("Input UID of your favorite TH:\n");
                resultStr.append("Type in 'back' to return to homepage.\n");
                break;
        }
        return resultStr.toString();
    }

    public static void main(String[] args) throws IOException {
        currentState = State.atLogout;
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(isr);
        String line = "";
        while (true) {
            try {
                System.out.println(getWelcomeMessage());
            } catch (Exception e) {
                System.out.println("Fuck!");
            }
            if ((line = br.readLine()) == null || line.equals("exit")) break;
            process(line);
        }
        br.close();
    }

    private static void process(String line) {
        try {
            String [] tokens = line.split("\\|");
            for (int i = 0; i < tokens.length; ++i) {
                tokens[i] = tokens[i].trim();
            }

            switch (currentState) {
                case atLogout:
                    username = tokens[0];
                    if (tokens.length == 2) {
                        if (Database.checkPassword(username, tokens[1])) {
                            currentState = State.atLogin;
                        } else {
                            System.out.println("Wrong password!");
                        }
                    } else {
                        Database.createAccount(username, tokens[1], tokens[2], tokens[3], tokens[4]);
                        currentState = State.atLogin;
                    }
                    break;
                case atLogin:
                    int choice = Integer.valueOf(tokens[0]);
                    switch (choice) {
                        case 1: currentState = State.atReservation; break;
                        case 2: currentState = State.atTemporaryHousing; break;
                        case 3: currentState = State.atVisit; break;
                        case 4: currentState = State.atFavorite; break;
                        case 5: currentState = State.atRecommendation; break;
                        case 6: currentState = State.atTwoDegreesOfSeperation; break;
                        case 7:
                            username = "";
                            currentState = State.atLogout;
                            break;
                    }
                    break;
                case atReservation:

                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    } else if (tokens[0].equals("confirm")) {
                        reserve.pushList();
                        reserve = null;
                    } else {
                        reserve.addToList(Integer.valueOf(tokens[0]), tokens[1], tokens[2]);
                    }
                    break;
                case atVisit:

                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    } else if (tokens[0].equals("confirm")) {
                        visit.pushList();
                        visit = null;
                    } else {
                        visit.addToList(Integer.valueOf(tokens[0]), tokens[1], tokens[2], Integer.valueOf(tokens[3]), Integer.valueOf(tokens[4]));
                    }
                    break;
                case atRecommendation:
                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    }
                    break;
                case atTemporaryHousing:
                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    } else if (tokens.length == 6){
                        House.uid++;
                        currentTHUid = House.uid;
                        House.createHouse(House.uid, tokens[0], username, tokens[1], tokens[2], tokens[3], tokens[4], tokens[5]);
                    } else {
                        Available.addAvailable(currentTHUid, tokens[0], tokens[1]);
                    }
                    break;
                case atFavorite:
                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    } else {
                        Database.addFavorite(username, Integer.valueOf(tokens[0]));
                    }
                    break;
                case atTwoDegreesOfSeperation:
                    if (tokens[0].equals("back")) {
                        currentState = State.atLogin;
                    } else {
                        int dis = Database.computeDistance(tokens[0], tokens[1]);
                        if (dis > 0 )
                            System.out.println("The distance between these two users is " + dis + "\n");
                        else
                            System.out.println("The distance between these two users is greater than 3\n");
                    }
                    break;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
