import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String gmail = request.getParameter("email");
        String password = request.getParameter("password");
        String con_pass = request.getParameter("confirmPassword");

        // Validate password match
        if (!password.equals(con_pass)) {
            response.getWriter().println("Passwords do not match!");
            return;
        }

        // Database connection and insertion
        Connection con = null;
        PreparedStatement psRegistration = null;
        PreparedStatement psLogin = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");

            // Insert into registration table
            String sqlRegistration = "INSERT INTO registration (username, gmail, password, con_pass) VALUES (?, ?, ?, ?)";
            psRegistration = con.prepareStatement(sqlRegistration);
            psRegistration.setString(1, username);
            psRegistration.setString(2, gmail);
            psRegistration.setString(3, password);
            psRegistration.setString(4, con_pass);
            int rowsRegistration = psRegistration.executeUpdate();

            // Insert into login table
            String sqlLogin = "INSERT INTO login (user_gmail, user_pass) VALUES (?, ?)";
            psLogin = con.prepareStatement(sqlLogin);
            psLogin.setString(1, gmail);
            psLogin.setString(2, password);
            int rowsLogin = psLogin.executeUpdate();

            // Check if both insertions were successful
            if (rowsRegistration > 0 && rowsLogin > 0) {
                System.out.println("Registration successful! Data saved in both tables.");

                // Store the username in the session
                HttpSession session = request.getSession();
                session.setAttribute("userName", username);

                // Redirect to home page
                response.sendRedirect("home.jsp");
            } else {
                response.getWriter().println("Registration failed!");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error: MySQL JDBC Driver not found!");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (psRegistration != null) psRegistration.close();
                if (psLogin != null) psLogin.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}