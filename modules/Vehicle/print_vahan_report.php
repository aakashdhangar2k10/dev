<?php
include('../../includes/db.php'); // PDO connection

// Get vehicle ID
$vehicle_id = $_GET['id'] ?? null;
if (!$vehicle_id) {
    die("<div class='alert alert-danger'>Invalid Vehicle ID</div>");
}

try {
    // Fetch vehicle details
    $stmt = $conn->prepare("SELECT * FROM vehicle_details_tbl WHERE id = :id LIMIT 1");
    $stmt->execute([":id" => $vehicle_id]);
    $vehicle = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$vehicle) {
        die("<div class='alert alert-warning'>Vehicle not found!</div>");
    }

    // Fetch vehicle images
    $stmtImg = $conn->prepare("SELECT * FROM vehicle_images_tbl WHERE vehicle_id = :id ORDER BY id DESC");
    $stmtImg->execute([":id" => $vehicle_id]);
    $images = $stmtImg->fetchAll(PDO::FETCH_ASSOC);

    // Fetch inspection records for this vehicle

    $stmtInspections = $conn->prepare("SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :id ORDER BY inspection_date DESC");
    $stmtInspections->execute([":id" => $vehicle_id]);
    $inspections = $stmtInspections->fetchAll(PDO::FETCH_ASSOC);
    $lastInspection = !empty($inspections) ? $inspections[0] : null;
} catch (PDOException $e) {
    die("<div class='alert alert-danger'>Error: " . htmlspecialchars($e->getMessage()) . "</div>");
}


// Assume $vehicle['assigned_staff'] contains staff_id
$staffName = 'N/A';
if (!empty($vehicle['assigned_staff'])) {
    $stmtStaff = $conn->prepare("SELECT fname,lname FROM accounts WHERE acct_id = :id LIMIT 1");
    $stmtStaff->execute([':id' => $vehicle['assigned_staff']]);
    $staff = $stmtStaff->fetch(PDO::FETCH_ASSOC);
    if ($staff) {
        $staff_Fname = $staff['fname'];
        $staff_lname = $staff['lname'];
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Vehicle Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            background-color: #fff;
            margin: 20px;
        }

        h1,
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
        }

        th,
        td {
            padding: 8px 12px;
            text-align: left;
        }

        th {
            background-color: #f5f5f5;
            font-weight: bold;
        }

        .img-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }

        .img-item {
            text-align: center;
            max-width: 200px;
        }

        .img-thumbnail {
            max-width: 100%;
            max-height: 200px;
            border: 1px solid #ddd;
            padding: 5px;
        }

        .text-success {
            color: #28a745;
        }

        .text-warning {
            color: #ffc107;
        }

        .text-danger {
            color: #dc3545;
        }

        .no-print {
            display: none;
        }

        @media print {
            .no-print {
                display: none;
            }

            body {
                margin: 0;
            }
        }

        .print-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .print-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <h1>Vehicle Report</h1>

    <!-- Vehicle Information -->
    <div class="section">
        <h2>Vehicle Details</h2>
        <table>
            <tr>
                <th>Registration Number</th>
                <td><?php echo htmlspecialchars($vehicle['registrationNumber']); ?></td>
            </tr>
            <tr>
                <th>Make</th>
                <td><?php echo htmlspecialchars($vehicle['make']); ?></td>
            </tr>
            <tr>
                <th>Model</th>
                <td><?php echo htmlspecialchars($vehicle['model']); ?></td>
            </tr>
            <tr>
                <th>Colour</th>
                <td><?php echo htmlspecialchars($vehicle['colour']); ?></td>
            </tr>
            <tr>
                <th>Fuel Type</th>
                <td><?php echo htmlspecialchars($vehicle['fuelType']); ?></td>
            </tr>
            <tr>
                <th>Year of Manufacture</th>
                <td><?php echo htmlspecialchars($vehicle['yearOfManufacture']); ?></td>
            </tr>
            <tr>
                <th>Engine Capacity</th>
                <td><?php echo htmlspecialchars($vehicle['engineCapacity']); ?></td>
            </tr>
            <tr>
                <th>MOT Due Date</th>
                <td><?php echo htmlspecialchars($vehicle['motDueDate']); ?></td>
            </tr>
            <tr>
                <th>MOT Days</th>
                <td>
                    <?php if ($vehicle['days'] < 0): ?>
                        <span class="text-warning">Expired</span>
                    <?php elseif ($vehicle['days'] <= 90): ?>
                        <span class="text-danger"><?php echo htmlspecialchars($vehicle['days']); ?> days</span>
                    <?php else: ?>
                        <span class="text-success"><?php echo htmlspecialchars($vehicle['days']); ?> days</span>
                    <?php endif; ?>
                </td>
            </tr>
            <tr>
                <th>Tax Due Date</th>
                <td><?php echo htmlspecialchars($vehicle['taxDueDate']); ?></td>
            </tr>
            <tr>
                <th>Assigned Staff</th>
                <td><?php echo htmlspecialchars($staff_Fname . ' ' . $staff_lname); ?></td>
            </tr>
        </table>
    </div>

    <!-- Vehicle Images -->
    <div class="section">
        <h2>Vehicle Images</h2>
        <?php if (!empty($images)): ?>
            <div class="img-container">
                <?php foreach ($images as $img): ?>
                    <div class="img-item">
                        <img src="../../uploads/vehicles/<?php echo htmlspecialchars($img['image_path']); ?>"
                            alt="<?php echo htmlspecialchars($img['image_label']); ?>"
                            class="img-thumbnail">
                        <div><strong><?php echo htmlspecialchars($img['image_label']); ?></strong></div>
                        <div class="text-muted"><?php echo htmlspecialchars($img['image_description']); ?></div>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p>No images uploaded for this vehicle.</p>
        <?php endif; ?>
    </div>

    <!-- Inspection Records -->
    <div class="section">
        <h2>Last Inspection</h2>
        <?php if ($lastInspection): ?>
            <table>
                <tr>
                    <th>Inspection Date</th>
                    <td><?php echo htmlspecialchars($lastInspection['inspection_date']); ?></td>
                </tr>
                <tr>
                    <th>Tyres</th>
                    <td><?php echo htmlspecialchars($lastInspection['tyres']); ?></td>
                </tr>
                <tr>
                    <th>Driver's Cabin</th>
                    <td><?php echo htmlspecialchars($lastInspection['drivers_cabin']); ?></td>
                </tr>
                <tr>
                    <th>Loading Area</th>
                    <td><?php echo htmlspecialchars($lastInspection['loading_area']); ?></td>
                </tr>
                <tr>
                    <th>Exterior</th>
                    <td><?php echo htmlspecialchars($lastInspection['exterior']); ?></td>
                </tr>
                <tr>
                    <th>Mechanical</th>
                    <td><?php echo htmlspecialchars($lastInspection['mechanical']); ?></td>
                </tr>
                <tr>
                    <th>Comments</th>
                    <td><?php echo htmlspecialchars($lastInspection['comments']); ?></td>
                </tr>
                <tr>
                    <th>Test Driven</th>
                    <td><?php echo htmlspecialchars($lastInspection['test_driven']); ?></td>
                </tr>
                <tr>
                    <th>Test Drive Comments</th>
                    <td><?php echo htmlspecialchars($lastInspection['test_drive_comments']); ?></td>
                </tr>
            </table>
        <?php else: ?>
            <p>No inspection records found.</p>
        <?php endif; ?>
    </div>
</body>

</html>