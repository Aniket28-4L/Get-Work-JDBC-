import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 100)  // 100 MB
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");

        try {
            if ("save".equals(action)) {
                // Handle profile data save
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String gender = request.getParameter("gender");
                String profession = request.getParameter("profession");
                String language = request.getParameter("language");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String experience = request.getParameter("experience");
                String charge = request.getParameter("charge");
                
                // Save to database
                boolean success = saveProfileToDB(firstName, lastName, gender, 
                                              profession, language, phone, email,
                                              experience, charge);
                
                if (success) {
                    out.print("{\"status\":\"success\",\"message\":\"Worker profile saved successfully\"}");
                } else {
                    out.print("{\"status\":\"error\",\"message\":\"Failed to save worker profile\"}");
                }
                
            } else if ("uploadImage".equals(action)) {
                // Handle image upload
                Part filePart = request.getPart("profileImage");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String email = request.getParameter("email"); // Using email as identifier
                
                if (fileName != null && !fileName.isEmpty()) {
                    // Create upload directory if it doesn't exist
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    
                    // Save file
                    String filePath = uploadPath + File.separator + fileName;
                    Files.copy(filePart.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                    
                    // Update database with image path
                    updateProfileImage(email, UPLOAD_DIR + File.separator + fileName);
                    
                    out.print("{\"status\":\"success\",\"imagePath\":\"" + UPLOAD_DIR + "/" + fileName + "\"}");
                } else {
                    out.print("{\"status\":\"error\",\"message\":\"No file selected\"}");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"status\":\"error\",\"message\":\"Server error: " + e.getMessage().replace("\"", "\\\"") + "\"}");
        }
    }

    private boolean saveProfileToDB(String firstName, String lastName, 
                                  String gender, String profession, String language,
                                  String phone, String email, String experience, 
                                  String charge) {
        String sql = "INSERT INTO worker_profiles (first_name, last_name, gender, profession, " +
                     "language, phone_number, email, experience, charge_per_hour) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE " +
                     "first_name = VALUES(first_name), last_name = VALUES(last_name), " +
                     "gender = VALUES(gender), profession = VALUES(profession), " +
                     "language = VALUES(language), phone_number = VALUES(phone_number), " +
                     "experience = VALUES(experience), charge_per_hour = VALUES(charge_per_hour)";
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, gender);
            ps.setString(4, profession);
            ps.setString(5, language);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setString(8, experience);
            ps.setString(9, charge);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateProfileImage(String email, String imagePath) {
        String sql = "UPDATE worker_profiles SET profile_picture_path = ? WHERE email = ?";
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, imagePath);
            ps.setString(2, email);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}