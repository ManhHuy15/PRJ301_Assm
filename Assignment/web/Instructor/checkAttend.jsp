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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/topbar.jsp" %>
        <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        <h1>Check Attend</h1>
        <form action= "CheckAttend" method="POST">
             <input type="hidden" name="id" value="${param.id}"/>
            <table >
                <thead style="background-color: orange">
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Status</th>
                        <th>Comment</th>
                        <th>Record Time</th>
                    </tr>
                </thead>
                <tbody style="background-color: antiquewhite">
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
    </body>
</html>
