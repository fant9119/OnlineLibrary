<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="utf-8">
    <title>Library</title>
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
            <h3>Enter your login and password to exit</h3>
        </div>
    </div>
    <div class="button-wrapper">
        <a href="/allBooks" style="position: fixed; top: 80px; right: 10px;">
            <div class="button">
                Books
            </div>
        </a>
    </div>
    <div class="button-wrapper">
        <a href="/registration.html" style="position: fixed; top: 10px; right: 10px;">
            <div class="button">
                Register
            </div>
        </a>
    </div>
    <div class="container" style="margin: 200px 28% auto; position: fixed">
        <section id="content">
            <form action="/authentication.html" method="POST">

                <div>
                    <input type="text" placeholder="Login" name="login"/>
                </div>
                <div>
                    <input type="password" placeholder="Password" name="password"/>
                </div>
                <div>
                    <input type="submit" value="Sign in"/>
                    <input type="reset" value="Clear">
                </div>
            </form>
        </section>
    </div>
    <div>
        <h1 align="center" style="background-color: rgba(255, 255, 255, 0.7); position: fixed; top: 90%; left: 40%; color: brown">
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
