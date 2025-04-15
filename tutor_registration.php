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
    
    // Handle available_days array
    $available_days = isset($_POST['available_days']) ? $_POST['available_days'] : [];
    $available_days_string = implode(',', $available_days); // Convert array to comma-separated string
    
    $price_per_hour = ($_POST['price_per_hour']);
    $username = trim($_POST['username']);
    $password = password_hash(trim($_POST['password']), PASSWORD_DEFAULT); // Hash the password
    
    // Prepare the SQL statement to insert Tutor details
    $stmt = $conn->prepare("INSERT INTO tutors (first_name, last_name, email, phone_number, date_of_birth, field_of_specialty, available_days, price_per_hour, 
    username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }
    
    // Bind parameters to the SQL query
    $stmt->bind_param("ssssssssss", $first_name, $last_name, $email, $phone, $date_of_birth, $field_of_specialty, $available_days_string, $price_per_hour, $username,
    $password);
    
    // Execute the statement and check for success
    try {
        if ($stmt->execute()) {
                    echo "<script>
                        alert('Tutor registration successful!');
                        window.location.href = 'LoginPage.html';
                    </script>";
            exit;
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