<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <%
            // Invalidate the session
            
            if (session != null) {
                session.invalidate();
            }
            // Redirect to the login page
            response.sendRedirect("login.html");
        %>
    </body>
</html>
