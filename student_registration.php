<?php 
// Database configuration
$servername = "localhost";
$username = "root"; // Default MySQL username in WAMP
$password = ""; // Default password is empty in WAMP
$dbname = "tutortoday"; // Database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Database connected successfully!";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and assign form data
    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);
    $date_of_birth = $_POST['date_of_birth'];
    $email = trim($_POST['email']);
    $phone = $_POST['phone_number'];
    $area_of_needed_help = trim($_POST['area_of_needed_help']);
    $education_level = trim($_POST['education_level']);
    $username = trim($_POST['username']);
    $password = password_hash(trim($_POST['password']), PASSWORD_DEFAULT); // Hash the password
    
    // Prepare the SQL statement to insert student details
    $stmt = $conn->prepare("INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number, area_of_needed_help, education_level, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }
    
    // Bind parameters to the SQL query
    $stmt->bind_param("sssssssss", $first_name, $last_name, $date_of_birth, $email, $phone, $area_of_needed_help, $education_level, $username, $password);
    
    // Execute the statement and check for success
    try {
        if ($stmt->execute()) {
            echo "Student registration successful!";
        } else {
            throw new Exception($stmt->error);
        }
    } catch (Exception $e) {
        if ($conn->errno == 1062) {
            echo "Error: The username is already taken. Please choose a different username.";
        } else {
            echo "Error: " . $e->getMessage();
        }
    }
    
    // Close the statement
    $stmt->close();
}

// Close the database connection
$conn->close();
?>