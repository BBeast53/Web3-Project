
<?php 
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and assign form data
    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);
    $email = trim($_POST['email']);
    $phone = trim($_POST['phone_number']);
    $date_of_birth = $_POST['date_of_birth'];
    $field_of_specialty = trim($_POST['field_of_specialty']);
    $weekly_schedule = trim($_POST['available_days']);
    $price_per_hour = ($_POST['price_per_hour']);
    $username = trim($_POST['username']);
    $password = trim($_POST['password']); 
    
    // Prepare the SQL statement to insert Tutor details
    $stmt = $conn->prepare("INSERT INTO students (first_name, last_name, email, phone_number, date_of_birth, field_of_specialty, available_days, price_per_hour, 
    username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
    die("Prepare failed: " . $conn->error);
    }
    // Bind parameters to the SQL query
    $stmt->bind_param("ssssssssss", $first_name, $last_name, $email, $phone_number, $date_of_birth, $field_of_specialty, $available_days, $price_per_hour, $username,
    $password);
    // Execute the statement and check for success
    if ($stmt->execute()) {
    echo "Tutor registration successful!";
    } else {
    echo "Error: " . $stmt->error;
    }
    // Close the statement
    $stmt->close();
    }
    // Close the database connection
    $conn->close();

?>