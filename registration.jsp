<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
    </head>
    <body>
        <%
            String Firstname = request.getParameter("Firstname");
            String Lastname = request.getParameter("Lastname");
            String Username = request.getParameter("Username");
            int Age = Integer.parseInt(request.getParameter("Age"));
            long MobileNo = Long.parseLong(request.getParameter("MobileNo"));
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");
            String Address = request.getParameter("Address");

            Connection con = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");

                String query = "INSERT INTO user (Firstname, Lastname, Username, Age, MobileNo, Email, Password, Address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(query);

                ps.setString(1, Firstname);
                ps.setString(2, Lastname);
                ps.setString(3, Username);
                ps.setInt(4, Age);
                ps.setLong(5, MobileNo);
                ps.setString(6, Email);
                ps.setString(7, Password);
                ps.setString(8, Address);

                int x = ps.executeUpdate();

                if (x > 0) {
                    out.println("<h3>Registration Successful</h3>");
                } else {
                    out.println("<h3>Registration Failed</h3>");
                }
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    out.println("<h3>Error Closing Connection: " + ex.getMessage() + "</h3>");
                }
            }
        %>
    </body>
</html>
