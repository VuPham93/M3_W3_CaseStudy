package service.games;

import model.game.Game;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameService implements IGameService{
    private static final String ADD_NEW_GAME = "insert into gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath) value (?,?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_ALL_GAMES = "select * from gamelist";
    private static final String SELECT_GAME_BY_ID = "select * from gamelist where id = ?";
    private static final String UPDATE_GAME_INFO =  "update gamelist set name = ?, category = ?, detail = ?, systemRequirements = ?, price = ?, discount = ?, status = ?, downloadLink = ?, smallImgPath = ?, bigImg1Path = ?, bigImg2Path = ?, bigImg3Path = ?, videoPath = ? where id = ?;";
    private static final String REMOVE_GAME =  "delete from gamelist where id = ?;";
    private static final String FIND_GAME = "select * from gamelist where id like ? or name like ?";
    public GameService() {
    }

    protected Connection getConnection() {
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
    public List<Game> getGamesList() {
        List<Game> gameList = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GAMES)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                gameList.add(getGameInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return gameList;
    }

    @Override
    public Game findGame(int id) {
        Game game = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GAME_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                game = getGameInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return game;
    }

    @Override
    public void newGame(Game game) {
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(ADD_NEW_GAME)) {
            setGameInfo(statement, game);
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean updateGame(int id, Game game){
        boolean gameUpdated = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_GAME_INFO);) {
            setGameInfo(statement, game);
            statement.setInt(14, id);
            gameUpdated = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return gameUpdated;
    }

    @Override
    public boolean removeGame(int id) {
        boolean gameRemoved = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(REMOVE_GAME);) {
            statement.setInt(1, id);
            gameRemoved = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            printSQLException(exception);
        }
        return gameRemoved;
    }

    @Override
    public List<Game> findGame(String input) {
        String findingValue = "%" + input + "%";
        List<Game> gameList = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_GAME)) {
            preparedStatement.setString(1, findingValue);
            preparedStatement.setString(2, findingValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                gameList.add(getGameInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            printSQLException(e);
        }
        return gameList;
    }

    private void printSQLException(SQLException ex) {
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

    private Game getGameInfo (ResultSet resultSet, int id) throws SQLException {
        String name = resultSet.getString("name");
        String category = resultSet.getString("category");
        String detail = resultSet.getString("detail");
        String systemRequirements = resultSet.getString("systemRequirements");
        double price = Double.parseDouble(resultSet.getString("price"));
        double discount = Double.parseDouble(resultSet.getString("discount"));
        String status = resultSet.getString("status");
        String downloadLink = resultSet.getString("downloadLink");
        String smallImgPath = resultSet.getString("smallImgPath");
        String bigImg1Path = resultSet.getString("bigImg1Path");
        String bigImg2Path = resultSet.getString("bigImg2Path");
        String bigImg3Path = resultSet.getString("bigImg3Path");
        String videoPath = resultSet.getString("videoPath");

        return new Game(id, name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath);
    }

    private void setGameInfo(PreparedStatement statement, Game game) throws SQLException {
        statement.setString(1, game.getName());
        statement.setString(2, game.getCategory());
        statement.setString(3, game.getDetail());
        statement.setString(4, game.getSystemRequirements());
        statement.setDouble(5, game.getPrice());
        statement.setDouble(6, game.getDiscount());
        statement.setString(7, game.getStatus());
        statement.setString(8, game.getDownloadLink());
        statement.setString(9, game.getSmallImgPath());
        statement.setString(10, game.getBigImg1Path());
        statement.setString(11, game.getBigImg2Path());
        statement.setString(12, game.getBigImg3Path());
        statement.setString(13, game.getVideoPath());
    }
}
