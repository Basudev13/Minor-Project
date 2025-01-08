<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Fetching parameters from the request
    String s1 = request.getParameter("Username");
    String pwd = request.getParameter("password");

    if (s1 != null && pwd != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "");

            // Prepare SQL query to update the password
            ps = con.prepareStatement("UPDATE user SET Password = ? WHERE Username = ?");
            ps.setString(1, pwd);
            ps.setString(2, s1);

            // Execute the update query
            int x = ps.executeUpdate();

            // Display the result
            if (x > 0) {
                out.println("<h2>Update Successful</h2>");
            } else {
                out.println("<h2>Update Unsuccessful</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                out.println("<h2>Error while closing resources: " + ex.getMessage() + "</h2>");
            }
        }
    } else {
        out.println("<h2>Please provide both Username and Password</h2>");
    }
%>
