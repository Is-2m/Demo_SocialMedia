package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.FriendshipState;
import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

class FriendshipDAO {
    private DataSource dataSource;

    public FriendshipDAO(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public boolean addFriendship(User sender, User receiver) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO Friendship (id_sender, id_receiver, state) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, sender.getId());
                statement.setInt(2, receiver.getId());
                statement.setString(3, FriendshipState.PENDING.name());
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> getFriends(int userId) {
        List<User> friends = new ArrayList<>();
        String sql = "SELECT u.* " +
                "FROM User u " +
                "INNER JOIN Friendship f ON (u.id = f.id_sender OR u.id = f.id_receiver) " +
                "WHERE (f.id_sender = ? OR f.id_receiver = ?) AND f.state = 'APPROVED'";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, userId);
            statement.setInt(2, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int friendId = resultSet.getInt("id");
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
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception properly
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
        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM Friendship WHERE id_sender = ? AND id_receiver = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, sender.getId());
                statement.setInt(2, receiver.getId());
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateFriendshipState(User sender, User receiver, FriendshipState state) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE Friendship SET state = ? WHERE id_sender = ? AND id_receiver = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, state.name());
                statement.setInt(2, sender.getId());
                statement.setInt(3, receiver.getId());
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
