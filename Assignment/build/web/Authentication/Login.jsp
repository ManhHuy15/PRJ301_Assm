<%-- 
    Document   : Login
    Created on : Feb 22, 2024, 8:10:04 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FPT University</title>
        <!--
        <script >
            <c:if test="${requestScope.error != null}"> alert(""+'${requestScope.error}')</c:if>
        </script>
        -->
    </head>
    <body>
        <h1>FPT University Academic Portal</h1>
        <form action="Login" method="POST">
            <input type="text" placeholder="User Name" name="username" required/></br>
            <input type="password" placeholder="Password" name="password" required/></br>
            <c:if test="${requestScope.error != null}"> <div style="color: red">${requestScope.error}</div></c:if>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
