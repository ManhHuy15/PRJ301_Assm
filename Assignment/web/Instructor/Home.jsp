<%-- 
    Document   : Home
    Created on : Feb 22, 2024, 8:23:04 PM
    Author     : HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            /* Reset default margin and padding */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Body styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            /* Container styles */
            .container {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Title styles */
            .title {
                font-size: 24px;
                margin-bottom: 20px;
                text-align: center;
            }

            /* Button styles */
            .button {
                display: block;
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                background-color: #007bff;
                color: #fff;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <%@include file="../topbar.jsp" %>
        <div class="container">
            <h2 class="title">FPT University Academic Portal</h2>
            <a href="ScheduleInstructor" class="button">View Time Table</a>
            <a href="AllGroup" class="button">View All Group</a>
            <a href="Syllabus" class="button">Syllabus</a>
        </div>
    </body>
</html>
