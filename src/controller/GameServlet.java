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

        if ("find".equals(action)) {
            findGame(request, response);
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
            case "action":
                showActionList(request, response);
                break;
            case "adventure":
                showAdventureList(request, response);
                break;
            case "fantasy":
                showFantasyList(request, response);
                break;
            case "strategy":
                showStrategyList(request, response);
                break;
            case "horror":
                showHorrorList(request, response);
                break;
            case "recentlyUpdate":
                showRecentlyUpdateList(request, response);
                break;
            case "topSellers":
                showTopSellerList(request, response);
                break;
            case "comingSoon":
                showComingSoonList(request, response);
                break;
            default:
                showGameList(request, response);
                break;
        }
    }

    private void showGameDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Game game = gameService.findGame(id);

        request.setAttribute("buy", GameForm.isBought(request, gameService, id));

        RequestDispatcher dispatcher;

        if (game == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {

            request.setAttribute("game", game);
            dispatcher = request.getRequestDispatcher("view/gameView/detail.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void findGame(HttpServletRequest request, HttpServletResponse response) {
        String input = request.getParameter("findingGame");
        List<Game> games = gameService.findGame(input);
        request.setAttribute("gameList", games);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/gameList.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showGameList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_ALL_GAMES);
    }

    private void showActionList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_ACTION_GAMES);
    }

    private void showAdventureList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_ADVENTURE_GAMES);
    }

    private void showFantasyList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_FANTASY_GAMES);
    }

    private void showStrategyList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_STRATEGY_GAMES);
    }

    private void showHorrorList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_HORROR_GAMES);
    }

    private void showRecentlyUpdateList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_RECENTLY_UPDATE_GAMES);
    }

    private void showTopSellerList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_TOP_SELLER_GAMES);
    }

    private void showComingSoonList(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showList(request, response, gameService, GameService.SELECT_COMING_SOON_GAMES);
    }
}
