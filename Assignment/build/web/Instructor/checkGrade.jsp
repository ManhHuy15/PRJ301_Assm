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
        <title>Grading</title>
        <style>

        /* Style for buttons */
        button {
            background-color: #4CAF50; /* Green background color */
            border: none; /* Remove border */
            color: white; /* Text color */
            padding: 10px 20px; /* Add padding */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            font-size: 16px; /* Increase font size */
            margin: 4px 0px 4px 20px; /* Add margin */
            cursor: pointer; /* Add cursor pointer */
        }

        /* Style for headings */
        h1, h4 {
            color: #333; /* Dark text color */
            margin-left: 40px;
        }

        /* Style for success message */
        .success {
            color: green; /* Green text color */
        }

        /* Style for table */
        .tableGrade {
            border-collapse: collapse; /* Collapse table borders */
            width: 90%; /* Set table width to 100% */
            margin: 20px auto; /* Add top margin */
        }

        /* Style for table headers */
        .tableGrade th {
            background-color: #f2f2f2; /* Light gray background color */
            border: 1px solid #ddd; /* Add border */
            padding: 8px; /* Add padding */
            text-align: left; /* Align text to the left */
        }

        /* Style for table cells */
        .tableGrade td {
            border: 1px solid #ddd; /* Add border */
            padding: 8px; /* Add padding */
            text-align: left; /* Align text to the left */
        }

        /* Style for alternate row background color */
        .tableGrade tbody tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternate row background color */
        }

        /* Style for input fields */
        input[type="number"] {
            width: 60px; /* Set input width */
            padding: 5px; /* Add padding */
            text-align: center; /* Center text */
            border: 1px solid #ccc; /* Add border */
            border-radius: 4px; /* Add border radius */
        }

        /* Style for save button */
         input[type="submit"] {
            background-color: #4CAF50; /* Green background color */
            color: white; /* Text color */
            padding: 10px 20px; /* Add padding */
            border: none; /* Remove border */
            border-radius: 4px; /* Add border radius */
            cursor: pointer; /* Add cursor pointer */
            margin: 20px auto; /* Center the button horizontally */
            display: block; /* Ensure button takes full width */
        }
    </style>
        <script>
            function checkInput(input) {
                if (input.value < 0 || input.value > 10) {
                    input.value = 0; // Set the value to 0 if it's smaller than 0
                }
            }
        </script>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>

        <button onclick="window.location.href = 'AllGroup'" >Back </button>
        <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        <h1>Check grade</h1>
        <h4> ${requestScope.group.name} (${requestScope.group.couse.code}-${requestScope.group.couse.name})</h4>
        <div style="color: green">${requestScope.done}</div>
        <form action="Grade" method="post">
            <input type="hidden" name="group" value="${requestScope.group.id}"/>
            <table class="tableGrade" border="1px">
                <thead>
                <td>No</td>
                <td>Student code</td>
                <td>Student Name</td>
                <c:forEach items="${requestScope.grades}" var="g"> 
                    <td>${g.grade.name}-${Math.round(g.weight*10000)/100}%</td>
                </c:forEach>
                </thead>
                <c:set var = "no" value = "${1}"/>
                <tbody>
                    <c:forEach items="${requestScope.group.listStudent}" var="s">
                        <tr>
                            <td>${no}</td>
                            <c:set var = "no" value = "${no +1}"/>
                            <td>${s.code}</td>
                            <td>${s.fname} ${s.mname} ${s.lname}</td>
                            <c:forEach items="${requestScope.grades}" var="g"> 
                                <td>
                                    <c:set var="found" value="false" />
                                    <c:forEach items="${requestScope.assessments}" var="as">
                                        <c:if test="${s.id == as.student.id && g.grade.id == as.grade.id}">
                                            ${as.score} 
                                            <c:set var="found" value="true" />
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${!found}">
                                        <input type="number" name="score_${s.id}_${g.grade.id}"  min="0.00" max="10.00" step="0.01" oninput="checkInput(this)" />
                                    </c:if>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="save" onclick="window.confirm('Do you want to save')"/>
        </form>
    </body>
</html>
