<?php
// Database configuration
$servername = "localhost";
$username = "root"; // Default MySQL username in WAMP
$password = ""; // Default password is empty in WAMP
$dbname = "TutorToday"; // Database name
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
?>
