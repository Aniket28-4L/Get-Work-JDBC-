import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String email = request.getParameter("Gmail").trim();
        String password = request.getParameter("Password").trim();

        System.out.println("Received Email: " + email);
        System.out.println("Received Password: " + password);

        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement psUsername = null;
        ResultSet rs = null;
        ResultSet rsUsername = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
            System.out.println("Database connected successfully!");

            // Query to check if the email and password match in the login table
            String query = "SELECT user_gmail FROM login WHERE user_gmail=? AND user_pass=?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            System.out.println("Executing Query: " + ps.toString());

            // Execute the query
            rs = ps.executeQuery();

            // Check if a matching record was found
            if (rs.next()) {
                System.out.println("Login successful!");
                
                // Now fetch the username from registration table
                String usernameQuery = "SELECT username FROM registration WHERE gmail=?";
                psUsername = con.prepareStatement(usernameQuery);
                psUsername.setString(1, email);
                rsUsername = psUsername.executeQuery();
                
                if (rsUsername.next()) {
                    String username = rsUsername.getString("username");
                    
                    // Store the username in session
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", username);
                    
                    System.out.println("Username set in session: " + username);
                }
                
                response.sendRedirect("home.jsp"); // Redirect to home page
            } else {
                System.out.println("Invalid login credentials.");
                out.println("<script type='text/javascript'>");
                out.println("alert('Invalid email or password');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("Error: MySQL JDBC Driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rsUsername != null) rsUsername.close();
                if (psUsername != null) psUsername.close();
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}