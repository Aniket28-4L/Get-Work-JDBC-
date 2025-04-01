<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carousel Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .top-bar {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            border-bottom: 2px solid black;
            height: 50px;
            position: fixed;
            top: 0;
            width: 100%;
            left: 0;
            z-index: 1000;
        }
        .container-wrapper {
            display: flex;
            margin-top: 50px;
        }
        .sidebar {
            width: 160px;
            height: calc(100vh - 50px);
            background-color: #1a1a1a;
            color: white;
            position: fixed;
            top: 50px;
            left: 0;
            overflow-y: auto;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 5px 10px;
            border-radius: 5px;
            transition: background 0.3s;
            font-size: 15px;
            font-weight: bold;
        }
        .sidebar a:hover {
            background: #ff7f00;
        }
        .main-content {
            margin-left: 160px;
            width: calc(100% - 160px);
        }
        .content-wrapper {
            padding: 20px;
        }
        .image-container {
            display: flex;
            justify-content: flex-start;
            gap: 30px;
            flex-wrap: wrap;
            padding-left: 0;
        }
        .image-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .image-box img {
            width: 250px;
            height: 250px;
            object-fit: cover;
            border-radius: 5px;
        }
        .btn-container {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        /* Modal styles */
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1050;
            background: rgba(0,0,0,0.5);
        }
        .modal-dialog {
            max-width: 600px;
            width: 90%;
        }
        .modal-content {
            background: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
        }
        .modal-header {
            border-bottom: 1px solid #dee2e6;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .modal-body {
            padding: 20px;
        }
        .modal-footer {
            border-top: 1px solid #dee2e6;
            padding: 15px 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="top-bar">
    <h2 style="color: #ff7f00; margin: 0;">get<span style="color: black;">Work</span></h2>
    <h2 style="margin: 0;">Admin Panel</h2>
    <button class="btn btn-primary">Home</button>
</div>
<div class="container-wrapper">
    <div class="sidebar">
        <a href="AdminHome.jsp">Dashboard</a>
        <a href="Carousel.jsp">Carousel</a>
        <a href="Reviews.jsp">Reviews</a>
        <a href="Workers.jsp">Workers</a>
    </div>
    <div class="main-content">
        <div class="content-wrapper">
            <h3>Home-Page Images</h3>
            <div class="image-container">
                <%
                Connection con = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/getWork", "root", "");
                    
                    // Get home images
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM home_carousel WHERE image_type='home' AND is_active=1 ORDER BY display_order");
                    
                    while(rs.next()) {
                %>
                        <div class="image-box">
                            <img src="<%= rs.getString("image_path") %>" alt="Home Image">
                            <div class="btn-container">
                                <button type="button" class="btn btn-primary" 
                                    onclick="showEditModal(<%= rs.getInt("id") %>, '<%= rs.getString("image_path") %>')">
                                    Edit
                                </button>
                                <form action="${pageContext.request.contextPath}/CarouselServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this image?')">Remove</button>
                                </form>
                            </div>
                        </div>
                <%
                    }
                    
                    // Check if we need to show add box for home images
                    ResultSet homeCount = stmt.executeQuery("SELECT COUNT(*) FROM home_carousel WHERE image_type='home' AND is_active=1");
                    homeCount.next();
                    if(homeCount.getInt(1) < 3) {
                %>
                        <div class="image-box" style="display: flex; align-items: center; justify-content: center; border: 2px dashed #ccc;">
                            <form action="${pageContext.request.contextPath}/CarouselServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="type" value="home">
                                <label style="cursor: pointer; padding: 20px;">
                                    <div style="font-size: 24px;">+</div>
                                    <div>Add Home Image</div>
                                    <input type="file" name="image" style="display: none;" onchange="this.form.submit()">
                                </label>
                            </form>
                        </div>
                <%
                    }
                    homeCount.close();
                    
                    // Get ad images
                    rs = stmt.executeQuery("SELECT * FROM home_carousel WHERE image_type='ad' AND is_active=1 ORDER BY display_order");
                %>
            </div>
            
            <h3 style="margin-top: 40px;">Ads - Images</h3>
            <div class="image-container">
                <%
                    while(rs.next()) {
                %>
                        <div class="image-box">
                            <img src="<%= rs.getString("image_path") %>" alt="Ad Image">
                            <div class="btn-container">
                                <button type="button" class="btn btn-primary" 
                                    onclick="showEditModal(<%= rs.getInt("id") %>, '<%= rs.getString("image_path") %>')">
                                    Edit
                                </button>
                                <form action="${pageContext.request.contextPath}/CarouselServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-danger" 
                                        onclick="return confirm('Are you sure you want to delete this image?')">Remove</button>
                                </form>
                            </div>
                        </div>
                <%
                    }
                    
                    // Check if we need to show add box for ad images
                    ResultSet adCount = stmt.executeQuery("SELECT COUNT(*) FROM home_carousel WHERE image_type='ad' AND is_active=1");
                    adCount.next();
                    if(adCount.getInt(1) < 5) {
                %>
                        <div class="image-box" style="display: flex; align-items: center; justify-content: center; border: 2px dashed #ccc;">
                            <form action="${pageContext.request.contextPath}/CarouselServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="type" value="ad">
                                <label style="cursor: pointer; padding: 20px;">
                                    <div style="font-size: 24px;">+</div>
                                    <div>Add Ad Image</div>
                                    <input type="file" name="image" style="display: none;" onchange="this.form.submit()">
                                </label>
                            </form>
                        </div>
                <%
                    }
                    adCount.close();
                    
                    // Show inactive images if any exist
                    ResultSet inactiveRs = stmt.executeQuery("SELECT * FROM home_carousel WHERE is_active=0");
                    if(inactiveRs.next()) {
                %>
                        <h3 style="margin-top: 40px; width: 100%;">Inactive Images</h3>
                        <div class="image-container">
                        <%
                        do {
                        %>
                            <div class="image-box">
                                <img src="<%= inactiveRs.getString("image_path") %>" alt="Inactive Image">
                                <div class="btn-container">
                                    <form action="${pageContext.request.contextPath}/CarouselServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="restore">
                                        <input type="hidden" name="id" value="<%= inactiveRs.getInt("id") %>">
                                        <input type="hidden" name="type" value="<%= inactiveRs.getString("image_type") %>">
                                        <button type="submit" class="btn btn-success">Restore</button>
                                    </form>
                                </div>
                            </div>
                        <%
                        } while(inactiveRs.next());
                        %>
                        </div>
                <%
                    }
                    inactiveRs.close();
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(con != null) con.close();
                }
                %>
            </div>
        </div>
    </div>
