<%-- 
    Document   : createProduct
    Created on : Aug 21, 2023, 3:11:31 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
    </head>
    <body>
        Create new Product
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" required="">
            <br>Product Name<input type="text" name="name" required="">
            <br>Quantity<input type="number" name="quantity" min=1 >
            <br>Price<input type="number" name="price" required="">

            <br><input type="submit" name="action" value="CreateProduct">
            <input type="reset" value="Reset">
            ${requestScope.MESSAGE}
        </form>
    </body>
</html>
