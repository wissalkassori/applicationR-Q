package controllers;

import entities.User;
import services.UserService;

import java.util.List;

public class UserController {

    private final UserService service = new UserService();

    public boolean addUser(String login, String password) {
        return service.create(new User(login, password));
    }

    public boolean deleteUser(int id) {
        User user = service.findById(id);
        return user != null && service.delete(user);
    }

    public boolean updateUser(int id, String newLogin, String newPassword) {
        User user = service.findById(id);
        if (user != null) {
            user.setLogin(newLogin);
            user.setPassword(newPassword);
            return service.update(user);
        }
        return false;
    }

    public List<User> getAllUsers() {
        return service.findAll();
    }

    public User getUserById(int id) {
        return service.findById(id);
    }
}
