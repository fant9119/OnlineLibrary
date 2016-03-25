package com.rkdev.dao;

import com.rkdev.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory factory;

    @Override
    public Long createUser(User user) {
        return (Long)factory.getCurrentSession().save(user);
    }

    @Override
    public User readUser(Long id) {
        return (User)factory.getCurrentSession().get(User.class, id);
    }

    @Override
    public boolean updateUser(User user) {
        Session session = factory.getCurrentSession();
        session.update(user);
        return true;
    }

    @Override
    public User findUserByLogin(String login) {
        Session session = factory.getCurrentSession();
        return (User)session.createCriteria(User.class)
                .add(Restrictions.eq("login", login))
                .uniqueResult();
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }
}
