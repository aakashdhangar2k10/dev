<?php
header('Content-Type: application/json');
require_once '../config/db.php'; // adjust path if needed

if (!isset($_POST['id']) || empty($_POST['id'])) {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid vehicle ID"
    ]);
    exit;
}

$id = intval($_POST['id']);

try {
    $stmt = $conn->prepare(
        "UPDATE vehicle_details_tbl 
         SET is_deleted = 1 
         WHERE id = ?"
    );

    $stmt->execute([$id]);

    if ($stmt->rowCount()) {
        echo json_encode([
            "status" => "success",
            "message" => "Vehicle deleted successfully"
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Vehicle not found or already deleted"
        ]);
    }

} catch (PDOException $e) {
    echo json_encode([
        "status" => "error",
        "message" => "Database error"
    ]);
}
