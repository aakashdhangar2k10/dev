<?php
header('Content-Type: application/json');
include('../../includes/db.php'); // must define $conn = new PDO(...)

if (
    !isset($_POST['id']) || empty($_POST['id']) ||
    !isset($_POST['flagged'])
) {
    echo json_encode([
        "status"  => "error",
        "message" => "Invalid input"
    ]);
    exit;
}

$id      = intval($_POST['id']);
$flagged = intval($_POST['flagged']);

// allow only 0 or 1
if (!in_array($flagged, [0, 1], true)) {
    echo json_encode([
        "status"  => "error",
        "message" => "Invalid review status"
    ]);
    exit;
}

try {

    $stmt = $conn->prepare(
        "UPDATE vehicle_details_tbl 
         SET flagged = ? 
         WHERE id = ? AND is_deleted = 0"
    );

    $stmt->execute([$flagged, $id]);

    if ($stmt->rowCount()) {
        echo json_encode([
            "status"  => "success",
            "message" => "Review status updated successfully"
        ]);
    } else {
        echo json_encode([
            "status"  => "error",
            "message" => "Vehicle not found or already updated"
        ]);
    }

} catch (PDOException $e) {
    echo json_encode([
        "status"  => "error",
        "message" => "Database error"
    ]);
}
