<?php
include 'db_connect.php';

if (isset($_GET['tutor_id'])) {
    $tutor_id = intval($_GET['tutor_id']);

    // Query to fetch tutor details
    $sql = "SELECT first_name, last_name, field_of_specialty, rating FROM tutors WHERE tutor_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $tutor_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $tutor = $result->fetch_assoc();
        echo json_encode(['success' => true, 'tutor' => $tutor]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Tutor not found.']);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid tutor ID.']);
}

$conn->close();
?>