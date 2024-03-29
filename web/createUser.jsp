<%-- 
    Document   : createUser
    Created on : Aug 15, 2023, 8:17:11 AM
    Author     : acer
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
    </head>
    <body>
        Create new User      
        <div class="create-user-container">
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>${requestScope.USER_ERROR.userIDError} 
            </br>Full Name<input type="text" name="fullName" required=""/> ${requestScope.USER_ERROR.fullNameError}
            </br>Email<input type="text" name="email"/> 
            </br>Phone<input type="text" name="phone"/>
            </br>Role ID<input type="text" name="roleID" value="CU" readonly=""/> 
            </br>Password<input type="password" name="password" required=""/> 
            </br>Confirm<input type="password" name="confirm" required=""/> ${requestScope.USER_ERROR.confirmError}
            </br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="reset"/>
        </form>
            </div>
            ${requestScope.ERROR}
    </body>
</html>
