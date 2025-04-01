import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.nio.file.*;

@WebServlet("/CarouselServlet")
@MultipartConfig
public class CarouselServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";
    private static final int MAX_HOME_IMAGES = 3;
    private static final int MAX_AD_IMAGES = 5;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("edit".equals(action)) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
                
                String sql = "SELECT * FROM home_carousel WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
                    request.setAttribute("editImage", "true");
                    request.setAttribute("imageId", String.valueOf(id));
                    request.setAttribute("currentImage", rs.getString("image_path"));
                }
                
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Count active images to determine if we need to show add boxes
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
            
            // Count active home images
            String homeSql = "SELECT COUNT(*) FROM home_carousel WHERE image_type='home' AND is_active=1";
            Statement homeStmt = conn.createStatement();
            ResultSet homeRs = homeStmt.executeQuery(homeSql);
            homeRs.next();
            int activeHomeImages = homeRs.getInt(1);
            request.setAttribute("showAddHome", activeHomeImages < MAX_HOME_IMAGES);
            
            // Count active ad images
            String adSql = "SELECT COUNT(*) FROM home_carousel WHERE image_type='ad' AND is_active=1";
            Statement adStmt = conn.createStatement();
            ResultSet adRs = adStmt.executeQuery(adSql);
            adRs.next();
            int activeAdImages = adRs.getInt(1);
            request.setAttribute("showAddAd", activeAdImages < MAX_AD_IMAGES);
            
            // Get inactive images that can be restored
            String inactiveSql = "SELECT * FROM home_carousel WHERE is_active=0";
            Statement inactiveStmt = conn.createStatement();
            ResultSet inactiveRs = inactiveStmt.executeQuery(inactiveSql);
            request.setAttribute("inactiveImages", inactiveRs);
            
            homeRs.close();
            homeStmt.close();
            adRs.close();
            adStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/Admin/Carousel.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "")) {
            conn.setAutoCommit(false);
            
            if ("updateImage".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Part filePart = request.getPart("newImage");
                
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);
                    
                    String sql = "UPDATE home_carousel SET image_path = ? WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, UPLOAD_DIR + "/" + fileName);
                        stmt.setInt(2, id);
                        stmt.executeUpdate();
                        conn.commit();
                    }
                }
            }
            else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                
                String sql = "UPDATE home_carousel SET is_active = 0 WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, id);
                    stmt.executeUpdate();
                    conn.commit();
                }
            }
            else if ("restore".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                
                // First check if we have space to restore
                String type = request.getParameter("type");
                String countSql = "SELECT COUNT(*) FROM home_carousel WHERE image_type=? AND is_active=1";
                PreparedStatement countStmt = conn.prepareStatement(countSql);
                countStmt.setString(1, type);
                ResultSet rs = countStmt.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                
                if ((type.equals("home") && count < MAX_HOME_IMAGES) || 
                    (type.equals("ad") && count < MAX_AD_IMAGES)) {
                    
                    String restoreSql = "UPDATE home_carousel SET is_active = 1 WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(restoreSql)) {
                        stmt.setInt(1, id);
                        stmt.executeUpdate();
                        conn.commit();
                    }
                }
                
                rs.close();
                countStmt.close();
            }
            else if ("add".equals(action)) {
                String type = request.getParameter("type");
                Part filePart = request.getPart("image");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                
                // Verify we have space for new image
                String countSql = "SELECT COUNT(*) FROM home_carousel WHERE image_type=? AND is_active=1";
                PreparedStatement countStmt = conn.prepareStatement(countSql);
                countStmt.setString(1, type);
                ResultSet rs = countStmt.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                
                if ((type.equals("home") && count < MAX_HOME_IMAGES) || 
                    (type.equals("ad") && count < MAX_AD_IMAGES)) {
                    
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);
                    
                    String sql = "INSERT INTO home_carousel (image_path, image_type, display_order, is_active) VALUES (?, ?, ?, 1)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setString(1, UPLOAD_DIR + "/" + fileName);
                        stmt.setString(2, type);
                        stmt.setInt(3, getNextDisplayOrder(conn, type));
                        stmt.executeUpdate();
                        conn.commit();
                    }
                }
                
                rs.close();
                countStmt.close();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect(request.getContextPath() + "/Admin/Carousel.jsp");
    }
    
    private int getNextDisplayOrder(Connection conn, String type) throws SQLException {
        String sql = "SELECT COALESCE(MAX(display_order), 0) + 1 FROM home_carousel WHERE image_type = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, type);
            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 1;
        }
    }
}