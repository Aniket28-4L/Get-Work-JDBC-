<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background: linear-gradient(0deg, #FFFFFF 0%, #FF8514 100%);
        }

        .navbar-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 12px 0;
        }
        .navbar {
            width: 100%;
            max-width: 1200px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: white;
            padding: 12px 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .logo {
            cursor: pointer;
            /* display: flex; */
            flex-direction: column;
            font-size: 1.8rem;
            font-weight: bold;
            color: #4C2885;
        }
        .logo span {
            color: #FF8514;
        }
        .logo span {
            color: #4C2885;
        }
        .location {
            font-size: 0.8rem;
            color: black;
            margin-top: -3px;
            margin-left: 10px;
        }
        .nav-links {
            display: flex;
            gap: 30px;
            /* margin-left: -30%; */
        }
        .nav-links button {
            background: none;
            border: none;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            color: black;
            transition: color 0.3s ease;
        }
        .nav-links button:hover {
            color: #FF8514;
        }
        .search-section {
            display: flex;
            align-items: center;
            /* background: #E8E6EC; */
            padding: 8px 15px;
            border-radius: 5px;
            margin-right: -18%;
            border: 1px solid #ccc;
            width: 300px;
            /* outline: none; */
        }
        .search-section input {
            border: none;
            background: none;
            outline: none;
            font-size: 1rem;
            flex: 1;
        }
        .search-icon {
            font-size: 1rem;
            color: black;
        }
        .profile-icon {
            font-size: 1.8rem;
            cursor: pointer;
            border: 2px solid black;
            border-radius: 50%;
            padding: 5px;
        }
        .profile-container {
            background: #F3F6FF;
            padding: 30px;
            border-radius: 15px;
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .profile-header {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .profile-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }
        .profile-pic-container {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 2px solid #ccc;
            object-fit: cover;
        }
        .edit-icon {
            position: absolute;
            bottom: 5px;
            right: 5px;
            background: white;
            border-radius: 50%;
            padding: 5px;
            cursor: pointer;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }
        .profile-form {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input, 
        .form-group select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
        }
        .buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .save {
            background: #FF8514;
            color: white;
        }
        .edit {
            background: #E0E0E0;
        }
        
        /* Modal Styles */
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    display: none;
}

.modal-overlay.success .modal-dialog {
    border-top: 4px solid #4CAF50;
}

.modal-overlay.error .modal-dialog {
    border-top: 4px solid #f44336;
}

.modal-dialog {
    background-color: white;
    border-radius: 5px;
    width: 400px;
    max-width: 90%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    animation: modalFadeIn 0.3s;
}

@keyframes modalFadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

.modal-header {
    padding: 15px 20px;
    border-bottom: 1px solid #eee;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-header h3 {
    margin: 0;
    font-size: 1.2rem;
    color: #333;
}

.close-modal {
    font-size: 1.5rem;
    cursor: pointer;
    color: #777;
}

.close-modal:hover {
    color: #333;
}

.modal-body {
    padding: 20px;
    color: #555;
}

.modal-footer {
    padding: 15px 20px;
    border-top: 1px solid #eee;
    text-align: right;
}

.modal-ok-btn {
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9rem;
}

.modal-ok-btn:hover {
    background-color: #45a049;
}

.modal-overlay.error .modal-ok-btn {
    background-color: #f44336;
}

.modal-overlay.error .modal-ok-btn:hover {
    background-color: #d32f2f;
}
    </style>
</head>
<body>
    <div class="navbar-container">
        <div class="navbar">
            <div>
                <div onclick="location.href='home.jsp'" class="logo">get<span>W</span><span>ork</span></div>
                <div class="location">📍 Rk, Tramba-Rajkot</div>
            </div>
            <div class="nav-links">
                <button onclick="window.location.href='worker_card.jsp'">Categories</button>
                <button onclick="window.location.href='footer.jsp'">Contact Us</button>
            </div>
            
            
        </div>
    </div>

<div class="profile-container">
    <div class="profile-header">Make your Profile!</div>
    <div class="profile-content">
        <div class="profile-pic-container">
            <img src="default-profile.png" alt="Profile Picture" class="profile-pic" id="profileImage">
            <span class="edit-icon">✏️</span>
            <input type="file" id="imageUpload" accept="image/*" style="display: none;">
        </div>
        <div class="buttons">
            <button type="button" class="save" id="saveBtn">Save</button>
            <button type="button" class="edit" id="editBtn">Edit</button>
        </div>
    </div>
</div>
<div class="profile-container">
    <form class="profile-form" id="profileForm">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" placeholder="Your First Name" disabled>
            <label>Last Name</label>
            <input type="text" name="lastName" placeholder="Your Last Name" disabled>
        </div>
        <div class="form-group">
            <label>Gender</label>
            <select name="gender" disabled>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Profession</label>
            <select name="profession" disabled>
                <option value="Physiotherapist">Physiotherapist</option>
                <option value="Old Care">Old Care</option>
                <option value="House Cleaning">House Cleaning</option>
                <option value="Cook">Cook</option>
                <option value="Baby Sitting">Baby Sitting</option>
                <option value="Home Tuition">Home Tuition</option>
            </select>
        </div>
        <div class="form-group">
            <label>Language</label>
            <select name="language" disabled>
                <option value="English">English</option>
                <option value="Hindi">Hindi</option>
            </select>
        </div>
        <div class="form-group">
            <label>Phone Number</label>
            <input type="text" name="phone" value="+91" placeholder="Enter your number" disabled>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your mail" disabled>
        </div>
        <div class="form-group">
            <label>Experience</label>
            <input type="text" name="experience" placeholder="Enter your experience" disabled>
        </div>
        <div class="form-group">
            <label>Charge (INR)</label>
            <input type="text" name="charge" id="chargeInput" placeholder="Enter your Charge in INR" disabled>
            <input type="range" id="chargeSlider" min="1" max="10000" value="1" disabled>
        </div>
    </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Create modal dialog elements
    const modalHTML = `
        <div class="modal-overlay" id="modalOverlay" style="display:none;">
            <div class="modal-dialog">
                <div class="modal-header">
                    <h3 id="modalTitle">Notification</h3>
                    <span class="close-modal">&times;</span>
                </div>
                <div class="modal-body" id="modalMessage"></div>
                <div class="modal-footer">
                    <button class="modal-ok-btn">OK</button>
                </div>
            </div>
        </div>
    `;
    document.body.insertAdjacentHTML('beforeend', modalHTML);

    // Modal elements
    const modalOverlay = document.getElementById('modalOverlay');
    const modalTitle = document.getElementById('modalTitle');
    const modalMessage = document.getElementById('modalMessage');
    const closeModal = document.querySelector('.close-modal');
    const modalOkBtn = document.querySelector('.modal-ok-btn');

    // Modal functions
    function showModal(title, message, isError = false) {
        modalTitle.textContent = title;
        modalMessage.innerHTML = message;
        modalOverlay.style.display = 'flex';
        modalOverlay.className = isError ? 'modal-overlay error' : 'modal-overlay success';
    }

    function hideModal() {
        modalOverlay.style.display = 'none';
    }

    // Modal event listeners
    closeModal.addEventListener('click', hideModal);
    modalOkBtn.addEventListener('click', hideModal);
    modalOverlay.addEventListener('click', function(e) {
        if (e.target === modalOverlay) hideModal();
    });

    // Form elements
    const form = document.getElementById('profileForm');
    const inputs = form.querySelectorAll('input, select');
    const saveBtn = document.getElementById('saveBtn');
    const editBtn = document.getElementById('editBtn');
    const editIcon = document.querySelector('.edit-icon');
    const fileInput = document.getElementById('imageUpload');
    const profilePic = document.getElementById('profileImage');
    
    // Initialize fields as disabled
    lockFields(true);
    
    // Edit button click handler
    editBtn.addEventListener('click', function() {
        lockFields(false);
    });
    
    // Save button click handler
    saveBtn.addEventListener('click', function() {
        const formData = new FormData(form);
        formData.append('action', 'save');
        
        fetch('ProfileServlet', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                lockFields(true);
                showModal('Success', 'Profile saved successfully!');
            } else {
                showModal('Error', data.message, true);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showModal('Error', 'Failed to save profile', true);
        });
    });
    
    // Edit icon click handler (image upload)
    editIcon.addEventListener('click', function() {
        fileInput.click();
    });
    
    // File input change handler
    fileInput.addEventListener('change', function() {
        if (this.files && this.files[0]) {
            const formData = new FormData();
            formData.append('profileImage', this.files[0]);
            formData.append('action', 'uploadImage');
            
            fetch('ProfileServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    profilePic.src = data.imagePath;
                    showModal('Success', 'Profile picture updated successfully!');
                } else {
                    showModal('Error', 'Error uploading image: ' + data.message, true);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showModal('Error', 'Failed to upload image', true);
            });
        }
    });
    
    // Charge slider sync with input
    const chargeSlider = document.getElementById('chargeSlider');
    const chargeInput = document.getElementById('chargeInput');
    
    chargeSlider.addEventListener('input', function() {
        chargeInput.value = this.value;
    });
    
    chargeInput.addEventListener('input', function() {
        chargeSlider.value = this.value || 1;
    });
    
    // Helper function to lock/unlock fields
    function lockFields(lock) {
        inputs.forEach(input => {
            input.disabled = lock;
        });
        saveBtn.style.display = lock ? 'none' : 'block';
        editBtn.style.display = lock ? 'block' : 'none';
    }
    
    // Load existing profile data
    loadProfileData();
    
    function loadProfileData() {
        fetch('ProfileServlet?action=getProfile')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                // Populate form fields with existing data
                Object.keys(data.profile).forEach(key => {
                    const input = form.querySelector(`[name="${key}"]`);
                    if (input) {
                        if (input.type === 'select-one') {
                            input.value = data.profile[key];
                        } else {
                            input.value = data.profile[key];
                        }
                    }
                });
                
                if (data.profile.profile_picture_path) {
                    profilePic.src = data.profile.profile_picture_path;
                }
            }
        })
        .catch(error => {
            console.error('Error loading profile:', error);
            showModal('Error', 'Failed to load profile data', true);
        });
    }
});
</script>
</body>
</html>
