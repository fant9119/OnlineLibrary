package com.rkdev.controller;

import com.rkdev.domain.Book;
import com.rkdev.domain.Role;
import com.rkdev.domain.User;
import com.rkdev.service.UserService;
import com.rkdev.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@SessionAttributes({"role", "userId"})
public class LibraryController {

	@Autowired
	private BookService bookService;

    @Autowired
    private UserService userService;
	
	@RequestMapping("/allBooks")
	public String showAllBooks(ModelMap model) {
		model.addAttribute("allBooks", bookService.findAllBooks());
		return "allBooks";
	}

    @RequestMapping(value = "/authentication.html", method = RequestMethod.POST)
    public String authentication(@RequestParam String login,
                                 @RequestParam String password,
                                 ModelMap model) {
        User user = userService.findByLogin(login.trim());
        if (user != null && user.getPassword().equals(password.trim())) {
            model.addAttribute("role", user.getRole().ordinal());
            model.addAttribute("userId", user.getId());
            model.addAttribute("allBooks", bookService.findAllBooks());
            return "allBooks";
        } else {
            model.addAttribute("message", "Invalid login or password! Please, try again!");
            return "logIn";
        }
    }

    @RequestMapping(value = "/user_registration.html", method = RequestMethod.POST)
    public String registration(@RequestParam("login") String login,
                               @RequestParam("password") String password,
                               @RequestParam("confirm") String confirm,
                               ModelMap model) {
        User user = userService.findByLogin(login.trim());
        if (user == null) {
            if (password.equals(confirm)) {
                long id = userService.createUser(new User(login, password, Role.USER));
                model.addAttribute("message", "Registration successful. Your id " + id + ". Now you can log in.");
                return "logIn";
            } else {
                model.addAttribute("message", "You entered two different passwords. Be more accurate =)");
                return "registration";
            }
        } else {
            model.addAttribute("message", "This login is currently in use");
            return "registration";
        }
    }
	
	@RequestMapping("/")
	public String mainPage(ModelMap model) {
        model.addAttribute("allBooks", bookService.findAllBooks());
        return "allBooks";
	}

    @RequestMapping("/registration")
    public String registrationPage(ModelMap model) {
        if (model.containsAttribute("role")) {
            model.addAttribute("allBooks", bookService.findAllBooks());
            return "allBooks";
        }
        return "registration";
    }

    @RequestMapping("/logIn")
    public String logInPage(ModelMap model) {
        if (model.containsAttribute("role")) {
            model.addAttribute("allBooks", bookService.findAllBooks());
            return "allBooks";
        }
        model.addAttribute("message", "You need to log in!");
        return "logIn";
    }

    @RequestMapping("/logOut")
    public String logOut (SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "logIn";
    }

    @RequestMapping("/allBooks/{id}")
    public String bookInfo(@PathVariable long id, ModelMap model) {
        Book book = bookService.readBook(id);
        if (book != null) {
            model.addAttribute("book", book);
            return "bookInfo";
        } else {
            return "404 Not Found!";
        }
    }

    @RequestMapping(value = "/search.html", method = RequestMethod.POST)
    public String search(@RequestParam("search") String search,
                               @RequestParam("filter") String filter,
                               ModelMap model) {
        switch(filter) {
            case "Title":
                model.addAttribute("allBooks", bookService.findBooksByTitle(search));
                break;
            case "Author":
                model.addAttribute("allBooks", bookService.findBooksByAuthor(search));
                break;
            case "Genre":
                model.addAttribute("allBooks", bookService.findBooksByGenre(search));
                break;
            default:
                model.addAttribute("allBooks", bookService.findAllBooks());
                break;
        }
        return "allBooks";
    }

    @RequestMapping("/newBook")
    public String newBookPage(ModelMap model) {
        if (model.containsAttribute("role")) {
            if ((int)model.get("role") == 0) {
                model.addAttribute("method", "add_new");
                return "newBook";
            } else {
                model.addAttribute("allBooks", bookService.findAllBooks());
                return "allBooks";
            }
        }
        model.addAttribute("message", "You need to log in!");
        return "logIn";
    }

