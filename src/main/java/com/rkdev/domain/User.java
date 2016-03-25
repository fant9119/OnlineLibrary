package com.rkdev.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

@Entity
@Table(name="USERS")
@SequenceGenerator(name = "sequence", sequenceName = "USER_SEQ", allocationSize = 1, initialValue = 1)
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "sequence")
	private long id;
	
	@Column(name = "USER_LOGIN")
	private String login;
	
	@Column(name = "USER_PASSWORD")
	private String password;

    @Column(name = "USER_ROLE")
    private Role role;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Book> books = new HashSet<>();

	public User() {
        this.role = Role.USER;
	}

    public User(String login, String password, Role role) {
        this.login = login;
        this.password = password;
        this.role = role;
    }

    public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
