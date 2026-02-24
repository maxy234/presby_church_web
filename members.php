<?php
// members.php - Display church members from database
require_once 'config.php'; // Include database connection
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Church Members - Presbyterian Church of Ghana</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Include your navigation here -->
    
    <div class="container" style="margin-top: 120px;">
        <h2>Church Members Directory</h2>
        
        <?php
        // Query to fetch members
        $sql = "SELECT id, full_name, email, phone, join_date FROM members ORDER BY join_date DESC";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0) {
            echo '<table class="members-table">';
            echo '<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Join Date</th></tr>';
            
            while($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['id'] . '</td>';
                echo '<td>' . htmlspecialchars($row['full_name']) . '</td>';
                echo '<td>' . htmlspecialchars($row['email']) . '</td>';
                echo '<td>' . htmlspecialchars($row['phone']) . '</td>';
                echo '<td>' . $row['join_date'] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '<p>No members found</p>';
        }
        
        // Close connection
        $conn->close();
        ?>
    </div>
    
    <!-- Include your footer here -->
</body>
</html>