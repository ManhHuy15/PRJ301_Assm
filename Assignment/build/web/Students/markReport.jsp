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
        <title>JSP Page</title>
        <script >
            function callChangeTerm(tid) {
                document.getElementById("frm").action = "MarkReportStudent?term=" + tid;
                document.getElementById("frm").submit();
            }

            function callSelecctCourse(tid, cid) {
                document.getElementById("frm").action = "MarkReportStudent?term=" + tid + '&cid=' + cid;
                document.getElementById("frm").submit();
            }

         
        </script>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'HomeStudent'" >Home </button>
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
                                <tr <c:if test="${requestScope.t == t.id}"> style="font-weight: bolder"</c:if>><td onclick="callChangeTerm(${t.id})" > ${t.name}</td></tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td>
                        <table>
                            <c:forEach items="${requestScope.groups}" var="g">
                                <tr <c:if test="${requestScope.c == g.couse.id}"> style="font-weight: bolder"</c:if>><td onclick="callSelecctCourse(${g.term.id},${g.couse.id})">${g.couse.name} (${g.couse.code})-${g.name}</td></tr>
                            </c:forEach>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
        <c:if test="${requestScope.c > 0}">
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
                            <td class="weight" value="${cg.weight}">${cg.weight}</td>
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
                            <c:when test="${requestScope.avg >= 5}">
                                 <td  style="color: green">PASS</td>
                            </c:when>
                            <c:otherwise>
                                <td  style="color: red">NOT PASS</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </tfoot>
            </table>
        </c:if>
    </body>
</html>

