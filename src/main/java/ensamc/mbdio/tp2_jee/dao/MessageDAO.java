package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import javax.sql.DataSource;

public class MessageDAO {
    private DataSource dataSource;

    public MessageDAO(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public boolean createMessage(int resourceId, Message message) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO Message (id, content) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, resourceId);
                statement.setString(2, message.getContent());
                int rowsAffected = statement.executeUpdate();
                connection.close();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Message getMessage(int messageId) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM Message WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, messageId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String content = resultSet.getString("content");
                        connection.close();
                        return new Message(content);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
