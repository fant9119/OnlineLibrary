package com.rkdev.service;

import com.rkdev.domain.User;

import java.util.List;

public interface UserService {

    Long createUser(User user);
    User readUser(Long id);
    User findByLogin(String login);
    boolean updateUser(User user);
}
