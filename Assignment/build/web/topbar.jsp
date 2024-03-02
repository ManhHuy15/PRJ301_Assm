<%-- 
    Document   : topbar
    Created on : Feb 24, 2024, 9:47:17 AM
    Author     : HUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin: 10px  0px;
            }

            .topbar{
                display: flex;
                justify-content: right;
                align-items: center;
                border: 1px solid #ffb028;
                background-color: #ffb028;
                color: white;
                font-family: sans-serif;
                font-weight: bold;
                padding: 5px 10px;
            }

            .account {
                display: flex; /* Use Flexbox layout for account section */
                align-items: center; /* Center items vertically */
                margin: 0 10px;
            }

            .logout {
                cursor: pointer; /* Add cursor pointer for better UX */
                margin: 0 50px 0 10px;
            }

        </style>
    </head>
    <body>
        <div class="topbar">
            <div class="account">
                <img src="Images/user.png" width="40px" height="40px" />
                <a>${sessionScope.account.username}</a>
            </div>
            <div class="logout" onclick="window.location.href='Logout'">LogOut</div>
        </div>
    </body>
</html>
