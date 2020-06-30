package service.games;

import model.game.Game;
import service.MySQLConnUtils;
import service.MySQLException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameService implements IGameService{
    private static final String ADD_NEW_GAME = "insert into gamelist (name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath) value (?,?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_GAME_BY_ID = "select * from gamelist where id = ?";
    private static final String UPDATE_GAME_INFO =  "update gamelist set name = ?, category = ?, detail = ?, systemRequirements = ?, price = ?, discount = ?, status = ?, downloadLink = ?, smallImgPath = ?, bigImg1Path = ?, bigImg2Path = ?, bigImg3Path = ?, videoPath = ? where id = ?;";
    private static final String REMOVE_GAME =  "delete from gamelist where id = ?;";
    private static final String FIND_GAME = "select * from gamelist where id like ? or name like ?";
    public static final String SELECT_ALL_GAMES = "select * from gamelist";
    public static final String SELECT_ACTION_GAMES = "select * from gamelist where category like 'action'";
    public static final String SELECT_ADVENTURE_GAMES = "select * from gamelist where category like 'adventure'";
    public static final String SELECT_FANTASY_GAMES = "select * from gamelist where category like 'fantasy'";
    public static final String SELECT_STRATEGY_GAMES = "select * from gamelist where category like 'strategy'";
    public static final String SELECT_HORROR_GAMES = "select * from gamelist where category like 'horror'";
    public static final String SELECT_RECENTLY_UPDATE_GAMES = "select * from gamelist where status like 'New Releases'";
    public static final String SELECT_TOP_SELLER_GAMES = "select * from gamelist where status like 'Top seller'";
    public static final String SELECT_COMING_SOON_GAMES = "select * from gamelist where status like 'Coming Soon'";
    private static final String SAVE_GAME_TO_LIBRARY = "insert into userlibrary value (?,?);";
    private static final String GET_GAME_LIBRARY = "select game_id from userlibrary where user_id = ?;";

    public GameService() {
    }

    @Override
    public List<Game> getGamesList(String gameRequest) {
        List<Game> gameList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(gameRequest)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                gameList.add(getGameInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return gameList;
    }

    @Override
    public Game findGame(int id) {
        Game game = null;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GAME_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                game = getGameInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return game;
    }

    @Override
    public List<Game> findGame(String input) {
        String findingValue = "%" + input + "%";
        List<Game> gameList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_GAME)) {
            preparedStatement.setString(1, findingValue);
            preparedStatement.setString(2, findingValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                gameList.add(getGameInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return gameList;
    }

    @Override
    public void newGame(Game game) {
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(ADD_NEW_GAME)) {
            setGameInfo(statement, game);
            statement.executeUpdate();
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
    }

    @Override
    public boolean updateGame(int id, Game game){
        boolean gameUpdated = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_GAME_INFO);) {
            setGameInfo(statement, game);
            statement.setInt(14, id);
            gameUpdated = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return gameUpdated;
    }

    @Override
    public boolean removeGame(int id) {
        boolean gameRemoved = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(REMOVE_GAME);) {
            statement.setInt(1, id);
            gameRemoved = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return gameRemoved;
    }

    @Override
    public void saveGameToLibrary(int userId, int gameId) {
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(SAVE_GAME_TO_LIBRARY)) {
            statement.setInt(1, userId);
            statement.setInt(2, gameId);
            statement.executeUpdate();
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
    }

    @Override
    public List<Integer> getLibraryGames(int userId) {
        List<Integer> gameList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(GET_GAME_LIBRARY)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("game_id");
                gameList.add(id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return gameList;
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
