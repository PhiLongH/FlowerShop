<%-- 
    Document   : top2
    Created on : Aug 24, 2023, 8:19:11 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top2 Page</title>
    </head>
    <body>
        <c:if test="${requestScope.TOP2_USER != null}">
        <c:if test="${not empty requestScope.TOP2_USER}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role ID</th>
                        <th>Password</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${requestScope.TOP2_USER}" varStatus="counter">
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td>
                                <input type="text" name="userID" value="${user.userID}" readonly="readonly" />
                            </td>
                            <td>
                                <input type="text" name="fullName" value="${user.fullName}" required="">
                            </td>
                            <td>
                                <input type="text" name="email" value="${user.email}" required="">
                            </td>
                            <td>
                                <input type="text" name="phone" value="${user.phone}" required="">
                            </td>
                            <td>
                                <input type="text" name="roleID" value="${user.roleID}" required="">
                            </td>
                            <td>${user.password}</td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
    </body>
</html>
