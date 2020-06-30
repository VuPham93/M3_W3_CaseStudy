package controller;

import model.game.Game;
import model.user.User;
import security.AppUtils;
import service.games.GameService;
import service.games.IGameService;
import service.users.IUserService;
import service.users.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BuyGameServlet", urlPatterns = "/buyGameServlet")
public class BuyGameServlet extends HttpServlet {
    private final IGameService gameService = new GameService();
    private final IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        if ("buy".equals(action)) {
            buyGame(request, response);
        } else {
            showGameLibrary(request, response);
        }
    }

    private void buyGame(HttpServletRequest request, HttpServletResponse response) {
        int userId = AppUtils.getLoggedUser(request.getSession()).getId();
        User user = userService.findUser(userId);

        int gameId = Integer.parseInt(request.getParameter("id"));
        Game game = gameService.findGame(gameId);

        user.setBalance(user.getBalance() - game.getSellPrice());

        userService.updateUser(userId, user);

        gameService.saveGameToLibrary(userId, gameId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/buyGameServlet?action");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showGameLibrary(HttpServletRequest request, HttpServletResponse response) {
        int userId = AppUtils.getLoggedUser(request.getSession()).getId();

        List<Game> gameList = new ArrayList<>();

        List<Integer> gameLibrary = gameService.getLibraryGames(userId);

        for (int id: gameLibrary) {
            Game game = gameService.findGame(id);
            gameList.add(game);
        }

        request.setAttribute("gameList", gameList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/gameList.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
