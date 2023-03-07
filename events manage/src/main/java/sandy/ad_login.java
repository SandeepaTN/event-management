package sandy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.io.*;
import java.sql.*;


public class ad_login extends HttpServlet {
   
	private static final long serialVersionUID = 888L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Get the user ID and password from the request
        String userId = request.getParameter("uname");
        String password = request.getParameter("pass");

        // Connect to the database
        Connection conn = null;
        try {
            // Load the MySQL driver
            

            // Connect to the database
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/event_management", "root","123456");

            // Create a statement
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE org_id =1");
             
            // Check if the user exists in the database
            if (rs.next()) {
                // Get the hashed password from the database
                String hashedPassword = rs.getString(3);
                 String user_name=rs.getString(1);
                // Check if the provided password matches the hashed password
                if(userId.equals(user_name)) {
                  if (password.equals(hashedPassword)) {
                   // ResultSet rr=stmt.executeQuery("select org_id from user where user_name='"+userId+"'");
                    int org_id2=rs.getInt(2);
                    System.out.println(org_id2);
                    HttpSession session=request.getSession();
                    session.setAttribute("username", userId);
                    session.setAttribute("org_id", org_id2);
                    response.sendRedirect("/events_manage/ admin.jsp");
                } else {
                    // Tnahe login is unsuccessful, display an error message
                    //request.setAttribute("errorMessage", "Incorrect password");
                   // request.getRequestDispatcher("/events_manage/login.jsp").forward(request, response);
                	response.sendRedirect("ad_login.jsp");
                }}
                  else {response.sendRedirect("ad_login.jsp");}
            } else {response.sendRedirect("ad_login.jsp");
                //request.setAttribute("errorMessage", "User ID not found");
                //request.getRequestDispatcher("/events_manage/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
