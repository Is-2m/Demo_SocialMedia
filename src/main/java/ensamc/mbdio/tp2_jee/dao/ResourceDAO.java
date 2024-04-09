package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Message;
import ensamc.mbdio.tp2_jee.model.Resource;
import ensamc.mbdio.tp2_jee.model.ResourceType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

public class ResourceDAO {
    private DataSource dataSource;
    private MessageDAO messageDAO; // Add other DAOs as needed

    public ResourceDAO(DataSource theDataSource) {
        dataSource = theDataSource;
        messageDAO = new MessageDAO(dataSource); // Initialize other DAOs as needed
    }

    public boolean createResource(int postId, Resource resource) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO Resource (id_post, name, type) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setInt(1, postId);
                statement.setString(2, resource.getName());
                statement.setString(3, resource.getType().name());
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    int resourceId;
                    try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            resourceId = generatedKeys.getInt(1);
                        } else {
                            return false;
                        }
                    }
                    switch (resource.getType()) {
                        case MESSAGE:
                            return messageDAO.createMessage(resourceId, (Message) resource);
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
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public List<Resource> getResource(int postId) {
        List<Resource> res = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM Resource WHERE id_post = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, postId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        String type = resultSet.getString("type");
                        switch (ResourceType.valueOf(type)) {
                            case MESSAGE:
                                Message message = messageDAO.getMessage(id);
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
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return res;
    }
}

