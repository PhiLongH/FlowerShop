<%-- 
    Document   : shopping
    Created on : Aug 16, 2023, 8:29:47 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Shop</title>
    </head>

    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>

        Welcome:<h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <a href="MainController?action=Logout"></a>
        <form action="MainController">
            <input type="submit" name="action" value="Logout">
        </form>

        <form action="MainController">
            <div class="input-search">
                <input type="text" name="searchProduct" value="${param.searchProduct}">
            </div>
            <input type="submit" name="action" value="searchProduct">
        </form>
        <form action="MainController">
            <input type="submit" name="action" value="View"/>
        </form>

        <c:if test="${sessionScope.LIST_PRODUCT != null}">

            <c:if test="${not empty sessionScope.LIST_PRODUCT}" >
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Add</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${sessionScope.LIST_PRODUCT}" varStatus="count">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${count.count}</td>
                                <td>
                                    <input type="text" name="productID" value="${p.productID}"  readonly=""/>
                                </td>
                                <td>
                                    <input type="text" name="name" value="${p.name}" />
                                </td>
                                <td>
                                    <input type="number" name ="quantity" min="1" />
                                </td>
                                <td>
                                    <input type="number" name="price" value="${p.price}" />
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Add"/>
                                    <input type="hidden" name="searchProduct" value="${param.searchProduct}">
                                    <input type="hidden" name="productID" value="${p.productID}">
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
    ${requestScope.MESSAGE}

</body>
</html>
