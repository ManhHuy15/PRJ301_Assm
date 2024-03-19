<%-- 
    Document   : CourseAttend
    Created on : Mar 17, 2024, 1:29:49 PM
    Author     : HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View attendance for Student</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .container {
                margin: 20px 50px;
                display: flex;
            }

            .option {
                flex: 1;
                max-width: 650px;
                margin-right: 20px;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .content {
                flex: 2;
                max-width: 800px;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
                background-color: #45a049; /* Darker shade of green on hover */
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }


        </style>
        <script>
            function callSelect(tid, cid) {
                var phref = "CourseAttend?term=" + tid;
                if (cid != '') {
                    phref += '&cid=' + cid;
                }

                document.getElementById("frm").action = phref;
                document.getElementById("frm").submit();
            }
        </script>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        <div class="container">
            <div class="option">
                <form method="POST" action="CourseAttend" id="frm">
                    <table >
                        <tr style="background-color: orange ">
                            <th>Term</th>
                            <th>Course</th>
                        </tr>
                        <tr>
                            <td>
                                <table>   
                                    <c:forEach items="${requestScope.terms}" var="t">    
                                        <tr <c:if test="${requestScope.t == t.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelect(${t.id}, '')" > ${t.name}</td></tr>
                                    </c:forEach>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <c:forEach items="${requestScope.groups}" var="g">
                                        <tr <c:if test="${requestScope.c == g.couse.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelect(${g.term.id},${g.couse.id})">${g.couse.name} (${g.couse.code})-${g.name}</td></tr>
                                    </c:forEach>
                                </table>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <c:if test="${requestScope.attendants.size() >0}">
                <div class="content">
                    <table border='1px'>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Date</th>
                                <th>Slot</th>
                                <th>Room</th>
                                <th>Lecturer</th>
                                <th>Group</th>
                                <th>Status</th>
                                <th>Lecturer's Comment</th>
                            </tr>
                        </thead>

                        <c:set var="no" value="1"/>
                        <tbody>
                            <c:forEach items="${requestScope.attendants}" var="a">
                                <tr>
                                    <td>${no}</td> <c:set var="no" value="${no+1}"/>
                                    <td>${a.session.dateTime}</td>
                                    <td>Slot ${a.session.slot.id} <br/>
                                        (${a.session.slot.start} ${a.session.slot.end})</td>
                                    <td>${a.session.room}</td>
                                    <td>${a.session.ins.code}</td>
                                    <td>${a.session.group.name}</td>
                                    <c:if test="${a.status == 0}">
                                        <td> Not yet</td>
                                    </c:if>
                                    <c:if test="${a.status == 1}">
                                        <td  style="color: red;font-weight: bold">
                                            Absent
                                        </td>
                                    </c:if>
                                    <c:if test="${a.status == 2}">
                                        <td style="color: green; font-weight: bold">
                                            Attend
                                        </td>
                                    </c:if>
                                    <td>${a.comment}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7" style="font-weight: bold">
                                    ABSENT: ${requestScope.percent}% ABSENT SO FAR (${requestScope.absent} ABSENT ON ${requestScope.attendants.size()} TOTAL).
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </c:if>
        </div>
    </body>
</html>
