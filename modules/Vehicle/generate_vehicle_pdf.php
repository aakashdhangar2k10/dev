<?php
require '../../vendor/autoload.php'; // adjust path to autoload.php

use Dompdf\Dompdf;

// Include DB and fetch vehicle data (reuse your existing code)
include('../../includes/db.php'); 

$vehicle_id = $_GET['id'] ?? null;
if (!$vehicle_id) die("Invalid Vehicle ID");

try {
    // Fetch vehicle details
    $stmt = $conn->prepare("SELECT * FROM vehicle_details_tbl WHERE id = :id LIMIT 1");
    $stmt->execute([":id" => $vehicle_id]);
    $vehicle = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$vehicle) die("Vehicle not found!");

    // Vehicle images
    $stmtImg = $conn->prepare("SELECT * FROM vehicle_images_tbl WHERE vehicle_id = :id ORDER BY id DESC");
    $stmtImg->execute([":id" => $vehicle_id]);
    $images = $stmtImg->fetchAll(PDO::FETCH_ASSOC);

    // Last inspection
    $stmtInspections = $conn->prepare("SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :id ORDER BY inspection_date DESC");
    $stmtInspections->execute([":id" => $vehicle_id]);
    $inspections = $stmtInspections->fetchAll(PDO::FETCH_ASSOC);
    $lastInspection = !empty($inspections) ? $inspections[0] : null;

    // Assigned staff
    $staff_Fname = $staff_lname = '';
    if (!empty($vehicle['assigned_staff'])) {
        $stmtStaff = $conn->prepare("SELECT fname,lname FROM accounts WHERE acct_id = :id LIMIT 1");
        $stmtStaff->execute([':id' => $vehicle['assigned_staff']]);
        $staff = $stmtStaff->fetch(PDO::FETCH_ASSOC);
        if ($staff) {
            $staff_Fname = $staff['fname'];
            $staff_lname = $staff['lname'];
        }
    }
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}

// Capture HTML output
ob_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Vehicle Report</title>
<style>
body { font-family: Arial,sans-serif; color:#333; margin:10px; }
h1,h2 { text-align:center; margin-bottom:20px; }
table { width:100%; border-collapse:collapse; margin-top:10px; }
th, td { border:1px solid #ddd; padding:8px; text-align:left; }
th { background:#f5f5f5; font-weight:bold; }
.img-container { display:flex; flex-wrap:wrap; gap:10px; justify-content:center; }
.img-item { text-align:center; max-width:150px; }
.img-item img { max-width:100%; max-height:150px; border:1px solid #ddd; padding:3px; }
.text-success { color:#28a745; }
.text-warning { color:#ffc107; }
.text-danger { color:#dc3545; }
</style>
</head>
<body>
<h1>Vehicle Report</h1>

<!-- Vehicle Details -->
<h2>Vehicle Details</h2>
<table>
<tr><th>Registration Number</th><td><?= htmlspecialchars($vehicle['registrationNumber']) ?></td></tr>
<tr><th>Make</th><td><?= htmlspecialchars($vehicle['make']) ?></td></tr>
<tr><th>Model</th><td><?= htmlspecialchars($vehicle['model']) ?></td></tr>
<tr><th>Colour</th><td><?= htmlspecialchars($vehicle['colour']) ?></td></tr>
<tr><th>Fuel Type</th><td><?= htmlspecialchars($vehicle['fuelType']) ?></td></tr>
<tr><th>Year</th><td><?= htmlspecialchars($vehicle['yearOfManufacture']) ?></td></tr>
<tr><th>Engine Capacity</th><td><?= htmlspecialchars($vehicle['engineCapacity']) ?></td></tr>
<tr><th>MOT Due Date</th><td><?= htmlspecialchars($vehicle['motDueDate']) ?></td></tr>
<tr><th>MOT Days</th>
<td>
<?php if ($vehicle['days'] < 0): ?>
<span class="text-warning">Expired</span>
<?php elseif ($vehicle['days'] <= 90): ?>
<span class="text-danger"><?= htmlspecialchars($vehicle['days']) ?> days</span>
<?php else: ?>
<span class="text-success"><?= htmlspecialchars($vehicle['days']) ?> days</span>
<?php endif; ?>
</td></tr>
<tr><th>Tax Due Date</th><td><?= htmlspecialchars($vehicle['taxDueDate']) ?></td></tr>
<tr><th>Assigned Staff</th><td><?= htmlspecialchars($staff_Fname.' '.$staff_lname) ?></td></tr>
</table>

<!-- Vehicle Images -->
<h2>Vehicle Images</h2>
<?php if (!empty($images)): ?>
<div class="img-container">
<?php foreach($images as $img): ?>
<div class="img-item">
<img src="data:image/jpeg;base64,<?= base64_encode(file_get_contents('../../uploads/vehicles/'.$img['image_path'])) ?>" alt="<?= htmlspecialchars($img['image_label']) ?>">
<div><strong><?= htmlspecialchars($img['image_label']) ?></strong></div>
<div><?= htmlspecialchars($img['image_description']) ?></div>
</div>
<?php endforeach; ?>
</div>
<?php else: ?>
<p>No images uploaded for this vehicle.</p>
<?php endif; ?>

<!-- Last Inspection -->
<h2>Last Inspection</h2>
<?php if ($lastInspection): ?>
<table>
<tr><th>Date</th><td><?= htmlspecialchars($lastInspection['inspection_date']) ?></td></tr>
<tr><th>Tyres</th><td><?= htmlspecialchars($lastInspection['tyres']) ?></td></tr>
<tr><th>Driver's Cabin</th><td><?= htmlspecialchars($lastInspection['drivers_cabin']) ?></td></tr>
<tr><th>Loading Area</th><td><?= htmlspecialchars($lastInspection['loading_area']) ?></td></tr>
<tr><th>Exterior</th><td><?= htmlspecialchars($lastInspection['exterior']) ?></td></tr>
<tr><th>Mechanical</th><td><?= htmlspecialchars($lastInspection['mechanical']) ?></td></tr>
<tr><th>Comments</th><td><?= htmlspecialchars($lastInspection['comments']) ?></td></tr>
<tr><th>Test Driven</th><td><?= htmlspecialchars($lastInspection['test_driven']) ?></td></tr>
<tr><th>Test Drive Comments</th><td><?= htmlspecialchars($lastInspection['test_drive_comments']) ?></td></tr>
</table>
<?php else: ?>
<p>No inspection records found.</p>
<?php endif; ?>

</body>
</html>

<?php
$html = ob_get_clean();

// Initialize Dompdf
$dompdf = new Dompdf();
$dompdf->loadHtml($html);

// Paper size
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();

// Output PDF to browser for download
$dompdf->stream("vehicle_report_".$vehicle['registrationNumber'].".pdf", ["Attachment" => true]);
