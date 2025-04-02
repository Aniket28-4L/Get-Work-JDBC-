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
import java.util.Collections;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Session handling (unchanged)
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");
        if (userName == null) userName = "Guest";
        request.setAttribute("userName", userName);

        // Initialize empty lists
        List<String> homeImages = new ArrayList<>();
        List<String> adImages = new ArrayList<>();

        System.out.println("Attempting database connection...");
        
        try (Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/getWork", "root", "");
             Statement stmt = con.createStatement()) {
            
            System.out.println("Database connection successful!");
            
            // 1. Load home images with path verification
            ResultSet rs = stmt.executeQuery(
                "SELECT image_path FROM home_carousel " +
                "WHERE image_type='home' AND is_active=1 " +
                "ORDER BY display_order");
            
            while(rs.next()) {
                String path = rs.getString("image_path");
                if (path != null && !path.trim().isEmpty()) {
                    path = path.startsWith("images/") ? path : "images/" + path;
                    System.out.println("Adding home image: " + path);
                    homeImages.add(path);
                }
            }
            rs.close();

            // 2. Load ad images with path verification
            rs = stmt.executeQuery(
                "SELECT image_path FROM home_carousel " +
                "WHERE image_type='ad' AND is_active=1 " +
                "ORDER BY display_order");
            
            while(rs.next()) {
                String path = rs.getString("image_path");
                if (path != null && !path.trim().isEmpty()) {
                    path = path.startsWith("images/") ? path : "images/" + path;
                    System.out.println("Adding ad image: " + path);
                    adImages.add(path);
                }
            }
            
        } catch (Exception e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            
            // Enhanced fallback mechanism
            if (homeImages.isEmpty()) {
                Collections.addAll(homeImages, 
                    "images/home.png", 
                    "images/phy.png", 
                    "images/phy_2.png");
            }
            if (adImages.isEmpty()) {
                Collections.addAll(adImages,
                    "images/ad1.png",
                    "images/ad2.png",
                    "images/ad3.png",
                    "images/ad4.png",
                    "images/ad5.png");
            }
        }

        // Set attributes (unchanged)
        request.setAttribute("homeImages", homeImages);
        request.setAttribute("adImages", adImages);

        // Enhanced debug output
        System.out.println("=== Image Report ===");
        System.out.println("Home Images (" + homeImages.size() + "):");
        homeImages.forEach(img -> System.out.println(" - " + img));
        System.out.println("Ad Images (" + adImages.size() + "):");
        adImages.forEach(img -> System.out.println(" - " + img));

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}