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
    $education_level = trim($_POST['education_level']);
    $area_of_needed_help = isset($_POST['area_of_needed_help']) 
        ? (is_array($_POST['area_of_needed_help']) 
            ? $_POST['area_of_needed_help'] 
            : [$_POST['area_of_needed_help']]) 
        : [];
    $area_of_needed_help = implode(',', $area_of_needed_help); 
    $username = trim($_POST['username']);
    $password = password_hash(trim($_POST['password']), PASSWORD_DEFAULT); // Hash the password
}
    // Prepare the SQL statement to insert student details
    $stmt = $conn->prepare("INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number, education_level, area_of_needed_help,
         username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }
    
    // Bind parameters to the SQL query
    $stmt->bind_param("sssssssss", $first_name, $last_name, $date_of_birth, $email, $phone, $education_level, $area_of_needed_help, $username, $password);
    
    // Execute the statement and check for success
    try {
        if ($stmt->execute()) {
                    echo "<script>
                        alert('Student registration successful!');
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
    
    // Close the database connection
    $conn->close();
?>