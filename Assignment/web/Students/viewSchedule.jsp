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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            h1 {
                color: #333;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }

            th {
                background-color: #f0f0f0;
            }

            button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 4px;
            }

            button:hover {
                background-color: #45a049;
            }
            a{
                text-decoration: none;
            }

            span {
                color: #007bff;
                text-decoration: none;
            }
        </style>
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
                <tbody  >
                    <c:forEach items="${requestScope.slots}" var="slot">
                        <tr>
                            <td>Slot ${slot.id}</td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td>
                                    <c:forEach items="${requestScope.sessions}" var="sess">
                                        <c:if test="${ (sess.dateTime eq d) and (slot.id eq sess.slot.id) }">
                                            <a href="GroupInfo?gid=${sess.group.id}" >${sess.course.code}</a> - <a >View Materials</a> </br>
                                            at ${sess.room}</br> 
                                            <c:if test="${sess.status == 0}"> <span<a style="color: red; font-family: sans-serif">*Not yet</span> </c:if>
                                            <c:if test="${sess.status == 1}"> <span style="color: red; font-family: sans-serif; font-weight: bold">Absent</span> </c:if>
                                            <c:if test="${sess.status == 2}"> <span style="color: green; font-family: sans-serif; font-weight: bold" >Attended</span> </c:if>
                                            <br><span>(${sess.slot.start} -  ${sess.slot.end})</span>
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
