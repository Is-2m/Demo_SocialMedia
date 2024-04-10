package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            close(myConn, myStmt, myRs);
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

            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            close(myConn, myStmt, myRs);
        }
    }

    public User createUser(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // get db connection
            connection = dataSource.getConnection();
            // create sql for insert
            String sql = "insert into User "
                    + "(first_name, last_name, email, pass)"
                    + "values (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // set the param values for the student
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            // execute sql insert
            statement.execute();
            // get the generated id
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                user.setId(generatedKeys.getInt(1));
            } else {
                throw new Exception("Creating user failed, no ID obtained.");
            }

            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }
    }

    public void updateUser(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // get db connection
            connection = dataSource.getConnection();
            // create sql for update
            String sql = "update User "
                    + "set profile_picture=?,first_name=?, last_name=?, email=?, pass=?, phone=?," +
                    "address=?, birth_date=?, gender=?, about_me=?, other_name=?, favorite_quote=? "
                    + "where id=?";
            statement = connection.prepareStatement(sql);
            // set the param values for the student
            statement.setString(1, user.getProfilePicture());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPassword());
            statement.setString(6, user.getPhone());
            statement.setString(7, user.getAddress()); // Assuming a getAddress() method in User class
            statement.setString(8, user.getBirthDate()); // Assuming getBirthDate() returns a LocalDate object
            statement.setString(9, user.getGender());
            statement.setString(10, user.getAboutMe());
            statement.setString(11, user.getOtherName());
            statement.setString(12, user.getFavoriteQuote());
            statement.setInt(13, user.getId()); // Assuming your User class has a getIdUser() method

            // execute sql insert
            statement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }
    }


    public void updatePassword(User user) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            // get db connection
            connection = dataSource.getConnection();
            // create sql for insert
            String sql = "update User "
                    + "set pass=? "
                    + "where id=?";
            statement = connection.prepareStatement(sql);
            // set the param values for the student
            statement.setString(1, user.getPassword());
            statement.setInt(2, user.getId());
            // execute sql insert
            statement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }
    }

    public List<User> searchUsers(String searchTerm) {
        List<User> searchResults = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = dataSource.getConnection();
            String sql = "SELECT * FROM User WHERE last_name LIKE ? OR first_name LIKE ? OR other_name LIKE ?";
            statement = connection.prepareStatement(sql);
            String likeTerm = "%" + searchTerm + "%";
            statement.setString(1, likeTerm);
            statement.setString(2, likeTerm);
            statement.setString(3, likeTerm);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                // Populate User object from result set
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setLastName(resultSet.getString("last_name"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setOtherName(resultSet.getString("other_name"));
                // Populate other attributes as needed
                searchResults.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }

        return searchResults;
    }

    private void close(Connection connection, Statement statement, ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}