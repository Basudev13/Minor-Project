<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete User</title>
    </head>
    <body>
        <%
            String s1 = request.getParameter("d1");
            if (s1 != null && !s1.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");
                    PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE Username = ?");
                    ps.setString(1, s1);
                    int x = ps.executeUpdate();

                    if (x > 0) {
                        out.println("<h3>Delete Success</h3>");
                    } else {
                        out.println("<h3>Delete Unsuccessful</h3>");
                    }

                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                }
            } else {
                out.println("<h3>Please provide a valid username to delete.</h3>");
            }
        %>
       
    </body>
</html>
