<%-- 
    Document   : viewAllGroup
    Created on : Mar 5, 2024, 9:52:42 PM
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
            /* Style for the top bar */
            .topbar {
                background-color: #333; /* Dark background color */
                color: white; /* Text color */
                padding: 10px; /* Add padding */
            }

            /* Style for the button */
            button {
                background-color: #4CAF50; /* Green background color */
                border: none; /* Remove border */
                color: white; /* Text color */
                padding: 10px 20px; /* Add padding */
                text-align: center; /* Center text */
                text-decoration: none; /* Remove underline */
                font-size: 16px; /* Increase font size */
                margin: 4px 30px; /* Add margin */
                cursor: pointer; /* Add cursor pointer */
            }

            /* Style for the table */
            table.container {
                width: 90%; /* Set table width to 80% */
                margin: 20px auto; /* Center the table horizontally */
                border-collapse: collapse; /* Collapse table borders */
            }

            /* Style for table headers */
            th {
                background-color: #orange; /* Header background color */
                color: white; /* Text color */
                padding: 8px; /* Add padding */
                text-align: left; /* Align text to the left */
                border: 1px solid #ddd; /* Add border */
            }

            /* Style for table cells */
            td {
                border: 1px solid #ddd; /* Add border */
                padding: 8px; /* Add padding */
                text-align: left; /* Align text to the left */
            }

            /* Style for alternate row background color */
            tr:nth-child(even) {
                background-color: #f2f2f2; /* Alternate row background color */
            }

            /* Style for student content */
            .student_content {
                margin: 20px auto; /* Center the student content horizontally */
                width: 80%; /* Set student content width to 80% */
            }

            /* Style for class information */
            .class_info {
                font-size: 20px; /* Increase font size */
            }
        </style>

        <script >
            function callSelecct(tid, cid, gid) {
                var phref = "AllGroup?term=" + tid;
                if (cid != '') {
                    phref += '&cid=' + cid;
                }
                if (gid != '') {
                    phref += '&gid=' + gid;
                }

                document.getElementById("frm").action = phref;
                document.getElementById("frm").submit();
            }
        </script>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        <form method="POST" action="AllGroup" id="frm">
            <table class="container" >
                <tr style="background-color: orange ">
                    <th>Term</th>
                    <th>Course</th>
                    <th>Group</th>
                </tr>
                <tr>
                    <td>
                        <table>   
                            <c:forEach items="${requestScope.terms}" var="t">    
                                <tr <c:if test="${requestScope.t == t.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelecct(${t.id}, '', '')" > ${t.name}</td></tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table>
                            <c:forEach items="${requestScope.course}" var="c">
                                <tr <c:if test="${requestScope.c == c.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelecct(${requestScope.t},${c.id}, '')">${c.name} (${c.code})</td></tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table>
                            <c:forEach items="${requestScope.groups}" var="g">
                                <tr<c:if test="${requestScope.g == g.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelecct(${requestScope.t},${requestScope.c},${g.id})">${g.name} </td></tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
        <c:if test="${requestScope.groupStudent.id > 0}">
            <div class="student_content">
                <h4 class="class_info">${requestScope.groupStudent.name} <a href="Grade?gid=${requestScope.groupStudent.id}">Grading Course</a></h4>
                <table border="1px">
                    <tr>
                        <td>No</td>
                        <td>Student Code</td>
                        <td>First Name</td>
                        <td>Mid Name</td>
                        <td>Last Name</td>
                        <td>Absent</td>
                        <td>Gender</td>
                        <td>Email</td>
                    </tr>
                    <c:set var="n" value="1"></c:set>
                    <c:forEach items="${requestScope.groupStudent.listStudent}" var="s">
                        <tr>
                            <td>${n}</td>
                            <c:set var="n" value="${n+1}"></c:set>
                            <td>${s.code}</td>
                            <td>${s.fname}</td>
                            <td>${s.mname}</td>
                            <td>${s.lname}</td>
                            <c:forEach items="${requestScope.percentAbsent}" var="abs">
                                <c:if test="${s.id == abs.key}"><td>${abs.value}%</td></c:if>
                            </c:forEach>
                            <c:if test="${s.gender}"><td>Male</td></c:if>
                            <c:if test="${!s.gender}"><td>Female</td></c:if>
                            <td>${s.email}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>
    </body>
</html>
