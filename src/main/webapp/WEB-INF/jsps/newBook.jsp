<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Book</title>
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
            <h3>Find the book you really love</h3>
        </div>
    </div>
    <div class="button-wrapper">
        <a href="/user_info" style="position: fixed; top: 10px; left: 10px;">
            <div class="button">
                User Info
            </div>
        </a>
    </div>
    <div class="button-wrapper">
        <a href="/logOut" style="position: fixed; top: 10px; right: 10px;">
            <div class="button">
                Sign Out
            </div>
        </a>
    </div>
    <div class="button-wrapper">
        <a href="/allBooks" style="position: fixed; top: 80px; right: 10px;">
            <div class="button">
                Books
            </div>
        </a>
    </div>
    <div class="container" style="margin: 200px 28% auto; position: fixed">
        <section id="content">
            <form method="post" action="/${method}_book.html" enctype="multipart/form-data">
                <div class="reg_section personal_info">
                    <input type="hidden" name="id" value="${book.id}">
                    <input type="text" name="title" required="true" placeholder="Title" autocomplete="off" value="${book.title}">
                    <input type="text" name="author" required="true" placeholder="Author" autocomplete="off" value="${book.author}">
                    <input type="text" name="genre" required="true" placeholder="Genre" autocomplete="off" value="${book.genre}">
                    <textarea name="info" required="true" placeholder="Short Information" text="">${book.info}</textarea>
                    <p><input type="file" name="pdf" required="true" value="${book.pdf}">(only pdf <40 MB)</p>
                </div>

                <div>
                    <input type="submit" value="Submit">
                    <input type="reset" value="Clear">
                </div>
            </form>
        </section>
    </div>
    <div>
        <h1 align="center" style="background-color: rgba(255, 255, 255, 0.7); position: fixed; top: 90%; left: 33%; color: brown">
            <c:out value="${message}"/>
        </h1>
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
