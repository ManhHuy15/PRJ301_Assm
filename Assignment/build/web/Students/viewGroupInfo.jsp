<%-- 
    Document   : viewGroupInfo
    Created on : Mar 7, 2024, 4:54:53 PM
    Author     : HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'Schedule'" >Schedule </button>
        <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        <table border="1ps">
            <tr>
                <td>Group</td>
                <td> ${requestScope.group.name}</td>
            </tr>
            <tr>
                <td>Course</td>
                <td>${requestScope.group.couse.name} (${requestScope.group.couse.code})</td>
            </tr>
            <tr>
                <td>Instructor</td>
                <td>${requestScope.group.ins.code}</td>
            </tr><tr>
                <td>Term</td>
                <td>${requestScope.group.term.name}</td>
            </tr>
        </table>
        <table border="1px">
            <tr>
                <td>No</td>
                <td>Student Code</td>
                <td>First Name</td>
                <td>Mid Name</td>
                <td>Last Name</td>
            </tr>
            <c:set var="n" value="1"></c:set>
            <c:forEach items="${requestScope.group.listStudent}" var="s">
                <tr>
                    <td>${n}</td>
                <c:set var="n" value="${n+1}"></c:set>
                <td>${s.code}</td>
                <td>${s.fname}</td>
                <td>${s.mname}</td>
                <td>${s.lname}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
