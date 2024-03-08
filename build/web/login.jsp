<%-- 
    Document   : login
    Created on : Aug 20, 2023, 5:48:04 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>        
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <form action="MainController" method="post">
            User ID<input type="text" name="userID" required=""/>
            </br>Password<input type="password" name="password" required=""/>
            <div class="g-recaptcha" data-sitekey="6LeAL8cnAAAAAPB5IwQqSkNJx02cGfF4d3d023k6"></div>            
            </br><input type="submit" name="action" value="Login"/>
            <input type="reset" value="Reset"/>
            <input type="submit" name="action" value="Top2"/>
        </form>

        ${requestScope.ERROR}
        <a href="MainController?action=Create_Page">Create new User</a>
    </body>
</html>