package service.users;

import model.user.User;

import java.util.List;

public interface IUserService {
    List<User> getUserList();

    User findUser(int id);

    List<User> findUser(String input);

    User findUserExactly(String nameOrEmail, String password);

    void newUser(User user);

    boolean updateUser(int id, User user);

    boolean removeUser(int id);
}
