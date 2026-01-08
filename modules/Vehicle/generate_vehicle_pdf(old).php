<?php
require '../../vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

include('../../includes/db.php');

$vehicle_id = $_GET['id'] ?? null;
if (!$vehicle_id) die("Invalid Vehicle ID");

// ----------------------------------------------------------
// FETCH DATA
// ----------------------------------------------------------
try {
  // Vehicle
  $stmt = $conn->prepare("SELECT * FROM vehicle_details_tbl WHERE id = :id LIMIT 1");
  $stmt->execute([":id" => $vehicle_id]);
  $vehicle = $stmt->fetch(PDO::FETCH_ASSOC);
  if (!$vehicle) die("Vehicle not found!");

  // Branch
  $branch = null;
  if (!empty($vehicle['branch_id'])) {
    $stmtBranch = $conn->prepare("SELECT * FROM branches_tbl WHERE id = :branch_id LIMIT 1");
    $stmtBranch->execute([":branch_id" => $vehicle['branch_id']]);
    $branch = $stmtBranch->fetch(PDO::FETCH_ASSOC);
  }

  // Latest Inspection
  $stmtInspection = $conn->prepare("SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :id ORDER BY inspection_date DESC LIMIT 1");
  $stmtInspection->execute([":id" => $vehicle_id]);
  $inspection = $stmtInspection->fetch(PDO::FETCH_ASSOC);

  // Images
  $stmtImg = $conn->prepare("SELECT * FROM vehicle_images_tbl WHERE vehicle_id = :id ORDER BY id ASC");
  $stmtImg->execute([":id" => $vehicle_id]);
  $images = $stmtImg->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
  die("Database Error: " . $e->getMessage());
}


// ----------------------------------------------------------
// DATA URI HELPER
// ----------------------------------------------------------
function file_to_data_uri($path)
{
  if (!$path || !file_exists($path)) return false;
  $data = file_get_contents($path);
  $mime = mime_content_type($path);
  return "data:$mime;base64," . base64_encode($data);
}


// ----------------------------------------------------------
// LOGO LOAD
// ----------------------------------------------------------
$logoDataUri = null;

if (!empty($branch['logo'])) {
  $logoPath = realpath(__DIR__ . '/../../uploads/branches/' . $branch['logo']);
  if ($logoPath && file_exists($logoPath)) {
    $logoDataUri = file_to_data_uri($logoPath);
  }
}

