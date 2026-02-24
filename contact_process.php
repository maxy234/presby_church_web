<?php
// contact_process.php - Handle contact form submissions
require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $conn->real_escape_string($_POST['name']);
    $email = $conn->real_escape_string($_POST['email']);
    $phone = $conn->real_escape_string($_POST['phone']);
    $subject = $conn->real_escape_string($_POST['subject']);
    $message = $conn->real_escape_string($_POST['message']);
    
    $sql = "INSERT INTO contact_messages (name, email, phone, subject, message, submitted_at) 
            VALUES ('$name', '$email', '$phone', '$subject', '$message', NOW())";
    
    if ($conn->query($sql) === TRUE) {
        header('Location: contact.html?success=1');
    } else {
        header('Location: contact.html?error=1');
    }
}

$conn->close();
?>