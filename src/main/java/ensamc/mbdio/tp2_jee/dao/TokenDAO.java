package ensamc.mbdio.tp2_jee.dao;

import ensamc.mbdio.tp2_jee.model.Token;
import ensamc.mbdio.tp2_jee.model.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class TokenDAO {

    private DataSource dataSource;
    private UserDAO userDAO;

    public TokenDAO(DataSource theDataSource) {
        dataSource = theDataSource;
        userDAO = new UserDAO(dataSource);
    }

    public boolean deleteToken(String token) {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = dataSource.getConnection();
            String sql = "DELETE FROM \"tokens\" WHERE token = ?";

            statement = connection.prepareStatement(sql);
            statement.setString(1, token);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, null);
        }
    }

    public boolean createToken(String token, User user) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = dataSource.getConnection();
            String sql = "INSERT INTO \"tokens\" (id_user,token, email,expiration_date) VALUES (?,?, ?,?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, user.getId());
            statement.setString(2, token);
            statement.setString(3, user.getEmail());
            statement.setLong(4, (System.currentTimeMillis()/1000) + 60 * 60 * 24);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;


        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close(connection, statement, null);
        }
    }

    public Token checkTokenValidity(String token) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // get db connection
            connection = dataSource.getConnection();
            String sql = "SELECT * FROM \"tokens\" WHERE token=?"; // Removed semicolon

            statement = connection.prepareStatement(sql);

            statement.setString(1, token);

            resultSet = statement.executeQuery(); // No semicolon needed here

            if (resultSet.next()) {

                Token tk = new Token();
                tk.setId(resultSet.getInt("id"));
                tk.setToken(resultSet.getString("token"));
                tk.setEmail(resultSet.getString("email"));
                tk.setExpirationDate(resultSet.getLong("expiration_date"));
                tk.setUserId(resultSet.getInt("id_user"));
                return tk;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(connection, statement, resultSet);
        }
        return null;
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
