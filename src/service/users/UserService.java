package service.users;

import model.user.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {
    private static final String ADD_NEW_USER = "insert into userlist (name, email, password, balance) value (?,?,?,?);";
    private static final String SELECT_ALL_USERS = "select * from userlist";
    private static final String SELECT_USER_BY_ID = "select * from userlist where id = ?";
    private static final String UPDATE_USER_INFO =  "update userlist set name = ?, email = ?, password = ?, balance = ? where id = ?;";
    private static final String REMOVE_USER =  "delete from userlist where id = ?;";
    private static final String FIND_USER = "select * from userlist where id like ? or name like ?";
    private static final String FIND_USER_EXACTLY = "select * from userlist where email = ? or name = ? and password = ?";

    public UserService() {
    }

    protected static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/game?useSSL=false";
            String jdbcUsername = "root";
            String jdbcPassword = "123456";
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<User> getUserList() {
        List<User> userList = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                userList.add(getUserInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return userList;
    }

    @Override
    public User findUser(int id) {
        User user = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                user = getUserInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> findUser(String input) {
        String findingValue = "%" + input + "%";
        List<User> userList = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER)) {
            preparedStatement.setString(1, findingValue);
            preparedStatement.setString(2, findingValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                userList.add(getUserInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return userList;
    }

    @Override
    public User findUserExactly(String nameOrEmail, String password) {
        User user = null;

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_USER_EXACTLY)) {
            preparedStatement.setString(1, nameOrEmail);
            preparedStatement.setString(2, nameOrEmail);
            preparedStatement.setString(3, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                user = getUserInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public static User findUser(String nameOrEmail, String password) {
        return null;
    }

    @Override
    public void newUser(User user) {
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(ADD_NEW_USER)) {
            setUserInfo(statement, user);
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean updateUser(int id, User user) {
        boolean userUpdated = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER_INFO);) {
            setUserInfo(statement, user);
            statement.setInt(5, id);
            userUpdated = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return userUpdated;
    }

    @Override
    public boolean removeUser(int id) {
        boolean userRemoved = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(REMOVE_USER);) {
            statement.setInt(1, id);
            userRemoved = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return userRemoved;
    }

    private static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    private static User getUserInfo(ResultSet resultSet, int id) throws SQLException {
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        String password = resultSet.getString("password");
        double balance = Double.parseDouble(resultSet.getString("balance"));

        return new User(id, name, email, password, balance);
    }

    private void setUserInfo(PreparedStatement statement, User user) throws SQLException {
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPassword());
        statement.setDouble(4, user.getBalance());
    }
}
