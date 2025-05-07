<?php
include 'db_connect.php';

try {
    // Validate and sanitize primary_id
    if (!isset($_GET['primary_id']) || !filter_var($_GET['primary_id'], FILTER_VALIDATE_INT)) {
        throw new Exception('Invalid or missing primary_id');
    }
    $primary_id = (int)$_GET['primary_id'];

    // Prepare and execute the query
    $stmt = $conn->prepare("SELECT * FROM tutors WHERE primary_id = ?");
    $stmt->bind_param("i", $primary_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user) {
        throw new Exception('User not found');
    }

    $response = [
        'first_name' => $user['first_name'] ?? null,
        'last_name' => $user['last_name'] ?? null,
        'about' => $user['about'] ?? null,
        'email' => $user['email'] ?? null,
        'phone_number' => $user['phone_number'] ?? null,
        'field_of_specialty' => isset($user['field_of_specialty']) ? explode(',', $user['field_of_specialty']) : [],
        'rating' => $user['rating'] ?? null,
        'available_days' => isset($user['available_days']) ? explode(',', $user['available_days']) : [],
    ];

     // Return JSON response
     header('Content-Type: application/json');
     echo json_encode($response);
 } catch (Exception $e) {
     http_response_code(400); // Bad Request
     echo json_encode(['error' => $e->getMessage()]);
 } catch (mysqli_sql_exception $e) {
     http_response_code(500); // Internal Server Error
     echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
?>