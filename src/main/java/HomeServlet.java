import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session handling
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");
        if (userName == null) userName = "Guest";
        request.setAttribute("userName", userName);

        // Initialize empty lists
        List<String> homeImages = new ArrayList<>();
        List<String> adImages = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/getWork", "root", "");
             Statement stmt = con.createStatement()) {
            
            // 1. Load ONLY ACTIVE home images (type='home' AND is_active=1)
            ResultSet rs = stmt.executeQuery(
                "SELECT image_path, is_active FROM home_carousel " +
                "WHERE image_type='home' " +
                "ORDER BY display_order");
            
            while(rs.next()) {
                if (rs.getInt("is_active") == 1) {
                    homeImages.add(rs.getString("image_path"));
                }
            }
            rs.close();

            // 2. Load ONLY ACTIVE ad images (type='ad' AND is_active=1)
            rs = stmt.executeQuery(
                "SELECT image_path, is_active FROM home_carousel " +
                "WHERE image_type='ad' " +
                "ORDER BY display_order");
            
            while(rs.next()) {
                if (rs.getInt("is_active") == 1) {
                    adImages.add(rs.getString("image_path"));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            // Fallback only if database connection fails
            if (homeImages.isEmpty()) {
                homeImages.add("images/home.png");
                homeImages.add("images/phy.png");
                homeImages.add("images/phy_2.png");
            }
            if (adImages.isEmpty()) {
                adImages.add("images/ad1.png");
                adImages.add("images/ad2.png");
                adImages.add("images/ad3.png");
                adImages.add("images/ad4.png");
                adImages.add("images/ad5.png");
                adImages.add("images/1734687235149-cd2754.webp");
            }
        }

        // Set attributes with ONLY active images
        request.setAttribute("homeImages", homeImages);
        request.setAttribute("adImages", adImages);

        // Add debug output
        System.out.println("Active Home Images: " + homeImages);
        System.out.println("Active Ad Images: " + adImages);

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}