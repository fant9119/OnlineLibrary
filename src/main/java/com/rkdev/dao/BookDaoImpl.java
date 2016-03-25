package com.rkdev.dao;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.rkdev.domain.Book;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory factory;

    @Override
    public Long createBook(Book book) {
        return (Long)factory.getCurrentSession().save(book);
    }

    @Override
    public Book readBook(long id) {
        return (Book)factory.getCurrentSession().get(Book.class, id);
    }

    @Override
    public boolean updateBook(Book book) {
        Session session = factory.getCurrentSession();
        session.update(book);
        return true;
    }

    @Override
    public boolean deleteBook(Book book) {
        Session session = factory.getCurrentSession();
        session.delete(book);
        return true;
    }

	@Override
	public List findAllBooks() {
        Session session = factory.getCurrentSession();
        return session.createCriteria(Book.class).list();
	}

	@Override
	public List findBooksByTitle(String title) {
        return factory.getCurrentSession().createCriteria(Book.class)
                .add(Restrictions.like("title", title, MatchMode.ANYWHERE))
                .list();
	}

	@Override
	public List findBooksByGenre(String genre) {
        return factory.getCurrentSession().createCriteria(Book.class)
                .add(Restrictions.like("genre", genre, MatchMode.ANYWHERE))
                .list();
	}

	@Override
	public List findBooksByAuthor(String author) {
        return factory.getCurrentSession().createCriteria(Book.class)
                .add(Restrictions.like("author", author, MatchMode.ANYWHERE))
                .list();
	}

    @Override
    public Blob createBlob(MultipartFile file) {
        Blob blob = null;
        try {
            Session session = factory.getCurrentSession();
            blob = Hibernate.getLobCreator(session).createBlob(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return blob;
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

}
