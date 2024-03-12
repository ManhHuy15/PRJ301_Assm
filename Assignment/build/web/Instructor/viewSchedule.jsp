<%-- 
    Document   : viewSchedule
    Created on : Feb 29, 2024, 10:04:52 PM
    Author     : HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin: 4px 2px; /* Add margin */
                cursor: pointer; /* Add cursor pointer */
            }

            /* Style for headings */
            h1 {
                color: #333; /* Dark text color */
            }

            /* Style for table */
            table {
                border-collapse: collapse; /* Collapse table borders */
                width: 100%; /* Set table width to 100% */
                margin-top: 20px; /* Add top margin */
            }

            /* Style for table headers */
            th {
                background-color: #f2f2f2; /* Light gray background color */
                border: 1px solid #ddd; /* Add border */
                padding: 8px; /* Add padding */
                text-align: left; /* Align text to the left */
            }

            /* Style for table cells */
            td {
                border: 1px solid #ddd; /* Add border */
                padding: 8px; /* Add padding */
                text-align: left; /* Align text to the left */
            }

            /* Style for alternate row background color */
            tbody tr:nth-child(even) {
                background-color: #f2f2f2; /* Alternate row background color */
            }

            /* Style for links */
            a {
                color: inherit; /* Inherit text color */
            }

            /* Style for absent status */
            .absent {
                color: red; /* Red text color */
                font-family: sans-serif; /* Sans-serif font */
            }

            /* Style for attended status */
            .attended {
                color: green; /* Green text color */
                font-family: sans-serif; /* Sans-serif font */
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
        <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        <h1>Schedule</h1>
        <div>
            <table >
                <thead >
                    <tr>
                        <th><form action="ScheduleInstructor" method="GET"  id="frm"><input type="date" id="ymd" name="ymd" onchange="changeDate()" value="${requestScope.date}" /></form></th>
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
                                            ${sess.course.code}- 
                                            <a href="CheckAttend?id=${sess.id}">
                                                <c:if test="${sess.status == 2}">Edit</c:if>
                                                <c:if test="${sess.status != 2}">Take</c:if>
                                                </a></br> 
                                                at ${sess.room}</br> 
                                            <c:if test="${sess.status == 0}"> <a style="color: red; font-family: sans-serif">*Not yet</a> </c:if>
                                            <c:if test="${sess.status == 1}"> <a style="color: red; font-family: sans-serif">*Absent</a> </c:if>
                                            <c:if test="${sess.status == 2}"> <a style="color: green; font-family: sans-serif" >*Attended</a> </c:if>
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
