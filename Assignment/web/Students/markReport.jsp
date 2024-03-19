<%-- 
    Document   : markReport
    Created on : Feb 27, 2024, 3:43:55 PM
    Author     : HUY
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mark Report</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .container {          
                margin: 20px 100px;
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

            .view {
                flex: 2;
                max-width: 450px;
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


            .average {
                font-weight: bold;
            }

            .pass {
                color: green;
            }

            .fail {
                color: red;
            }
        </style>
        <script >
            function callSelect(tid, cid) {
                var phref = "MarkReportStudent?term=" + tid;
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
                <form method="POST" action="MarkReportStudent" id="frm">
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
            <c:if test="${requestScope.c > 0}">
                <div class="view">
                    <table >
                        <thead style="background-color: orange">
                            <tr>
                                <th>Grade Category</th>
                                <th>Grade Iterm</th>
                                <th>Weight</th>
                                <th>Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.courseGrades}" var="cg">
                                <tr>
                                    <td>${cg.grade.cate.name}</td>
                                    <td>${cg.grade.name}</td>
                                    <td class="weight" value="${cg.weight}">${Math.round(cg.weight*10000)/100}%</td>
                                    <c:forEach items="${requestScope.asses}" var="ase">
                                        <c:if test="${cg.grade.id == ase.grade.id }">
                                            <td class="score" value="${ase.score}">${ase.score}</td>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot style="font-weight: bold">
                            <tr>
                                <td></td>
                                <td >AVERAGE: </td>
                                <td id="avg">${requestScope.avg}</td>
                            </tr>
                            <tr >
                                <td></td>
                                <td >STATUS: </td>
                                <c:choose>
                                    <c:when test="${requestScope.avg >= 5 and requestScope.status.equals('PASS')}">
                                        <td  style="color: green">${requestScope.status}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td  style="color: red">${requestScope.status}</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </c:if>
        </div>
    </body>
</html>

