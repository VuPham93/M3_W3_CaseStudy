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

@WebServlet(name = "GameManagementServlet", urlPatterns = "/gameManagementServlet" )
public class GameManagementServlet extends HttpServlet {
    private final IGameService gameService = new GameService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        switch (action){
            case "new":
                createNewGame(request, response);
                break;
            case "update":
                updateGameInfo(request, response);
                break;
            case "remove":
                removeGame(request, response);
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
            case "new":
                showNewGameForm(request, response);
                break;
            case "update":
                showUpdateGameInfoForm(request, response);
                break;
            case "remove":
                showRemoveGameForm(request, response);
                break;
            default:
                break;
        }
    }

    private void showNewGameForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewGame(HttpServletRequest request, HttpServletResponse response) {
        List<Game> gameList = gameService.getGamesList();

        int id = gameList.get(gameList.size() - 1).getId() + 1;
        Game game = getInfo(request, id);
        gameService.newGame(game);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/create.jsp");
        request.setAttribute("message", "New game was added to library");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateGameInfoForm(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showForm(request, response,"view/gameView/update.jsp", gameService);
    }

    private void updateGameInfo(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Game game = getInfo(request, id);
        gameService.updateGame(id, game);

        request.setAttribute("message", "Game information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/gameView/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showRemoveGameForm(HttpServletRequest request, HttpServletResponse response) {
        GameForm.showForm(request, response,"view/gameView/remove.jsp", gameService);
    }

    private void removeGame(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        gameService.removeGame(id);
        try {
            response.sendRedirect("gamesServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Game getInfo(HttpServletRequest request, int id) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String detail = request.getParameter("detail");
        String systemRequirements = request.getParameter("systemRequirements");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String status = request.getParameter("status");
        String downloadLink = request.getParameter("downloadLink");
        String smallImgPath = request.getParameter("smallImgPath");
        String bigImg1Path = request.getParameter("bigImg1Path");
        String bigImg2Path = request.getParameter("bigImg2Path");
        String bigImg3Path = request.getParameter("bigImg3Path");
        String videoPath = request.getParameter("videoPath");

        return new Game(id, name, category, detail, systemRequirements, price, discount, status, downloadLink, smallImgPath, bigImg1Path, bigImg2Path, bigImg3Path, videoPath);
    }
}
