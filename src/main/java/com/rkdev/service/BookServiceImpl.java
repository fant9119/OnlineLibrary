package com.rkdev.service;

import java.sql.Blob;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.rkdev.dao.BookDao;
import com.rkdev.domain.Book;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao dao;
	
	@Override
	public List<Book> findAllBooks() {
		return dao.findAllBooks();
	}

	@Override
	public List<Book> findBooksByTitle(String title) {
		return dao.findBooksByTitle(title);
	}

	@Override
	public List<Book> findBooksByGenre(String genre) {
		return dao.findBooksByGenre(genre);
	}

	@Override
	public List<Book> findBooksByAuthor(String author) {
		return dao.findBooksByAuthor(author);
	}

	@Override
	@Transactional
	public void createBook(Book book) {
		dao.createBook(book);
	}

    @Override
    public Book readBook(long id) {
        return dao.readBook(id);
    }

    @Override
    @Transactional
    public boolean updateBook(Book book) {
        return dao.updateBook(book);
    }

	@Override
	@Transactional
	public void deleteBook(Book book) {
		dao.deleteBook(book);
	}

    public Blob createBlob(MultipartFile pdf) {
        return dao.createBlob(pdf);
    }

}
