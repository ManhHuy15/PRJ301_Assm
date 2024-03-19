<%-- 
    Document   : Syllabus
    Created on : Mar 10, 2024, 5:19:41 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Syllabus</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f0f0f0;
            }


            /* Style for buttons */
            button {
                background-color: #28a745; /* Change button background color to green */
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                margin: 10px 0;
            }

            button:hover {
                background-color: #218838; /* Change button background color on hover */
            }

            /* Style for headings */
            h2 {
                color: #333;
                text-align: center; /* Center the heading */
            }

            /* Style for forms */
            form {
                margin: 20px 0;
                text-align: center; /* Center the form */
            }

            form input[type="text"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                display: inline-block; /* Make the input inline-block */
            }

            form input[type="submit"] {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 8px 20px;
                cursor: pointer;
                border-radius: 4px;
                display: inline-block; /* Make the button inline-block */
            }

            form input[type="submit"]:hover {
                background-color: #218838;
            }

            /* Style for tables */
            table {
                border-collapse: collapse;
                width: 70%;
                margin: 10px auto
            }

            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            table th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>

        <c:if test="${sessionScope.account.role.id == 1}">
            <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        </c:if>
        <c:if test="${sessionScope.account.role.id == 2}">
            <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        </c:if>


        <h2>FPT Education Learning Materials</h2>   
        <form action="Syllabus" method="post">
            Code <input type="text" name="code" value="${requestScope.code}" required />
            <input type="submit" value="Search"/>
        </form>
        <c:if test="${requestScope.courses != null}">
            <table>
                <tr>
                    <th>Course NO</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th></th>
                </tr>
                <c:forEach items="${requestScope.courses}" var="c">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.code}</td>
                        <td>${c.name}</td>
                        <td><a href="SyllabusDetails?course=${c.code}">view Material</a></td>
                    </tr>
                </c:forEach>               
            </table>   
        </c:if>
    </body>
</html>
