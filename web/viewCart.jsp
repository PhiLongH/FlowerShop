<%-- 
    Document   : viewCart
    Created on : Aug 16, 2023, 8:55:51 AM
    Author     : ASUS
--%>

<%@page import="sample.product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>

    <body>
        <h1>Your Selected Flowers:</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${sessionScope.CART.getCart().values()}" varStatus="count" >
                <form action="MainController">
                    <c:set var="total" value="${total + (p.quantity * p.price)}"/>

                    <tr>
                        <td>${count.count}</td>
                        <td>
                            ${p.productID}
                            <input type="hidden" name="id" value="${p.productID}" readonly=""></td>
                        <td>${p.name}</td>
                        <td>${p.price}</td>
                        <td>
                            <input type="number" name="quantity" value="${p.quantity}" min="1" required=""></td>
                        <td>${p.quantity * p.price}</td>
                        <td><input type="submit" name="action" value="Edit"></td>
                        <td><input type="submit" name="action" value="Remove"></td>
                    </tr>
                </form>
            </c:forEach>


        </tbody>
    </table>
    <h1>Total: ${total} $ </h1>


    <a href="shopping.jsp">Add more</a>



</body>
</html>

