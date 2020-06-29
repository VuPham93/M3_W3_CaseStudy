package controller;

import model.game.Game;
import service.games.GameService;
import service.games.IGameService;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/homeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IGameService gameService = new GameService();


    public HomeServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        showGameList(request, response);
    }

    private void showGameList(HttpServletRequest request, HttpServletResponse response) {
        List<Game> recentUpdateList = this.gameService.getGamesList();
        List<Game> topSellerList = this.gameService.getGamesList();
        List<Game> comingSoonList = this.gameService.getGamesList();

        request.setAttribute("recentUpdateList", recentUpdateList);
        request.setAttribute("topSellerList", topSellerList);
        request.setAttribute("comingSoonList", comingSoonList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/home.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
