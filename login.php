<?php
// Start the session
session_start();

// Include database connection
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve and sanitize form inputs
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Prepare the SQL query to check user credentials in the students table
    $stmt = $conn->prepare("SELECT * FROM students WHERE username = ?");
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    } 

    // Bind the username parameter
    $stmt->bind_param("s", $username);

    // Execute the query
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch the user data from the students table
        $user = $result->fetch_assoc();

        // Verify the password
        if (password_verify($password, $user['password'])) {
            // Password is correct, set session variables
            $_SESSION['username'] = $user['username'];
            $_SESSION['primary_id'] = $user['primary_id']; // Assuming the table has an 'id' column
            $_SESSION['role'] = 'student'; // Set role as student

            // Redirect to a student dashboard or home page
            header("Location: StudentProfilePage.html?primary_id=" . $_SESSION['primary_id']);
            exit();
        } else {
            // Invalid password
            echo "<p style='color: red;'>Invalid username or password.</p>";
        }
    } else {
        // If not found in students, check the tutors table
        $stmt = $conn->prepare("SELECT * FROM tutors WHERE username = ?");
        if (!$stmt) {
            die("Prepare failed: " . $conn->error);
        }

        // Bind the username parameter
        $stmt->bind_param("s", $username);

        // Execute the query
        $stmt->execute();

        // Get the result
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // Fetch the user data from the tutors table
            $user = $result->fetch_assoc();

            // Verify the password
            if (password_verify($password, $user['password'])) {
                // Password is correct, set session variables
                $_SESSION['username'] = $user['username'];
                $_SESSION['primary_id'] = $user['primary_id']; // Assuming the table has an 'id' column
                $_SESSION['role'] = 'tutor'; // Set role as tutor

                // Redirect to a tutor dashboard or home page
                header("Location: TutorProfilePage.html");
                exit();
            } else {
                // Invalid password
                echo "<p style='color: red;'>Invalid username or password.</p>";
            }
        } else {
            // No user found in either table
            echo "<p style='color: red;'>Invalid username or password.</p>";
        }
    }

    // Close the statement
    $stmt->close();
}

// Close the database connection
$conn->close();
?>