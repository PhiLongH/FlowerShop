<%-- 
    Document   : user
    Created on : Aug 20, 2023, 5:47:49 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER ne 'CU'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        Welcome: ${sessionScope.LOGIN_USER.fullName}
        
        User ID:<h1>${requestScope.LOGIN_USER.userID}</h1>
        Full Name:<h1>${requestScope.LOGIN_USER.fullName}</h1>
        Email:<h1>${requestScope.LOGIN_USER.email}</h1>
        Role ID:<h1>${requestScope.LOGIN_USER.roleID}</h1>
        Password:<h1>***</h1>
    </body>
</html>