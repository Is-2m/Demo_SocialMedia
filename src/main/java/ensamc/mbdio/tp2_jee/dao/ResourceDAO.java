package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Message;
import ensamc.mbdio.tp2_jee.model.ResourceModel;
import ensamc.mbdio.tp2_jee.model.ResourceType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class ResourceDAO {
    private DataSource dataSource;
    private MessageDAO messageDAO; // Add other DAOs as needed

    public ResourceDAO(DataSource theDataSource) {
        dataSource = theDataSource;
        messageDAO = new MessageDAO(dataSource); // Initialize other DAOs as needed
    }

    public boolean createResource(int postId, ResourceModel resourceModel) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "INSERT INTO \"resource\" (id_post, name, type) VALUES (?, ?, ?)";

            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, postId);
            statement.setString(2, resourceModel.getName());
            statement.setString(3, resourceModel.getType().name());
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                int resourceId;
                resultSet = statement.getGeneratedKeys();
                if (resultSet.next()) {
                    resourceId = resultSet.getInt(1);
                } else {
                    return false;
                }

                switch (resourceModel.getType()) {
                    case MESSAGE:
                        boolean res = messageDAO.createMessage(resourceId, (Message) resourceModel);
                        return res;
                    case WEB_LINK:
                        // Implement web link creation
                        return true;
                    case PHOTO_VIDEO:
                        // Implement image creation
                        return true;
                    default:
                        return false; // Unsupported resource type
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }
        return false;
    }

    public List<ResourceModel> getResource(int postId) {
        List<ResourceModel> res = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "SELECT * FROM \"resource\" WHERE id_post = ?";

            statement = connection.prepareStatement(sql);
            statement.setInt(1, postId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String type = resultSet.getString("type");
                switch (ResourceType.valueOf(type)) {
                    case MESSAGE:
                        Message message = messageDAO.getMessage(id);
                        message.setId(id);
                        message.setType(ResourceType.MESSAGE);
                        message.setName(name);
                        res.add(message);
                        break;
                    case WEB_LINK:
                        break;
                    case PHOTO_VIDEO:
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }
        return res;
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

