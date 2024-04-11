package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Friendship;
import ensamc.mbdio.tp2_jee.model.FriendshipState;
import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FriendshipDAO {
    private DataSource dataSource;

    public FriendshipDAO(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public boolean addFriendship(User sender, User receiver) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "INSERT INTO Friendship (id_sender, id_receiver, state) VALUES (?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, sender.getId());
            statement.setInt(2, receiver.getId());
            statement.setString(3, FriendshipState.PENDING.name());
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
        }
    }

    public List<User> getFriends(int userId) {
        List<User> friends = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String sql = "SELECT u.* " +
                "FROM User u " +
                "INNER JOIN Friendship f ON (u.id = f.id_sender OR u.id = f.id_receiver) " +
                "WHERE (f.id_sender = ? OR f.id_receiver = ?) AND f.state = 'APPROVED'";

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, userId);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int friendId = resultSet.getInt("id");
                if (friendId == userId) continue; // Skip the current user (friendship with oneself is not allowed
                String profilePicture = resultSet.getString("profile_picture");
                String lastName = resultSet.getString("last_name");
                String firstName = resultSet.getString("first_name");
                String email = resultSet.getString("email");
                String birthDate = resultSet.getString("birth_date");
                String phone = resultSet.getString("phone");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String aboutMe = resultSet.getString("about_me");
                String otherName = resultSet.getString("other_name");
                String favoriteQuote = resultSet.getString("favorite_quote");
                // Instantiate User object
                User friend = new User();
                friend.setId(friendId);
                friend.setProfilePicture(profilePicture);
                friend.setLastName(lastName);
                friend.setFirstName(firstName);
                friend.setEmail(email);
                friend.setBirthDate(birthDate);
                friend.setPhone(phone);
                friend.setGender(gender);
                friend.setAddress(address);
                friend.setAboutMe(aboutMe);
                friend.setOtherName(otherName);
                friend.setFavoriteQuote(favoriteQuote);

                friends.add(friend);
            }


        } catch (
                SQLException e) {
            e.printStackTrace(); // Handle or log the exception properly
        } finally {
            close(connection, statement, resultSet);
        }

        return friends;
    }

    public boolean acceptFriendship(User sender, User receiver) {
        return updateFriendshipState(sender, receiver, FriendshipState.APPROVED);
    }

    public boolean denyFriendship(User sender, User receiver) {
        return updateFriendshipState(sender, receiver, FriendshipState.DENIED);
    }

    public boolean removeFriendship(User sender, User receiver) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "DELETE FROM Friendship " +
                    "WHERE (id_sender = ? AND id_receiver = ?)" +
                    "OR (id_sender = ? AND id_receiver = ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, sender.getId());
            statement.setInt(2, receiver.getId());
            statement.setInt(3, receiver.getId());
            statement.setInt(4, sender.getId());
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
        }
    }

    private boolean updateFriendshipState(User sender, User receiver, FriendshipState state) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "UPDATE Friendship SET state = ? " +
                    "WHERE (id_sender = ? AND id_receiver = ?) " +
                    "OR (id_sender = ? AND id_receiver = ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, state.name());
            statement.setInt(2, sender.getId());
            statement.setInt(3, receiver.getId());
            statement.setInt(4, receiver.getId());
            statement.setInt(5, sender.getId());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
        }
    }

    public List<Friendship> getFriendships(User currentUser) {
        List<Friendship> friendships = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        UserDAO userDAO = new UserDAO(dataSource);

        String sql = "SELECT * FROM " +
                "Friendship f where " +
                " f.id_receiver=? " +
                "and f.state='PENDING'; ";

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(sql);

            statement.setInt(1, currentUser.getId());

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int idReceiver = resultSet.getInt("id_sender");
                String state = resultSet.getString("state");

                Friendship friendship = new Friendship();
                friendship.setSender(userDAO.getUser(idReceiver));
                friendship.setReceiver(currentUser);
                friendship.setState(FriendshipState.valueOf(state));

                friendships.add(friendship);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(connection, statement, resultSet);
        }
        return friendships;
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
