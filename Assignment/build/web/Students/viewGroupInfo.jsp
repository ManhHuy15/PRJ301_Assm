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
        <style>
            button {
                background-color: #4CAF50; /* Green background color */
                border: none; /* Remove border */
                color: white; /* Text color */
                padding: 10px 20px; /* Add padding */
                text-align: center; /* Center text */
                text-decoration: none; /* Remove underline */
                font-size: 16px; /* Increase font size */
                margin: 4px 2px; /* Add margin */
                cursor: pointer; /* Add cursor pointer */
            }

            .group_info {
                width: 90%;
                border-collapse: collapse;
                margin: 20px auto;
            }

            .group_info td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .group_student {
                width: 80%;
                border-collapse: collapse;
                margin: 10px auto;
            }

            .group_student td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .group_student tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .group_student tr:hover {
                background-color: #ddd;
            }

            .group_student th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'Schedule'" >Schedule </button>
        <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        <table class="group_info">
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
        <table class="group_student" >
            <tr>
                <td>No</td>
                <td>Student Code</td>
                <td>First Name</td>
                <td>Mid Name</td>
                <td>Last Name</td>
                <td>Email</td>
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
                    <td>${s.email}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
