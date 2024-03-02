<%-- 
    Document   : viewSchedule
    Created on : Feb 16, 2024, 2:02:56 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <script >
            function changeDate() {
                document.getElementById('frm').submit();
            }
        </script>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        <h1>Schedule</h1>
        <div>
            <table >
                <thead style="background-color: pink" >
                    <tr>
                        <th><form action="Schedule" method="GET"  id="frm"><input type="date" id="ymd" name="ymd" onchange="changeDate()" value="${requestScope.date}" /></form></th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                    <tr>
                        <th></th>
                            <c:forEach items="${requestScope.dates}" var="d">
                            <th>${d.toLocalDate().getDayOfMonth()}/${d.toLocalDate().getMonthValue()}</th>
                            </c:forEach>
                    </tr>
                </thead>
                <tbody style="background-color: moccasin" >
                    <c:forEach items="${requestScope.slots}" var="slot">
                        <tr>
                            <td>Slot ${slot.id}</td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td>
                                    <c:forEach items="${requestScope.sessions}" var="sess">
                                        <c:if test="${ (sess.dateTime eq d) and (slot.id eq sess.slot.id) }">
                                            ${sess.course.code} - <a >View Materials</a> </br>
                                            at ${sess.room}</br> 
                                            <c:if test="${sess.status == 0}"> <a style="color: red; font-family: sans-serif">*Not yet</a> </c:if>
                                            <c:if test="${sess.status == 1}"> <a style="color: red; font-family: sans-serif; font-weight: bold">Absent</a> </c:if>
                                            <c:if test="${sess.status == 2}"> <a style="color: green; font-family: sans-serif; font-weight: bold" >Attended</a> </c:if>
                                            <br><a>(${sess.slot.start} -  ${sess.slot.end})</a>
                                    </c:if>
                                </c:forEach>
                                </td>

                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
