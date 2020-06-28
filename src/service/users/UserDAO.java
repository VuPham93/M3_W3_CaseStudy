package service.users;

import model.user.User;
import security.SecurityConfig;

import java.util.HashMap;
import java.util.Map;

public class UserDAO {
    private static final Map<String, User> mapUsers = new HashMap<String, User>();

    static {
        initUsers();
    }

    private static void initUsers() {

        // User này có 1 vai trò là EMPLOYEE.
        User user = new User(1,"vu", "vu@gmail.com", "123", 10000, SecurityConfig.ROLE_USER);

        // User này có 2 vai trò EMPLOYEE và MANAGER.
        User admin = new User(1, "admin", "admin@gmail.com", "123", 9999999, SecurityConfig.ROLE_USER, SecurityConfig.ROLE_ADMIN);

        mapUsers.put(user.getName(), user);
        mapUsers.put(admin.getName(), admin);
    }

    // Tìm kiếm người dùng theo userName và password.
    public static User findUser(String userName, String password) {
        User u = mapUsers.get(userName);
        if (u != null && u.getPassword().equals(password)) {
            return u;
        }
        return null;
    }
}
