package com.rkdev.dao;

import com.rkdev.domain.User;
import java.util.List;

public interface UserDao {

    public Long createUser(User user);
    public User readUser(Long id);
    boolean updateUser(User user);
    User findUserByLogin(String login);
}
