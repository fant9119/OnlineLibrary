package com.rkdev.dao;

import java.sql.Blob;
import java.util.List;
import com.rkdev.domain.Book;
import org.springframework.web.multipart.MultipartFile;


public interface BookDao {

    public Book readBook(long id);
    public Long createBook(Book book);
    public boolean deleteBook(Book book);
    public boolean updateBook(Book book);
	public List findAllBooks();
	public List findBooksByTitle(String title);
	public List findBooksByGenre(String genre);
	public List<Book> findBooksByAuthor(String author);

    public Blob createBlob(MultipartFile pdf);
}
