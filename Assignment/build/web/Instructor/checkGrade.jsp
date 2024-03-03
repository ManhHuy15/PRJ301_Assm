<%-- 
    Document   : checkGrade
    Created on : Mar 3, 2024, 9:17:01 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Check grade</h1>
        <form action="">
            <table border="1px"
                   <thead>
                <td>No</td>
                <td>Student code</td>
                <td>Student Name</td>
                <c:forEach items="${requestScope.grades}" var="g"> 
                    <td>${g.grade.name}</td>
                </c:forEach>
                </thead>
                <c:set var = "no" value = "${1}"/>
                <tbody>
                    <c:forEach items="${requestScope.listStudent}" var="s">
                        <tr>
                            <td>${no}</td>
                            <c:set var = "no" value = "${no +1}"/>
                            <td>${s.code}</td>
                            <td>${s.fname} ${s.mname} ${s.lname}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </body>
</html>
