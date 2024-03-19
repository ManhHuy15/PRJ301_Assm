<%-- 
    Document   : checkAttend
    Created on : Feb 29, 2024, 11:21:48 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chech Attenđance</title>
        <style>
        /* Style for top bar */
        .topbar {
            background-color: #333; /* Dark background color */
            color: white; /* Text color */
            padding: 10px; /* Add padding */
        }

        /* Style for buttons */
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

        /* Style for success message */
        .success-message {
            color: green; /* Green text color */
            font-weight: bold; /* Bold text */
            text-align: center; /* Center text */
            font-size: 24px; /* Increase font size */
        }

        /* Style for table */
        table {
            width: 100%; /* Set table width to 100% */
            margin: 20px 20px; 
            border-collapse: collapse; /* Collapse table borders */
        }

        /* Style for table header */
        th {
            background-color: #f2f2f2; /* Light gray background color */
            color: black; /* Text color */
            padding: 8px; /* Add padding */
            text-align: left; /* Align text to the left */
        }

        /* Style for table body */
        td {
            background-color: #ffffff; /* White background color */
            padding: 8px; /* Add padding */
            text-align: left; /* Align text to the left */
        }

        /* Style for radio buttons */
        input[type="radio"] {
            margin-right: 5px; /* Add margin to the right */
        }

        /* Style for text input */
        input[type="text"] {
            padding: 5px; /* Add padding */
        }

        /* Style for submit button */
        input[type="submit"] {
            background-color: #4CAF50; /* Green background color */
            color: white; /* Text color */
            padding: 10px 20px; /* Add padding */
            border: none; /* Remove border */
            border-radius: 4px; /* Add border radius */
            cursor: pointer; /* Add cursor pointer */
            margin-top: 20px; /* Add top margin */
            display: block; /* Display as block element */
            margin-left: auto; /* Align button to center horizontally */
            margin-right: auto; /* Align button to center horizontally */
        }
    </style>
    </head>
    <body>
        <%@include file="/topbar.jsp" %>
        <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        <button onclick="window.location.href = 'ScheduleInstructor'" >Schedule</button>

        <div <c:if test="${requestScope.done == null}"> style="visibility: hidden"</c:if>>
            <div style="color: green; font-weight: bold; text-align: center; font-size: 24px">${requestScope.done}</div>
        </div>
        <div <c:if test="${requestScope.done != null}"> style="visibility: hidden"</c:if>>
                <h1>Check Attend</h1>
                <form action= "CheckAttend" method="POST">
                    <input type="hidden" name="id" value="${param.id}"/>
                <table >
                    <thead >
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Code</th>
                            <th>Status</th>
                            <th>Comment</th>
                            <th>Record Time</th>
                        </tr>
                    </thead>
                    <tbody >
                        <c:set var = "no" value = "${1}"/>
                        <c:forEach items="${requestScope.atts}" var="att">
                            <tr>
                                <td>${no}</td>
                                <c:set var = "no" value = "${no +1}"/>
                                <td>${att.student.fname} ${att.student.mname} ${att.student.lname}</td>
                                <td>${att.student.code}</td>
                                <td>
                                    <input type="radio"  ${att.status != 2 ? "checked=\"checked\"":""}
                                           name="status${att.student.id}" value="No"> Absent
                                    <input type="radio"   ${att.status == 2 ? "checked=\"checked\"":""}
                                           name="status${att.student.id}"value="Yes"> Present
                                </td>
                                <td><input name="cmt${att.student.id}" type="text" value="${att.comment}"></td>
                                <td>${att.recordTime}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <input type="submit" value="Save">
            </form>
        </div>
    </body>
</html>
