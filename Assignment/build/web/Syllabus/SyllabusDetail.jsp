<%-- 
    Document   : SyllabusDetail
    Created on : Mar 10, 2024, 3:49:18 PM
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
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                color: #333;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            h2 {
                color: #333;
                text-align: center; /* Center the heading */
            }

            button {
                background-color: #28a745; /* Change button background color to green */
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                margin: 10px 0;
            }

            button:hover {
                background-color: #218838; /* Change button background color on hover */
            }

            table {
                width: 90%;
                border-collapse: collapse;
                margin: 20px auto;
            }

            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            table th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <button onclick="window.location.href = 'Syllabus'">Back</button>
        <c:if test="${sessionScope.account.role.id == 1}">
            <button onclick="window.location.href = 'HomeInstructor'" >Home </button>
        </c:if>
        <c:if test="${sessionScope.account.role.id == 2}">
            <button onclick="window.location.href = 'HomeStudent'" >Home </button>
        </c:if>
        <h2>FPT Education Learning Materials</h2>
        <table>
            <tr>
                <td>Course Name</td>
                <td>${requestScope.course.name}</td>
            </tr>
            <tr>
                <td>Course Code</td>
                <td>${requestScope.course.code}</td>
            </tr>
            <tr>
                <td>No Credit</td>
                <td>${requestScope.course.detail.noCredit}</td>
            </tr>
            <tr>
                <td>Time Study</td>
                <td>${requestScope.course.detail.timeStudy}</td>
            </tr>
            <tr>
                <td>Time Study</td>
                <td>${requestScope.course.detail.timeStudy}</td>
            </tr>
            <tr>
                <td>Pre-Requisite</td>
                <td>${requestScope.course.detail.preReq}</td>
            </tr>
            <tr>
                <td>Description</td>
                <td>${requestScope.course.detail.descr}</td>
            </tr>
            <tr>
                <td>StudentTasks</td>
                <td>${requestScope.course.detail.task}</td>
            </tr>
            <tr>
                <td>Tools</td>
                <td>${requestScope.course.detail.tools}</td>
            </tr>
        </table>


        <table>
            <tr>
                <th >Name</th>
                <th >Type</th>
                <th >Weight</th>
                <th >Required</th>
                <th >Duration</th>
                <th >Question Type</th>
                <th >No Question</th>
                <th >Grading Guide</th>
                <th >Description</th>
            </tr>
            <c:forEach items="${requestScope.courseGrade}" var="c" >
                <tr>
                    <th >${c.grade.name}</th>
                    <th >${c.grade.type}</th>
                    <th >${c.weight}</th>
                    <th >${c.required}</th>
                    <th >${c.grade.detail.dur}</th>
                    <th >${c.grade.detail.qType}</th>
                    <th >${c.grade.detail.noQ}</th>
                    <th >${c.grade.detail.grGuide}</th>
                    <th >${c.grade.detail.descr}</th>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