    @RequestMapping(value = "/add_new_book.html", method = RequestMethod.POST)
    public String addNewBook(@RequestParam("title") String title,
                               @RequestParam("author") String author,
                               @RequestParam("genre") String genre,
                               @RequestParam("info") String info,
                               @RequestParam("pdf") MultipartFile pdf,
                               ModelMap model) {
        if (!pdf.getContentType().equalsIgnoreCase("application/pdf")) {
            model.addAttribute("message", "Wrong file format! You need to upload only pdf-format");
            return "newBook";
        }
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setGenre(genre);
        book.setInfo(info);
        book.setPdf(bookService.createBlob(pdf));
        bookService.createBook(book);
        model.addAttribute("message", "New Book successfully created!");
        return "newBook";
    }

    @RequestMapping("/books/download/{id}")
    public String downloadBook(@PathVariable Long id, HttpServletResponse response, ModelMap model) {
        if (model.containsAttribute("role")) {
            Book book = bookService.readBook(id);
           // if (book != null) {
                try {
                    response.setHeader("Content-Disposition", "inline;filename=\"" + book.getTitle() + "\"");
                    OutputStream out = response.getOutputStream();
                    IOUtils.copy(book.getPdf().getBinaryStream(), out);
                    out.flush();
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
          //  } else {
           //     return "404 Not Found!";
           // }
        }
        return null;
    }

    @RequestMapping("/addToFavourite/{id}")
    public String addToFavourite(@PathVariable Long id, ModelMap model) {
        Book book = bookService.readBook(id);
        Long userId = (Long)model.get("userId");
        User user = userService.readUser(userId);
        if (user.getBooks().add(book)) {
            userService.updateUser(user);
            model.addAttribute("allBooks", bookService.findAllBooks());
            model.addAttribute("message", "The book was added to favourites successfully!");
            return "allBooks";
        }
        model.addAttribute("message", "You already have this book!");
        return "allBooks";
    }

    @RequestMapping("/user_info")
    public String userInfoPage(ModelMap model) {
        if (model.containsAttribute("role")) {
            Long id = (Long)model.get("userId");
            model.addAttribute("user", userService.readUser(id));
            return "userInfo";
        }
        model.addAttribute("message", "You need to log in!");
        return "logIn";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editBookPage(@PathVariable Long id, ModelMap model) {
        if (model.containsAttribute("role")) {
            Book book = bookService.readBook(id);
            model.addAttribute("book", book);
            model.addAttribute("method", "edit");
            return "newBook";
        }
        model.addAttribute("message", "You need to log in!");
        return "logIn";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteBook(@PathVariable Long id, ModelMap model) {
        if (model.containsAttribute("role")) {
            Book book = bookService.readBook(id);
            if (book != null) {
                bookService.deleteBook(book);
                model.addAttribute("allBooks", bookService.findAllBooks());
                return "allBooks";
            } else {
                return "404 Not Found!";
            }
        }
        model.addAttribute("message", "You need to log in!");
        return "logIn";
    }

    @RequestMapping(value = "/edit_book.html", method = RequestMethod.POST)
    public String editBook(@RequestParam("title") String title,
                             @RequestParam("author") String author,
                             @RequestParam("genre") String genre,
                             @RequestParam("info") String info,
                             @RequestParam("pdf") MultipartFile pdf,
                             @RequestParam("id") Long id,
                             ModelMap model) {
        if (!pdf.getContentType().equalsIgnoreCase("application/pdf")) {
            model.addAttribute("message", "Wrong file format! You need to upload only pdf-format");
            return "newBook";
        }
        Book book = bookService.readBook(id);
        book.setTitle(title);
        book.setAuthor(author);
        book.setGenre(genre);
        book.setInfo(info);
        book.setPdf(bookService.createBlob(pdf));
        bookService.updateBook(book);
        model.addAttribute("message", "Book id:" + id + " successfully updated!");
        return "newBook";
    }
}