</div>

<!-- Edit Image Modal -->
<div id="editModal" class="modal" style="display:none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Image</h5>
                <button type="button" class="btn-close" onclick="hideModal()"></button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="${pageContext.request.contextPath}/CarouselServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="updateImage">
                    <input type="hidden" id="editImageId" name="id" value="">
                    
                    <div class="mb-3">
                        <label class="form-label">Current Image</label>
                        <img id="currentImagePreview" src="" class="img-fluid mb-2" style="max-height:200px;">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Select New Image</label>
                        <input type="file" id="fileInput" name="newImage" accept="image/*" required 
                               style="display:none;" onchange="previewNewImage(this)">
                        <button type="button" class="btn btn-secondary" onclick="document.getElementById('fileInput').click()">
                            Choose File
                        </button>
                        <span id="fileName" style="margin-left:10px;"></span>
                    </div>
                    
                    <div id="newImagePreview" class="mb-3" style="display:none;">
                        <label class="form-label">New Image Preview</label>
                        <img id="newImageThumbnail" src="#" class="img-fluid mb-2" style="max-height:200px; display:none;">
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hideModal()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Show modal and set values
    function showEditModal(id, imagePath) {
        document.getElementById('editImageId').value = id;
        document.getElementById('currentImagePreview').src = imagePath;
        document.getElementById('editModal').style.display = 'flex';
        document.getElementById('fileName').textContent = '';
        document.getElementById('newImagePreview').style.display = 'none';
        document.getElementById('newImageThumbnail').style.display = 'none';
    }
    
    // Hide modal
    function hideModal() {
        document.getElementById('editModal').style.display = 'none';
    }
    
    // Preview new image selection
    function previewNewImage(input) {
        if (input.files && input.files[0]) {
            const fileName = input.files[0].name;
            document.getElementById('fileName').textContent = fileName;
            
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('newImageThumbnail').src = e.target.result;
                document.getElementById('newImageThumbnail').style.display = 'block';
                document.getElementById('newImagePreview').style.display = 'block';
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>