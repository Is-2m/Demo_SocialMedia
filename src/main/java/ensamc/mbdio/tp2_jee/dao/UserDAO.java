package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class UserDAO {
    private DataSource dataSource;
    private FriendshipDAO friendshipDAO;

    public UserDAO(DataSource theDataSource) {
        dataSource = theDataSource;
        friendshipDAO = new FriendshipDAO(dataSource);
    }

    public User getUser(String email, String password) {
        User user = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        try {
            // get a connection
            myConn = dataSource.getConnection();
            // create sql statement
            String sql = "select * from User where email=? and pass=?";
            myStmt = myConn.prepareStatement(sql);
            // set params
            myStmt.setString(1, email);
            myStmt.setString(2, password);
            // execute statement
            myRs = myStmt.executeQuery();
            // retrieve data from result set row
            if (myRs.next()) {
                int id = myRs.getInt("id");
                String profilePicture = myRs.getString("profile_picture");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                String login = myRs.getString("email");
                String pass = myRs.getString("pass");
                String phone = myRs.getString("phone");
                String address = myRs.getString("address");
                String birthDate = myRs.getString("birth_date");
                String gender = myRs.getString("gender");
                String aboutMe = myRs.getString("about_me");
                String otherName = myRs.getString("other_name");
                String favoriteQuote = myRs.getString("favorite_quote");
                List<User> friends = friendshipDAO.getFriends(id);

                user = new User(id, firstName, lastName, login, pass, phone, address, birthDate,
                        gender, aboutMe, otherName, favoriteQuote, friends, profilePicture);
            }
            myConn.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User getUser(int userID) {
        User user = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        try {
            // get a connection
            myConn = dataSource.getConnection();
            // create sql statement
            String sql = "select * from User where id=?";
            myStmt = myConn.prepareStatement(sql);
            // set params
            myStmt.setInt(1, userID);
            // execute statement
            myRs = myStmt.executeQuery();
            // retrieve data from result set row
            if (myRs.next()) {
                int id = myRs.getInt("id");
                String profilePicture = myRs.getString("profile_picture");
                String firstName = myRs.getString("first_name");
                String lastName = myRs.getString("last_name");
                String login = myRs.getString("email");
                String pass = myRs.getString("pass");
                String phone = myRs.getString("phone");
                String address = myRs.getString("address");
                String birthDate = myRs.getString("birth_date");
                String gender = myRs.getString("gender");
                String aboutMe = myRs.getString("about_me");
                String otherName = myRs.getString("other_name");
                String favoriteQuote = myRs.getString("favorite_quote");
                List<User> friends = friendshipDAO.getFriends(userID);

                user = new User(id, firstName, lastName, login, pass, phone, address, birthDate,
                        gender, aboutMe, otherName, favoriteQuote, friends, profilePicture);
            }
            myConn.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User createUser(User user) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            // get db connection
            myConn = dataSource.getConnection();
            // create sql for insert
            String sql = "insert into User "
                    + "(first_name, last_name, email, pass)"
                    + "values (?, ?, ?, ?)";
            myStmt = myConn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // set the param values for the student
            myStmt.setString(1, user.getFirstName());
            myStmt.setString(2, user.getLastName());
            myStmt.setString(3, user.getEmail());
            myStmt.setString(4, user.getPassword());
            // execute sql insert
            myStmt.execute();
            // get the generated id
            ResultSet generatedKeys = myStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                user.setId(generatedKeys.getInt(1));
            } else {
                throw new Exception("Creating user failed, no ID obtained.");
            }
            myConn.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateUser(User user) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            // get db connection
            myConn = dataSource.getConnection();
            // create sql for update
            String sql = "update User "
                    + "set profile_picture=?,first_name=?, last_name=?, email=?, pass=?, phone=?," +
                    "address=?, birth_date=?, gender=?, about_me=?, other_name=?, favorite_quote=? "
                    + "where id=?";
            myStmt = myConn.prepareStatement(sql);
            // set the param values for the student
            myStmt.setString(1, user.getProfilePicture());
            myStmt.setString(2, user.getFirstName());
            myStmt.setString(3, user.getLastName());
            myStmt.setString(4, user.getEmail());
            myStmt.setString(5, user.getPassword());
            myStmt.setString(6, user.getPhone());
            myStmt.setString(7, user.getAddress()); // Assuming a getAddress() method in User class
            myStmt.setString(8, user.getBirthDate()); // Assuming getBirthDate() returns a LocalDate object
            myStmt.setString(9, user.getGender());
            myStmt.setString(10, user.getAboutMe());
            myStmt.setString(11, user.getOtherName());
            myStmt.setString(12, user.getFavoriteQuote());
            myStmt.setInt(13, user.getId()); // Assuming your User class has a getIdUser() method

            // execute sql insert
            myStmt.execute();
            myConn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void updatePassword(User user) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            // get db connection
            myConn = dataSource.getConnection();
            // create sql for insert
            String sql = "update User "
                    + "set pass=? "
                    + "where id=?";
            myStmt = myConn.prepareStatement(sql);
            // set the param values for the student
            myStmt.setString(1, user.getPassword());
            myStmt.setInt(2, user.getId());
            // execute sql insert
            myStmt.execute();
            myConn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}