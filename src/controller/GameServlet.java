package controller;

import model.game.Game;
import service.GameForm;
import service.games.GameService;
import service.games.IGameService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GameServlet", urlPatterns = "/gamesServlet")
public class GameServlet extends HttpServlet {
    private final IGameService gameService = new GameService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        switch (action){
            case "find":
                findGame(request, response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }
        switch (action){
            case "detail":
                showGameDetail(request, response);
                break;
            default:
                break;
        }
    }

    private void showGameDetail(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showForm(request, response, "view/gameView/detail.jsp", gameService);
    }

    private void findGame(HttpServletRequest request, HttpServletResponse response) {
        String input = request.getParameter("findingGame");
        List<Game> games = gameService.findGame(input);
        request.setAttribute("findGame", games);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
