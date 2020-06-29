package service.users;

import model.user.User;

import java.util.List;

public interface IUserService {
    static User findUserExactly(String nameOrEmail, String password) {
        return null;
    }

    User findUser(int id);

    List<User> findUser(String input);

    User findUserByNameAndEmail(String name, String email);

    List<User> getUserList();

    boolean isExitsUser(String name, String email);

    void newUser(User user);

    boolean updateUser(int id, User user);

    boolean removeUser(int id);
}
