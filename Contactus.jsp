<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Us</title>
    </head>
    <body>
        <%
            // Retrieve form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            long mobno = Long.parseLong(request.getParameter("mobno"));
            String comment = request.getParameter("comment");

            Connection con = null;
            PreparedStatement ps = null;

            try {
                // Database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");

                // Insert query
                String query = "INSERT INTO users (name, email, mobno, comment) VALUES (?, ?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setLong(3, mobno);
                ps.setString(4, comment);

                int x = ps.executeUpdate();

                if (x > 0) {
                    out.println("<h3>Thanks for your comment!</h3>");
                } else {
                    out.println("<h3>Submission unsuccessful. Please try again.</h3>");
                }
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    out.println("<h3>Error closing database resources: " + ex.getMessage() + "</h3>");
                }
            }
        %>
    </body>
</html>
