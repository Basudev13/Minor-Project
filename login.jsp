 <%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <%
            String username = request.getParameter("Username");
            String password = request.getParameter("password");

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");

                String query = "SELECT * FROM user WHERE Username=? AND Password=?";
                ps = con.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);

                rs = ps.executeQuery();

                if (rs.next()) {
                    String fname = rs.getString("Firstname");
                    String lname = rs.getString("Lastname");

                 
                    session.setAttribute("fname", fname);
                    session.setAttribute("lname", lname);

                    // Redirect to dashboard page
                    response.sendRedirect("Dashboard.jsp");
                } else {
                    out.println("<h3>Login unsuccessful. Please check your username or password.</h3>");
                }
            } catch (Exception e) {
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException ex) {
                    out.println("<h3>Error closing database resources: " + ex.getMessage() + "</h3>");
                }
            }
        %>
    </body>
</html>
