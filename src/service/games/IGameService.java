package service.games;

import model.game.Game;

import java.util.List;

public interface IGameService {
    List<Game> getGamesList();

    Game findGame(int id);

    List<Game> findGame(String input);

    void newGame(Game game);

    boolean updateGame(int id, Game game);

    boolean removeGame(int id);
}
