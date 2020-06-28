package service;

import model.game.Game;
import service.games.IGameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
}
