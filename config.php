<?php
// config.php - Database configuration
$servername = "localhost";  // XAMPP default server
$username = "root";         // XAMPP default username
$password = "";             // XAMPP default password (empty)
$dbname = "church_db";      // Your database name

// Create connection using MySQLi (object-oriented)
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else{

echo "Connected successfully to church_db" ;
};

// Set charset to UTF-8
$conn->set_charset("utf8mb4");

// Optional: For debugging - remove in production
// echo "Connected successfully to church_db";
?>