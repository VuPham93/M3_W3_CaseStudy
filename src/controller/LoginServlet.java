package controller;

import model.user.User;
import security.AppUtils;
import service.users.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/view/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameOrEmail = request.getParameter("nameOrEmail");
        String password = request.getParameter("password");
        User userAccount = UserDAO.findUserExactly(nameOrEmail, password);

        if (userAccount == null) {
            String errorMessage = "Invalid user name or password";

            request.setAttribute("errorMessage", errorMessage);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/view/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        AppUtils.storeLoggedUser(request.getSession(), userAccount);
        int redirectId = -1;

        try {
            redirectId = Integer.parseInt(request.getParameter("redirectId"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            response.sendRedirect(requestUri);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/homeServlet");
        }
    }

}
