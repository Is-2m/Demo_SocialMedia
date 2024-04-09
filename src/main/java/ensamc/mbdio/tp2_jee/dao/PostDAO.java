package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.Resource;
import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class PostDAO {
    private DataSource dataSource;
    private ResourceDAO resourceDAO;
    private UserDAO userDAO;

    public PostDAO(DataSource theDataSource) {
        dataSource = theDataSource;
        resourceDAO = new ResourceDAO(dataSource);
        userDAO = new UserDAO(dataSource);
    }

    public boolean createPost(Post post) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO Post (id_user, date) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setInt(1, post.getUser().getId());
                statement.setLong(2, post.getDate());
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    ResultSet generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int postId = generatedKeys.getInt(1);
                        post.setId(postId);
                        for (Resource resource : post.getResources()) {
                            boolean resourceCreated = resourceDAO.createResource(postId, resource);
                            if (!resourceCreated) {
                                return false;
                            }
                        }
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean deletePost(Post post) {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM Post WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, post.getId());
                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Post getPost(int id) {
        Post post = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        try {
            // get a connection
            myConn = dataSource.getConnection();
            // create sql statement
            String sql = "select * from Post where id=?";
            myStmt = myConn.prepareStatement(sql);
            // set params
            myStmt.setInt(1, id);
            // execute statement
            myRs = myStmt.executeQuery();
            // retrieve data from result set row
            if (myRs.next()) {
                int userId = myRs.getInt("id_user");
                User user = userDAO.getUser(userId);
                Long date = myRs.getLong("date");
                List<Resource> resources = resourceDAO.getResource(id);
                post = new Post(id, user, date, resources);
            }
            return post;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Post> getFriendPosts(User user) {
        List<Post> friendPosts = new ArrayList<>();


        String sql = "SELECT p.* " +
                "FROM Post p " +
                "INNER JOIN Friendship f ON (p.id_user = f.id_sender OR p.id_user = f.id_receiver) " +
                "WHERE (f.id_sender = ? OR f.id_receiver = ?) AND f.state = 'APPROVED'";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, user.getId());
            statement.setInt(2, user.getId());

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int userId = resultSet.getInt("id_user");
                    int postId = resultSet.getInt("id");
                    User poster = userId == user.getId() ? user : userDAO.getUser(userId);
                    Long date = resultSet.getLong("date");
                    List<Resource> resources = resourceDAO.getResource(postId);

                    Post post = new Post(postId, poster, date, resources);
                    friendPosts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception properly
        }

        return friendPosts;
    }
}
