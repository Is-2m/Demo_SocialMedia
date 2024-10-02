package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.sql.DataSource;

public class MessageDAO {
    private DataSource dataSource;

    public MessageDAO(DataSource theDataSource) {
        dataSource = theDataSource;
    }

    public boolean createMessage(int resourceId, Message message) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean result = false;
        try {
            connection = dataSource.getConnection();
            String sql = "INSERT INTO \"message\" (id, content) VALUES (?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, resourceId);
            statement.setString(2, message.getContent());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
        }
    }

    public Message getMessage(int messageId) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Message message = null;
        try {
            connection = dataSource.getConnection();
            String sql = "SELECT * FROM \"message\" WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, messageId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String content = resultSet.getString("content");
                message = new Message(content);
            }


        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            close(connection, statement, resultSet);
        }
        return message;
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
