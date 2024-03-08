<%-- 
    Document   : adminShopping
    Created on : Aug 21, 2023, 12:43:49 PM
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
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        Welcome:<h1>${sessionScope.LOGIN_USER.fullName}</h1>
        
        <a href="MainController?action=Logout"></a>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        
        <form action="MainController">
            Search<input type="text" name="searchProduct" value="${param.searchProduct}"/>
            <input type="submit" name="action" value="ViewProduct"/>
        </form>
        <form action="MainController">
            <input type="submit" name="action" value="CreateProduct"/>
        </form>
        <c:if test="${requestScope.LIST_PRODUCT != null}">

            <c:if test="${not empty requestScope.LIST_PRODUCT}" >
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Update Product</th>
                            <th>Delete Product</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" name="productID" value="${p.productID}"  readonly=""/>
                                </td>
                                <td>
                                    <input type="text" name="name" value="${p.name}" />
                                    <input type="hidden" name="name" value="${p.name}" />
                                </td>
                                <td>
                                    <input type="number" name ="quantity" value="${p.quantity}" min="0" />
                                </td>
                                <td>
                                    <input type="text" name="price" value="${p.price}" />
                                    <input type="hidden" name="price" value="${p.price}" />
                                </td>
                                <td>
                                    <input type="submit" name="action" value="UpdateProduct"/>
                                    <input type="hidden" name="${param.searchProduct}" value="searchProduct"/>
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="DeleteProduct"></c:param>
                                        <c:param name="productID" value="${p.productID}"></c:param>
                                        <c:param name="searchProduct" value="${param.searchProduct}"></c:param>
                                    </c:url>
                                    <a href="${deleteLink}">Delete Product</a>
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
