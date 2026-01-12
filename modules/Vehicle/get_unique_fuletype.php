<?php
include('../../includes/db.php'); // PDO connection

header('Content-Type: application/json');

try {

    $stmt = $conn->prepare("
        SELECT DISTINCT fuelType 
        FROM vehicle_details_tbl 
        WHERE make IS NOT NULL 
          AND make != ''
          AND is_deleted = 0
        ORDER BY make ASC
    ");

    $stmt->execute();
    $fuelType = $stmt->fetchAll(PDO::FETCH_COLUMN);

    echo json_encode([
        'status' => 'success',
        'data'   => $fuelType
    ]);

} catch (Exception $e) {

    echo json_encode([
        'status'  => 'error',
        'message' => 'Failed to load make list'
    ]);
}
