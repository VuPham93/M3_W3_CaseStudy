package service;

import model.game.Game;
import model.user.User;
import security.AppUtils;
import service.games.IGameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GameForm {
    public static void showForm(HttpServletRequest request, HttpServletResponse response, String path, IGameService gameService) {
        int id = Integer.parseInt(request.getParameter("id"));
        Game game = gameService.findGame(id);

        RequestDispatcher dispatcher;

        if (game == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("game", game);
            dispatcher = request.getRequestDispatcher(path);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void showList(HttpServletRequest request, HttpServletResponse response, IGameService gameService, String requestList) {
        List<Game> gameList = gameService.getGamesList(requestList);

        request.setAttribute("gameList", gameList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/gameList.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static boolean isBought(HttpServletRequest request, IGameService gameService, int id) {
        User user =  AppUtils.getLoggedUser(request.getSession());
        if (user != null) {
            int userId = user.getId();
            List<Integer> gameLibrary = gameService.getLibraryGames(userId);

            for (Integer integer : gameLibrary) {
                if (id == integer) {
                    return true;
                }
            }
        }
        return false;
    }
}
