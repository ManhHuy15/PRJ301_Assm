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
        <title>JSP Page</title>
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
        <div class="content">
            <table>
                
            </table>
        </div>
    </body>
</html>
