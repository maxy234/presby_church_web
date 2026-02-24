// Admin Panel JavaScript

document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('adminLogin');
    const loginFormDiv = document.getElementById('loginForm');
    const adminDashboard = document.getElementById('adminDashboard');
    const loginError = document.getElementById('loginError');
    const logoutBtn = document.getElementById('logoutBtn');

    // Check if already logged in
    if (sessionStorage.getItem('adminLoggedIn') === 'true') {
        showDashboard();
    }

    // Login form submission
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            // Simple authentication (for demo purposes)
            if (username === 'admin' && password === 'church2024') {
                sessionStorage.setItem('adminLoggedIn', 'true');
                showDashboard();
                loginError.textContent = '';
            } else {
                loginError.textContent = 'Invalid username or password';
            }
        });
    }

    // Logout functionality
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function() {
            sessionStorage.removeItem('adminLoggedIn');
            loginFormDiv.style.display = 'block';
            adminDashboard.style.display = 'none';
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        });
    }

    function showDashboard() {
        loginFormDiv.style.display = 'none';
        adminDashboard.style.display = 'block';
        
        // Load dynamic data (simulated)
        loadDashboardData();
    }

    function loadDashboardData() {
        // Simulate loading data from database
        console.log('Loading dashboard data...');
        
        // You can add AJAX calls here to fetch real data
        // For now, we'll use the static data from HTML
    }

    // Edit button functionality
    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const id = row.cells[0].textContent;
            alert(`Edit member with ID: ${id}`);
            // Implement edit functionality here
        });
    });

    // Delete button functionality
    document.querySelectorAll('.delete-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            if (confirm('Are you sure you want to delete this member?')) {
                const row = this.closest('tr');
                row.remove();
                alert('Member deleted successfully');
            }
        });
    });
});