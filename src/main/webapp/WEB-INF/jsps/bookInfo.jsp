<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Info</title>
    <meta charset="utf-8">
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.cycle.all.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
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
            <h3>Book Information</h3>
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
    <div class="button-wrapper">
        <a href="/allBooks" style="position: fixed; top: 80px; right: 10px;">
            <div class="button">
                Books
            </div>
        </a>
    </div>
    <c:if test="${role == 0 || role == 1}">
        <div class="button-wrapper">
            <a href="/logOut" style="position: fixed; top: 10px; right: 10px;">
                <div class="button">
                    Sign Out
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
    <div class="container" style="width: 90%; margin: 200px 17% auto; position: fixed">
        <div id="content" style="padding: 10px">
            <p align="left">Title: <c:out value="${book.title}"/></p>
            <p align="left">Author: <c:out value="${book.author}"/></p>
            <p align="left">Genre: <c:out value="${book.genre}"/></p>
            <p align="left">Information about the book:</p><br/>
            <p align="justify"><c:out value="${book.info}"/></p>
            <c:set var="role" value="${role}"/>
            <c:if test="${role == 0 || role == 1}">
                <a href="/books/download/${book.id}">
                    <div class="button">
                        Download
                    </div>
                </a>
            </c:if>
        </div>
    </div>
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
