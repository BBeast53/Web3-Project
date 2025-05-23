<?php
include 'db_connect.php';

// Query to fetch tutors
$sql = "SELECT primary_id, first_name, last_name, field_of_specialty, rating FROM tutors";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Loop through each tutor and generate HTML
    while ($row = $result->fetch_assoc()) {
        $primary_id = intval($row['primary_id']);
        $name = htmlspecialchars($row['first_name'] . ' ' . $row['last_name']);
        $subjects = htmlspecialchars($row['field_of_specialty']);
        $rating = intval($row['rating']);

        // Generate stars for rating
        $stars = str_repeat('★', $rating) . str_repeat('☆', 5 - $rating);

        echo "
        <a href='TutorProfilePage.html?primary_id=$primary_id' class='tutor-link'>
            <div class='tutor' data-subjects='$subjects' data-rating='$rating'>
                <img src='Smiley-Sunglasses.png' alt='Smiley'>
                <div><strong>$name</strong><br>$subjects Tutor</div>
                <div class='stars'>$stars</div>
            </div>
        </a>
        ";
    }
} else {
    echo "<p>No tutors found.</p>";
}

$conn->close();
?>