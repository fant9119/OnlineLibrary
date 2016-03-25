<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <meta charset="utf-8">
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.cycle.all.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script>
        $(document).ready(function() {
            $('#table').DataTable();
        } );
    </script>
</head>
<body>
    <div id="slideshow" class="main-block">
        <img src="../../images/1.jpg" style="position: absolute; top: 0; left: 0; display: none; width: 100%">
        <img src="../../images/2.jpg" style="position: absolute; top: 0; left: 0; display: none; width: 100%">
        <img src="../../images/3.jpg" style="position: absolute; top: 0; left: 0; display: none; width: 100%">
        <img src="../../images/4.jpg" style="position: absolute; top: 0; left: 0; display: none; width: 100%">
        <img src="../../images/5.jpg" style="position: absolute; top: 0; left: 0; display: none; width: 100%">
    </div>
    <div id="header">
        <div>
            <h1>RK Library</h1>
            <h3>Find the book you really love</h3>
        </div>
    </div>
    <c:set var="role" value="${role}"/>
    <c:if test="${role != 0 && role != 1}">
        <div class="button-wrapper">
            <a href="/logIn" style="position: fixed; top: 10px; left: 10px;">
                <div class="button">
                    Sign in
                </div>
            </a>
        </div>
        <div class="button-wrapper">
            <a href="/registration" style="position: fixed; top: 10px; right: 10px;">
                <div class="button">
                    Register
                </div>
            </a>
        </div>
    </c:if>
    <c:if test="${role == 0 || role == 1}">
        <div class="button-wrapper">
            <a href="/logOut" style="position: fixed; top: 10px; right: 10px;">
                <div class="button">
                    Sign Out
                </div>
            </a>
        </div>
    </c:if>
    <c:if test="${role == 0 || role == 1}">
        <div class="button-wrapper">
            <a href="/user_info" style="position: fixed; top: 10px; left: 10px;">
                <div class="button">
                    User Info
                </div>
            </a>
        </div>
    </c:if>
    <c:if test="${role == 0}">
        <div class="button-wrapper">
            <a href="/newBook" style="position: fixed; top: 80px; left: 10px;">
                <div class="button">
                    Add Book
                </div>
            </a>
        </div>
    </c:if>
    <%--<div id="search">
        <form action="/search.html" method="POST">
            <input type="text" placeholder="Search" name="search"/>
            <label>
                <select size="1" name="filter">
                    <option disabled>Search by</option>
                    <option selected value="All">All</option>
                    <option value="Title">Title</option>
                    <option value="Author">Author</option>
                    <option value="Genre">Genre</option>
                </select>
            </label>
            <input type="submit" value="Search" />
        </form>
    </div>--%>

    <div style="margin: 200px 15% auto;" id="content">
        <table align="center" id="table" class="display" cellspacing="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Authors</th>
                    <th>Info</th>
                    <c:if test="${role == 0 || role == 1}">
                        <th>Favourite</th>
                    </c:if>
                    <c:if test="${role == 0}">
                        <th>Edit</th>
                    </c:if>
                    <c:if test="${role == 0}">
                        <th>Delete</th>
                    </c:if>
                </tr>
            </thead>
            <tbody align="center">
                <c:forEach var="book" items="${allBooks}">
                    <tr>
                        <td><c:out value="${book.id}"/></td>
                        <td><c:out value="${book.title}"/></td>
                        <td><c:out value="${book.genre}"/></td>
                        <td><c:out value="${book.author}"/></td>
                        <td>
                            <a href="/allBooks/${book.id}">
                                <img src="../../images/info.png">
                            </a>
                        </td>
                        <c:if test="${role == 0 || role == 1}">
                            <td>
                                <a href="/addToFavourite/${book.id}">
                                    <img src="../../images/add.png">
                                </a>
                            </td>
                        </c:if>
                        <c:if test="${role == 0}">
                            <td>
                                <a href="/edit/${book.id}">
                                    <img src="../../images/edit.png">
                                </a>
                            </td>
                        </c:if>
                        <c:if test="${role == 0}">
                            <td>
                                <a href="/delete/${book.id}">
                                    <img src="../../images/delete.png">
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <h1 align="center" style="background-color: rgba(255, 255, 255, 0.7); position: fixed; top: 85%; left: 25%; color: brown">
            <c:out value="${message}"/>
        </h1>
    </div>
    <footer>
        <p>Developed by RK 2016</p>
    </footer>
    <script>
        $(document).ready(function() {
            $('#slideshow').cycle({
                fx: 'fade',
                pager: '#smallnav',
                pause:   1,
                speed: 1800,
                timeout:  3500
            });
        });
    </script>
</body>
</html>
