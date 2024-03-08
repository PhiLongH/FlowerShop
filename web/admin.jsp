<%-- 
    Document   : admin
    Created on : Aug 20, 2023, 5:47:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Page</title>
    </head>
    <body>
        <%--
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>    --%>
    <c:if test="${sessionScope.LOGIN_USER == null or sessionScope.LOGIN_USER.roleID ne 'AD'}">
        <c:redirect url="login.html"></c:redirect>
    </c:if>
    Welcome: ${sessionScope.LOGIN_USER.fullName}

    <form action="MainController">
        Search <input type="text" name="search" value="${param.search}"/>
        <input type="submit" value="Search" name="action" />
    </form>
    <c:if test="${requestScope.LIST_USER != null}">
        <c:if test="${not empty requestScope.LIST_USER}">
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
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
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
                            <!--update-->
                            <td>
                                <input type="submit" value="Update" name="action" />
                                <input type="hidden" value="${param.search}" name="search" />
                            </td>
                            <!--delete-->
                            <td>
                        <c:url var="deleteLink" value="MainController">
                            <c:param name="action" value="Delete"></c:param>
                            <c:param name="userID" value="${user.userID}"></c:param>
                            <c:param name="search" value="${param.search}"></c:param>
                        </c:url>
                        <a href="${deleteLink}">Delete</a>
                        </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
    <form action="MainController">
        <input type="submit" value="Logout" name="action" />
    </form>
    <c:url var="Logout" value="MainController">
        <c:param name="action" value="Logout"></c:param>
    </c:url>

    ${requestScope.ERROR}
    </br> <a href="MainController?action=Admin_Product_Page">Products</a>
    
</body>
</html>
