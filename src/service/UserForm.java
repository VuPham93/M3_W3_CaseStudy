package service;

import model.user.User;
import service.users.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserForm {
    public static void showForm(HttpServletRequest request, HttpServletResponse response, String path, IUserService userService, int id) {
        User user = userService.findUser(id);

        RequestDispatcher dispatcher;

        if (user == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher(path);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static User getInfo(HttpServletRequest request, int id) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        double balance = Double.parseDouble(request.getParameter("balance"));
        String role = request.getParameter("role");

        return new User(id, name, email, password, balance, role);
    }

    public static void updateUserInfo(HttpServletRequest request, HttpServletResponse response, IUserService userService) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = UserForm.getInfo(request, id);
        userService.updateUser(id, user);

        request.setAttribute("message", "User information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/userView/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
