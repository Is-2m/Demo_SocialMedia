package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.ResourceModel;
import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

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
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "INSERT INTO \"post\" (id_user, date) VALUES (?, ?)";

            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, post.getUser().getId());
            statement.setLong(2, post.getDate());
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                resultSet = statement.getGeneratedKeys();
                if (resultSet.next()) {
                    int postId = resultSet.getInt(1);
                    post.setId(postId);
                    for (ResourceModel resourceModel : post.getResources()) {
                        boolean resourceCreated = resourceDAO.createResource(postId, resourceModel);
                        if (!resourceCreated) {
                            return false;
                        }
                    }
                    return true;
                }
            }

        } catch (
                Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
        }
        return false;
    }

    public boolean deletePost(Post post) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = dataSource.getConnection();
            String sql = "DELETE FROM \"post\" WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, post.getId());
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, resultSet);
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
            String sql = "select * from \"post\" where id=?";
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
                List<ResourceModel> resourceModels = resourceDAO.getResource(id);
                post = new Post(id, user, date, resourceModels);
            }

            return post;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            close(myConn, myStmt, myRs);
        }
    }

    public List<Post> getPostsByUser(User poster) {
        List<Post> posts = new ArrayList<>();
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        try {
            myConn = dataSource.getConnection();
            String sql = "select * from \"post\" where id_user=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setInt(1, poster.getId());
            myRs = myStmt.executeQuery();
            while (myRs.next()) {
                int postId = myRs.getInt("id");
                Long date = myRs.getLong("date");
                List<ResourceModel> resourceModels = resourceDAO.getResource(postId);
                Post post = new Post(postId, poster, date, resourceModels);
                posts.add(post);
            }

            return posts;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Close resources
            close(myConn, myStmt, myRs);
        }
    }

    public List<Post> getFriendPosts(int currentUserId) {
        List<Post> friendPosts = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String sql = "SELECT p.* " +
                "FROM \"post\" p " +
                "INNER JOIN \"friendship\" f ON (p.id_user = f.id_sender OR p.id_user = f.id_receiver) " +
                "WHERE (f.id_sender = ? OR f.id_receiver = ?) AND f.state = 'APPROVED'";

        try {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, currentUserId);
            statement.setInt(2, currentUserId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int postId = resultSet.getInt("id");
                User user = userDAO.getUser(resultSet.getInt("id_user"));
                Long date = resultSet.getLong("date");
                List<ResourceModel> resourceModels = resourceDAO.getResource(postId);
                Post post = new Post(postId, user, date, resourceModels);
                friendPosts.add(post);
            }


        } catch (
                SQLException e) {
            e.printStackTrace(); // Handle or log the exception properly
        } finally {
            // Close resources
            close(connection, statement, resultSet);
        }

        return friendPosts;
    }

    public List<Post> getFriendPosts(User user) {
        List<Post> friendPosts = new ArrayList<>();
        for (User friend : user.getFriends()) {
            List<Post> lst = getPostsByUser(friend);
            if (lst != null && !lst.isEmpty())
                friendPosts.addAll(lst);
        }
        friendPosts.addAll(getPostsByUser(user));

        return friendPosts;
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
