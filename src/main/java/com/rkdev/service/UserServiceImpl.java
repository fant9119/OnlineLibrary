package com.rkdev.service;

import com.rkdev.dao.UserDao;
import com.rkdev.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Long createUser(User user) {
        return userDao.createUser(user);
    }

    @Override
    public User readUser(Long id) {
        return userDao.readUser(id);
    }

    @Override
    public User findByLogin(String login) {
        return userDao.findUserByLogin(login);
    }

    @Override
    @Transactional
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

}