// ----------------------------------------------------------
// HTML START
// ----------------------------------------------------------
ob_start();
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Vehicle Inspection Report</title>

  <style>
    body {
      font-family: DejaVu Sans, Helvetica, Arial, sans-serif;
      font-size: 12px;
      color: #222;
      margin: 30px;
    }

    .header {
      border-bottom: 2px solid #003366;
      padding-bottom: 15px;
      margin-bottom: 20px;
    }

    /* HEADER WRAPPER */
    .pdf-header {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }

    /* LEFT SIDE */
    .header-left-block {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .header-logo {
      height: 60px;
    }

    .company-text {
      display: flex;
      flex-direction: column;
      line-height: 1.2;
    }

    .company-name {
      font-size: 20px;
      font-weight: bold;
      color: #002f5e;
    }

    .company-tagline {
      font-size: 12px;
      color: #002f5e;
      margin-top: 4px;
    }

    /* RIGHT CONTACT */
    .header-contact {
      text-align: right;
      font-size: 13px;
      color: #000;
    }

    /* REPORT BAR */
    .left-box {
      width: 60%;
      color: #002f5e;
      font-size: 17px;
      font-weight: bold;
      padding: 10px 15px;
    }

    .right-box {
      width: 20%;
      background: #FFD700;
      color: black;
      font-size: 16px;
      font-weight: bold;
      padding: 7px;
      text-align: center;
    }

    /* SECTION TITLES */
    .section-title {
      font-size: 15px;
      font-weight: bold;
      margin-top: 25px;
      color: #003366;
      border-bottom: 2px solid #003366;
      display: inline-block;
      padding-bottom: 3px;
    }

    /* TABLES */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    td,
    th {
      border: 1px solid #ddd;
      padding: 8px;
    }

    th {
      background: #eef3f8;
      width: 35%;
    }

    /* IMAGES */
    .img-container {
      margin-top: 10px;
    }

    .img-item {
      width: 30%;
      display: inline-block;
      margin: 0 10px 15px 0;
      vertical-align: top;
    }

    .img-item img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .img-label {
      margin-top: 5px;
      font-size: 12px;
      font-weight: bold;
    }

    .footer {
      margin-top: 30px;
      border-top: 1px solid #ccc;
      padding-top: 10px;
      font-size: 10px;
      text-align: center;
      color: #777;
    }
  </style>

</head>

<body>

  <!-- ========================= HEADER ========================= -->
  <div class="header">

    <div class="pdf-header">

      <!-- RIGHT -->
      <div class="header-contact">
        01530 833535 | info@fleetauctiongroup.com
      </div>

      <!-- LEFT -->
      <div class="header-left-block">

        <?php if ($logoDataUri): ?>
          <img src="<?= $logoDataUri ?>" class="header-logo">
        <?php endif; ?>

        <div class="company-text">
          <div class="company-name">
            <?= htmlspecialchars($branch['full_name'] ?? 'The Fleet Auction Group') ?>
          </div>
          <div class="company-tagline">
            <?= htmlspecialchars($branch['address'] ?? '') ?>&nbsp;
            <?= htmlspecialchars($branch['pincode'] ?? '') ?>
          </div>
        </div>

      </div>
    </div>

    <!-- REPORT TITLE ROW -->
    <table>
      <tr>
        <td class="left-box">VEHICLE INSPECTION REPORT</td>
        <td class="right-box"><?= htmlspecialchars($vehicle['registrationNumber']) ?></td>
      </tr>
    </table>

  </div>


  <!-- VEHICLE DETAILS -->
  <div class="section">
    <div class="section-title">Vehicle Details</div>
    <table>
      <tr><th>Registration Number</th><td><?= htmlspecialchars($vehicle['registrationNumber']) ?></td></tr>
      <tr><th>Make</th><td><?= htmlspecialchars($vehicle['make']) ?></td></tr>
      <tr><th>Model</th><td><?= htmlspecialchars($vehicle['model']) ?></td></tr>
      <tr><th>Colour</th><td><?= htmlspecialchars($vehicle['colour']) ?></td></tr>
      <tr><th>Fuel Type</th><td><?= htmlspecialchars($vehicle['fuelType']) ?></td></tr>
      <tr><th>Year of Manufacture</th><td><?= htmlspecialchars($vehicle['yearOfManufacture']) ?></td></tr>
      <tr><th>Engine Capacity</th><td><?= htmlspecialchars($vehicle['engineCapacity']) ?></td></tr>
      <tr><th>Chassis Number</th><td><?= htmlspecialchars($vehicle['chassisNumber'] ?? 'N/A') ?></td></tr>
    </table>
  </div>


  <!-- INSPECTION SUMMARY -->
  <?php if ($inspection): ?>
    <div class="section">
      <div class="section-title">Inspection Summary</div>
       <table>
        <tr><th>Inspection Date</th>
            <td><?= htmlspecialchars($inspection['inspection_date']) ?></td>
        </tr>

        <tr><th>Inspector Name</th>
            <td><?= htmlspecialchars($inspection['inspection_by'] ?? 'N/A') ?></td>
        </tr>

        <tr><th>Driver's Cabin Condition</th>
            <td><?= htmlspecialchars($inspection['drivers_cabin'] ?? 'N/A') ?></td>
        </tr>

        <tr><th>Comments</th>
            <td><?= htmlspecialchars($inspection['comments'] ?? 'N/A') ?></td>
        </tr>

        <tr><th>Test Driven</th>
            <td><?= htmlspecialchars($inspection['test_driven'] ?? 'No') ?></td>
        </tr>

        <tr><th>Test Drive Comments</th>
            <td><?= htmlspecialchars($inspection['test_drive_comments'] ?? 'N/A') ?></td>
        </tr>
      </table>
    </div>
  <?php endif; ?>


  <!-- IMAGES -->
  <?php if (!empty($images)): ?>
    <div class="section">
      <div class="section-title">Vehicle Images</div>
      <div class="img-container">

        <?php foreach ($images as $img):
          $path = realpath(__DIR__ . '/../../uploads/vehicles/' . $img['image_path']);
          $imgUri = $path ? file_to_data_uri($path) : false;
        ?>
          <div class="img-item">
            <?php if ($imgUri): ?>
              <img src="<?= $imgUri ?>">
            <?php else: ?>
              <div style="font-size:11px;color:#888;">Image Missing</div>
            <?php endif; ?>
            <div class="img-label"><?= htmlspecialchars($img['image_label']) ?></div>
          </div>
        <?php endforeach; ?>

      </div>
    </div>
  <?php endif; ?>


  <div class="footer">
    Vehicle Inspection Report | Generated on <?= date("d M Y") ?>
  </div>

</body>
</html>

<?php
$html = ob_get_clean();

// ----------------------------------------------------------
// DOMPDF SETTINGS
// ----------------------------------------------------------
$options = new Options();
$options->set("isRemoteEnabled", true);
$options->set("isHtml5ParserEnabled", true);
$options->set("chroot", realpath(__DIR__ . "/../../"));

$dompdf = new Dompdf($options);
$dompdf->loadHtml($html);
$dompdf->setPaper("A4", "portrait");
$dompdf->render();

$filename = "Vehicle_Inspection_Report_" . preg_replace('/\s+/', '_', $vehicle['registrationNumber']) . ".pdf";

$dompdf->stream($filename, ["Attachment" => true]);
exit;
