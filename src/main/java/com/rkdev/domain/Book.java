package com.rkdev.domain;

import javax.persistence.*;
import java.sql.Blob;

@Entity
@Table(name="BOOKS")
@SequenceGenerator(name = "sequence", sequenceName = "BOOK_SEQ", allocationSize = 1, initialValue = 1)
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "sequence")
	private long id;
	
	@Column(name = "BOOK_TITLE")
	private String title;
	
	@Column(name = "BOOK_GENRE")
	private String genre;
	
	@Column(name = "BOOK_AUTHOR")
	private String author;
	
	@Column(name = "BOOK_INFO", length = 10000)
	private String info;

    @Column(name = "BOOK_PDF")
    @Lob
	private Blob pdf;

	public Book() {
		
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

    public Blob getPdf() {
        return pdf;
    }

    public void setPdf(Blob pdf) {
        this.pdf = pdf;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Book)) return false;

        Book book = (Book) o;

        if (id != book.id) return false;
        if (!author.equals(book.author)) return false;
        if (!genre.equals(book.genre)) return false;
        if (!info.equals(book.info)) return false;
        if (pdf != null ? !pdf.equals(book.pdf) : book.pdf != null) return false;
        if (!title.equals(book.title)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + title.hashCode();
        result = 31 * result + genre.hashCode();
        result = 31 * result + author.hashCode();
        result = 31 * result + info.hashCode();
        result = 31 * result + (pdf != null ? pdf.hashCode() : 0);
        return result;
    }
}
