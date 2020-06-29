package controller;

import model.user.User;
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
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/signUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IUserService userService = new UserService();
    public static final String USER_NAME_REGEX = "[A-Z][a-z0-9]{1,9}$";
    public static final String EMAIL_REGEX = "^[a-zA-Z][\\w]{0,15}+@gmail.com$";
    public static final String PASSWORD_REGEX = "[a-z0-9]{3,10}";

    public SignUpServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/view/signUp.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        createNewUser(request, response);
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.getUserList();

        int id = userList.get(userList.size() - 1).getId() + 1;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/signUp.jsp");

        if (!isValidInput(USER_NAME_REGEX, name) || !isValidInput(EMAIL_REGEX, email) || !isValidInput(PASSWORD_REGEX, password)) {
            if (!isValidInput(USER_NAME_REGEX, name)) {
                request.setAttribute("nameError", "Name start with uppercase & 2-10 characters");
            }
            if (!isValidInput(EMAIL_REGEX, email)) {
                request.setAttribute("emailError", "Email must be gmail");
            }
            if (!isValidInput(PASSWORD_REGEX, name)) {
                request.setAttribute("passError", "Password must have 3-10 characters");
            }

        } else {
            if (userService.isExitsUser(name, email)) {
                request.setAttribute("messageError", "This account already exists");
            }
            else {
                User user = new User(id, name, email, password, 50, "user");
                userService.newUser(user);
                request.setAttribute("message", "Your account is ready");
            }
        }

        dispatcher.forward(request, response);
    }

    public boolean isValidInput(String regex, String input) {
        return Pattern.matches(regex, input);
    }
}
