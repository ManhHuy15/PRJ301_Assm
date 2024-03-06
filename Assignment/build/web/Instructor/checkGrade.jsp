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
            <table border="1px">
                <thead>
                <td>No</td>
                <td>Student code</td>
                <td>Student Name</td>
                <c:forEach items="${requestScope.grades}" var="g"> 
                    <td>${g.grade.id}-${g.grade.name}-${g.weight}</td>
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
