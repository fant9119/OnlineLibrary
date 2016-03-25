package com.rkdev.service;

import java.sql.Blob;
import java.util.List;
import com.rkdev.domain.Book;
import org.springframework.web.multipart.MultipartFile;

public interface BookService {

	public List<Book> findAllBooks();
	public List<Book> findBooksByTitle(String title);
	public List<Book> findBooksByGenre(String genre);
	public List<Book> findBooksByAuthor(String author);
	public void createBook(Book book);
    public Book readBook(long id);
    public boolean updateBook(Book book);
	public void deleteBook(Book book);
    public Blob createBlob(MultipartFile pdf);
}
