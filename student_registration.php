<?php 
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and assign form data
    $student_id = trim($_POST['student_id']);
    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone']);
    $date_of_birth = $_POST['date_of_birth'];
    $area_of_needed_help = trim($_POST['area_of_help_needed']);
    $education_level = trim($_POST['education_level']);
    $username = trim($_POST['username']);
    $password = trim($_POST['password']); 
    
    // Prepare the SQL statement to insert student details
    $stmt = $conn->prepare("INSERT INTO students (student_id, first_name, last_name, email, phone, date_of_birth, area_of_needed_help, education_level,
    username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
    die("Prepare failed: " . $conn->error);
    }
    // Bind parameters to the SQL query
    $stmt->bind_param("sssssssssi", $student_id, $first_name, $last_name, $email, $phone, $date_of_birth, $area_of_needed_help, $education_level, $username,
    $password);
    // Execute the statement and check for success
    if ($stmt->execute()) {
    echo "Student registration successful!";
    } else {
    echo "Error: " . $stmt->error;
    }
    // Close the statement
    $stmt->close();
    }
    // Close the database connection
    $conn->close();

?>