package controller;

import model.user.User;
import service.UserForm;
import service.users.IUserService;
import service.users.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersServlet", urlPatterns = "/userManagementServlet")
public class UserManagementServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        switch (action){
            case "new":
                createNewUser(request, response);
                break;
            case "update":
                updateUserInfo(request, response);
                break;
            case "remove":
                removeUser(request, response);
                break;
            case "find":
                findUser(request, response);
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
                showNewUserForm(request, response);
                break;
            case "update":
                showUpdateUserInfoForm(request, response);
                break;
            case "remove":
                showRemoveUserForm(request, response);
                break;
            case "detail":
                showUserDetail(request, response);
                break;
            default:
                showUserList(request, response);
                break;
        }
    }

    private void showUserList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = this.userService.getUserList();

        request.setAttribute("userList", userList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/userView/userList.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUserDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        UserForm.showForm(request, response, "view/userView/userDetail.jsp", userService, id);
    }

    private void showNewUserForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/userView/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.getUserList();

        int id = userList.get(userList.size() - 1).getId() + 1;
        User user = UserForm.getInfo(request, id);
        userService.newUser(user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/userView/create.jsp");
        request.setAttribute("message", "New user was added");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateUserInfoForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        UserForm.showForm(request, response,"view/userView/update.jsp", userService, id);
    }

    private void updateUserInfo(HttpServletRequest request, HttpServletResponse response) {
        UserForm.updateUserInfo(request, response, userService);
    }

    private void showRemoveUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        UserForm.showForm(request, response,"view/userView/remove.jsp", userService, id);
    }

    private void removeUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.removeUser(id);
        try {
            response.sendRedirect("userManagementServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findUser(HttpServletRequest request, HttpServletResponse response) {
        String input = request.getParameter("findingUser");
        List<User> users = userService.findUser(input);

        request.setAttribute("userList", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/userView/userList.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
