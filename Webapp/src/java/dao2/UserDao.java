package dao2;

import entities.User;

public class UserDao extends AbstractDao<User> {
    public UserDao() {
        super(User.class);
    }
}
