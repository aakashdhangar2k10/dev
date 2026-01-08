<?php
include('../../includes/db.php'); // PDO connection

// ---------------------------
// Get Vehicle ID
// ---------------------------
$vehicle_id = $_GET['id'] ?? null;
if (!$vehicle_id) {
    die("<div class='alert alert-danger'>Invalid Vehicle ID</div>");
}


// ---------------------------
// HANDLE AJAX UPDATE STAFF
// ---------------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['staff_id'])) {

    $staff_id = $_POST['staff_id'];

    // Update DB
    $update = $conn->prepare("UPDATE vehicle_details_tbl SET assigned_staff = :staff WHERE id = :id");
    $update->execute([
        ":staff" => $staff_id,
        ":id" => $vehicle_id
    ]);

    // Fetch updated name
    $q = $conn->prepare("SELECT fname,lname FROM accounts WHERE acct_id = :id");
    $q->execute([":id" => $staff_id]);
    $name = $q->fetch(PDO::FETCH_ASSOC);

    echo htmlspecialchars($name['fname'] . " " . $name['lname']);
    exit;
}


// ---------------------------
// Fetch vehicle details
// ---------------------------
try {
    $stmt = $conn->prepare("SELECT * FROM vehicle_details_tbl WHERE id = :id LIMIT 1");
    $stmt->execute([":id" => $vehicle_id]);
    $vehicle = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$vehicle) {
        die("<div class='alert alert-warning'>Vehicle not found!</div>");
    }

    // Fetch images
    $stmtImg = $conn->prepare("SELECT * FROM vehicle_images_tbl WHERE vehicle_id = :id ORDER BY id DESC");
    $stmtImg->execute([":id" => $vehicle_id]);
    $images = $stmtImg->fetchAll(PDO::FETCH_ASSOC);

    // Fetch inspection
    $stmtInspections = $conn->prepare("SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :id ORDER BY inspection_date DESC");
    $stmtInspections->execute([":id" => $vehicle_id]);
    $inspections = $stmtInspections->fetchAll(PDO::FETCH_ASSOC);
    $lastInspection = !empty($inspections) ? $inspections[0] : null;
} catch (PDOException $e) {
    die("<div class='alert alert-danger'>Error: " . htmlspecialchars($e->getMessage()) . "</div>");
}


// ---------------------------
// Fetch Assigned Staff
// ---------------------------
$staff_Fname = $staff_lname = "N/A";

if (!empty($vehicle['assigned_staff'])) {
    $stmtStaff = $conn->prepare("SELECT fname,lname FROM accounts WHERE acct_id = :id LIMIT 1");
    $stmtStaff->execute([':id' => $vehicle['assigned_staff']]);
    $staff = $stmtStaff->fetch(PDO::FETCH_ASSOC);
    if ($staff) {
        $staff_Fname = $staff['fname'];
        $staff_lname = $staff['lname'];
    }
}

// Fetch all staff
$staffQuery = $conn->query("SELECT acct_id, fname, lname FROM accounts");
$all_staff = $staffQuery->fetchAll(PDO::FETCH_ASSOC);
?>

<script>
    function printReport() {
        var printWindow = window.open('print_vahan_report.php?id=<?php echo $vehicle_id; ?>', '_blank');
        printWindow.onload = function() {
            printWindow.print();
        };
    }
</script>
<style>
    .bold-select {
        font-weight: bold;
    }
</style>
<!-- Content Header -->
<section class="content-header">
    <h1>Vehicle <small>Control Panel</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Vehicle Details</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <a href="index.php?view=list" class="btn btn-default mb-3">
        <i class="fa fa-arrow-left"></i> Back to List
    </a>
    <button onclick="printReport()" class="btn btn-primary mb-3">
        <i class="fa fa-print"></i> Print Report
    </button>

    <!-- Vehicle Info -->
    <div class="box box-primary">
        <div class="box-header with-border d-flex justify-content-between align-items-center">
            <h3 class="box-title"><strong>Vehicle Details</strong></h3>
        </div>


        <div class="box-body">
            <div class="row">

                <!-- LEFT COLUMN -->
                <div class="col-md-6">

                    <!-- <p><strong>Vehicle No:</strong>
                        <?= htmlspecialchars($vehicle['vehicle_no']) ?>
                    </p> -->

                    <p><strong>Registration Number:
                            <?= htmlspecialchars($vehicle['registrationNumber']) ?>
                        </strong></p>

                    <p><strong>Make:</strong>
                        <?= htmlspecialchars($vehicle['make']) ?>
                    </p>

                    <p><strong>Colour:</strong>
                        <?= htmlspecialchars($vehicle['colour']) ?>
                    </p>

                    <p><strong>Fuel Type:</strong>
                        <?= htmlspecialchars($vehicle['fuelType']) ?>
                    </p>

                    <p><strong>Engine Capacity (CC):</strong>
                        <?= htmlspecialchars($vehicle['engineCapacity']) ?>
                    </p>


                    <!-- <p><strong>Vehicle Age:</strong>
                        <?= htmlspecialchars($vehicle['vehicleAge']) ?>
                    </p> -->
                    
                </div>


                <!-- RIGHT COLUMN -->
                <div class="col-md-6">
                    <p><strong>Model:</strong>
                        <?= htmlspecialchars($vehicle['model']) ?>
                    </p>

                    <p><strong>MOT Due Date:</strong>
                        <?= htmlspecialchars($vehicle['motDueDate']) ?>
                    </p>

                    <p><strong>Year of Manufacture:</strong>
                        <?= htmlspecialchars($vehicle['yearOfManufacture']) ?>
                    </p>
                    <!-- <p><strong>Wheel Plan:</strong>
                        <?= htmlspecialchars($vehicle['wheelplan']) ?>
                    </p> -->

                    <!-- <p><strong>Last V5C Issued:</strong>
                        <?= htmlspecialchars($vehicle['dateOfLastV5CIssued']) ?>
                    </p> -->

                    <!-- <p><strong>Type Approval:</strong>
                        <?= htmlspecialchars($vehicle['typeApproval']) ?>
                    </p> -->

                    <!-- <p><strong>CO₂ Emissions:</strong>
                        <?= htmlspecialchars($vehicle['co2Emissions']) ?>
                    </p> -->

                    <!-- <p><strong>Registration Place:</strong>
                        <?= htmlspecialchars($vehicle['registrationPlace']) ?>
                    </p> -->

                    <!-- <p><strong>Tax Status:</strong>
                        <?= htmlspecialchars($vehicle['taxStatus']) ?>
                    </p> -->

                    <!-- <p><strong>Tax Due Date:</strong>
                        <?= htmlspecialchars($vehicle['taxDueDate']) ?>
                    </p> -->

                    <p><strong>MOT Status:</strong>
                        <?= htmlspecialchars($vehicle['motStatus']) ?>
                    </p>


                    <p><strong>MOT Due Days:</strong>
                        <?php if ($vehicle['days'] < 0): ?>
                            <span style="color:red  ; font-weight:bold;">Expired</span>
                        <?php elseif ($vehicle['days'] <= 90): ?>
                            <span style="color:red; font-weight:bold;"><?= htmlspecialchars($vehicle['days']) ?> days</span>
                        <?php else: ?>
                            <span style="color:green; font-weight:bold;"><?= htmlspecialchars($vehicle['days']) ?> days</span>
                        <?php endif; ?>
                    </p>


                    <!-- ASSIGNED STAFF -->
                    <p>
                        <strong>Assigned Staff:</strong>
                        <span id="assignedStaffText">
                            <?= htmlspecialchars($staff_Fname . ' ' . $staff_lname) ?>
                        </span>

                        <?php if ($_SESSION['type'] == 'Administrator'): ?>
                            <a class="btn btn-warning btn-sm float-right" onclick="showStaffEdit()">
                                <i class="fa fa-edit"></i> Update Staff
                            </a>
                        <?php endif; ?>
                    </p>

                    <!-- STAFF EDIT DROPDOWN -->
                    <?php if ($_SESSION['type'] == 'Administrator'): ?>
                        <div id="staffEditBox" style="display:none; margin-top:8px;">

                            <select id="staffSelect" class="form-control" style="width:220px; display:inline-block;">
                                <option value="">Select Staff</option>
                                <?php foreach ($all_staff as $s): ?>
                                    <option value="<?= $s['acct_id'] ?>">
                                        <?= htmlspecialchars($s['fname'] . " " . $s['lname']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>

                            <button class="btn btn-success btn-sm float-right"
                                onclick="updateStaff(<?= $vehicle_id ?>)">
                                Update
                            </button>
                        </div>
                    <?php endif; ?>

                </div>

            </div>
        </div>
    </div>


    <!-- Vehicle Images -->
    <div class="box box-primary">
        <!-- <div class="box-header with-border d-flex justify-content-between align-items-center">
            <h3 class="box-title"> <strong>Vehicle Images</strong></h3>
            <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=edit_van_photos&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                class="btn btn-warning btn-sm float-right">
                <i class="fa fa-edit"></i> Update Photos
            </a>
        </div> -->
        <div class="box-header with-border">
            <h3 class="box-title"><strong>Vehicle Images</strong></h3>
            <?php if ($images): ?>
                <!-- Show Update button if inspection exists -->
                <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=edit_van_photos&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                    class="btn btn-warning btn-sm float-right">
                    <i class="fa fa-edit"></i> Update Photos
                </a>
            <?php else: ?>
                <!-- Show Add Inspection button if no inspection exists -->
                <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=add_van&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                    class="btn btn-success btn-sm float-right">
                    <i class="fa fa-plus"></i> Add Photos
                </a>
            <?php endif; ?>
        </div>
        <div class="box-body">
            <?php if (!empty($images)): ?>
                <div class="row">
                    <?php foreach ($images as $img): ?>
                        <div class="col-md-4">
                            <div class="box box-solid">
                                <div class="box-body text-center">
                                    <img src="../../uploads/vehicles/<?php echo htmlspecialchars($img['image_path']); ?>"
                                        alt="<?php echo htmlspecialchars($img['image_label']); ?>"
                                        class="img-responsive img-thumbnail">
                                    <h5 class="mt-2">
                                        <strong><?php echo htmlspecialchars($img['image_label']); ?></strong>
                                    </h5>
                                    <p class="text-muted"><?php echo htmlspecialchars($img['image_description']); ?></p>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php else: ?>
                <p class="text-muted">No images uploaded for this vehicle.</p>
            <?php endif; ?>
        </div>
    </div>


    <!-- Inspection Tests -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><strong>Vehicle Inspection</strong></h3>
            <?php if ($lastInspection): ?>
                <!-- Show Update button if inspection exists -->
                <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=edit_inspection_form&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                    class="btn btn-warning btn-sm float-right">
                    <i class="fa fa-edit"></i> Update Inspection
                </a>

            <?php else: ?>
                <!-- Show Add Inspection button if no inspection exists -->
                <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=inspection&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                    class="btn btn-success btn-sm float-right">
                    <i class="fa fa-plus"></i> Add Inspection
                </a>
            <?php endif; ?>
        </div>

        <div class="box-body">

            <?php if (!$lastInspection): ?>
                <p class="text-muted"><strong>No inspection done yet.</strong></p>

            <?php else: ?>
                <form id="inspectionForm">
                    <input type="hidden" name="vehicle_id" value="<?php echo $vehicle_id; ?>">

                    <!-- Tyres -->
                    <div class="form-group">
                        <label><strong> Tyres:</strong></label><br>

                        <label class="<?php echo ($lastInspection['tyres'] == 'Good') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="tyres" value="Good"
                                <?php echo ($lastInspection['tyres'] == 'Good') ? 'checked' : ''; ?> disabled>
                            Good
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['tyres'] == 'Close') ? 'text-warning fw-bold' : ''; ?>">
                            <input type="radio" name="tyres" value="Close"
                                <?php echo ($lastInspection['tyres'] == 'Close') ? 'checked' : ''; ?> disabled>
                            Close
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['tyres'] == 'Illegal') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="tyres" value="Illegal"
                                <?php echo ($lastInspection['tyres'] == 'Illegal') ? 'checked' : ''; ?> disabled>
                            Illegal
                        </label>
                    </div>


                    <!-- Driver's Cabin -->
                    <div class="form-group">
                        <label><strong>Driver's Cabin:</strong></label><br>

                        <label class="<?php echo ($lastInspection['drivers_cabin'] == 'Very Clean') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="drivers_cabin" value="Very Clean"
                                <?php echo ($lastInspection['drivers_cabin'] == 'Very Clean') ? 'checked' : ''; ?> disabled>
                            Very Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['drivers_cabin'] == 'Clean') ? 'text-primary fw-bold' : ''; ?>">
                            <input type="radio" name="drivers_cabin" value="Clean"
                                <?php echo ($lastInspection['drivers_cabin'] == 'Clean') ? 'checked' : ''; ?> disabled>
                            Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['drivers_cabin'] == 'Soiled/Dirty') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="drivers_cabin" value="Soiled/Dirty"
                                <?php echo ($lastInspection['drivers_cabin'] == 'Soiled/Dirty') ? 'checked' : ''; ?> disabled>
                            Soiled/Dirty
                        </label>

                        <div class="mt-2">
                            <label class="text-muted">Upload Photo (Driver's Cabin):</label><br>
                            <?php if (!empty($lastInspection['photo_drivers_cabin'])): ?>
                                <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_drivers_cabin']); ?>"
                                    class="img-thumbnail mt-2" style="width:150px;">
                            <?php endif; ?>
                        </div>
                    </div>


                    <!-- Loading Area -->
                    <div class="form-group">
                        <label><strong>Loading Area:</strong></label><br>

                        <label class="<?php echo ($lastInspection['loading_area'] == 'Very Clean') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="loading_area" value="Very Clean"
                                <?php echo ($lastInspection['loading_area'] == 'Very Clean') ? 'checked' : ''; ?> disabled>
                            Very Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['loading_area'] == 'Clean') ? 'text-primary fw-bold' : ''; ?>">
                            <input type="radio" name="loading_area" value="Clean"
                                <?php echo ($lastInspection['loading_area'] == 'Clean') ? 'checked' : ''; ?> disabled>
                            Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['loading_area'] == 'Dirty') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="loading_area" value="Dirty"
                                <?php echo ($lastInspection['loading_area'] == 'Dirty') ? 'checked' : ''; ?> disabled>
                            Dirty
                        </label>

                        <div class="mt-2">
                            <label class="text-muted">Upload Photo (Loading Area):</label><br>
                            <?php if (!empty($lastInspection['photo_loading_area'])): ?>
                                <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_loading_area']); ?>"
                                    class="img-thumbnail mt-2" style="width:150px;">
                            <?php endif; ?>
                        </div>
                    </div>


                    <!-- Exterior -->
                    <div class="form-group">
                        <label><strong>Exterior:</strong></label><br>

                        <label class="<?php echo ($lastInspection['exterior'] == 'Ready to sell') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="exterior" value="Ready to sell"
                                <?php echo ($lastInspection['exterior'] == 'Ready to sell') ? 'checked' : ''; ?> disabled>
                            Ready to sell
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['exterior'] == 'Polish') ? 'text-warning fw-bold' : ''; ?>">
                            <input type="radio" name="exterior" value="Polish"
                                <?php echo ($lastInspection['exterior'] == 'Polish') ? 'checked' : ''; ?> disabled>
                            Polish
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['exterior'] == 'Body shop') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="exterior" value="Body shop"
                                <?php echo ($lastInspection['exterior'] == 'Body shop') ? 'checked' : ''; ?> disabled>
                            Body shop
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['exterior'] == 'Missing body parts') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="exterior" value="Missing body parts"
                                <?php echo ($lastInspection['exterior'] == 'Missing body parts') ? 'checked' : ''; ?> disabled>
                            Missing body parts
                        </label>

                        <div class="mt-2">
                            <label class="text-muted">Upload Photo (Exterior):</label><br>
                            <?php if (!empty($lastInspection['photo_exterior'])): ?>
                                <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_exterior']); ?>"
                                    class="img-thumbnail mt-2" style="width:150px;">
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Engine Compartment -->
                    <div class="form-group">
                        <label><strong>Engine Compartment:</strong></label><br>

                        <label class="<?= ($lastInspection['engine_compartment'] == 'Very Clean') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="engine_compartment" value="Very Clean"
                                <?= ($lastInspection['engine_compartment'] == 'Very Clean') ? 'checked' : ''; ?> disabled>
                            Very Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?= ($lastInspection['engine_compartment'] == 'Clean') ? 'text-warning fw-bold' : ''; ?>">
                            <input type="radio" name="engine_compartment" value="Clean"
                                <?= ($lastInspection['engine_compartment'] == 'Clean') ? 'checked' : ''; ?> disabled>
                            Clean
                        </label>&nbsp;&nbsp;

                        <label class="<?= ($lastInspection['engine_compartment'] == 'Dirty') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="engine_compartment" value="Dirty"
                                <?= ($lastInspection['engine_compartment'] == 'Dirty') ? 'checked' : ''; ?> disabled>
                            Dirty
                        </label>

                        <div class="mt-2">
                            <label class="text-muted">Photo (Engine Compartment):</label><br>
                            <?php if (!empty($lastInspection['photo_engine_compartment'])): ?>
                                <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_engine_compartment']); ?>"
                                    class="img-thumbnail mt-2" style="width:150px;">
                            <?php endif; ?>
                        </div>
                    </div>



                    <!-- Mechanical -->
                    <div class="form-group">
                        <label><strong>Mechanical:</strong></label><br>

                        <label class="<?php echo ($lastInspection['mechanical'] == 'Ready to sell') ? 'text-success fw-bold' : ''; ?>">
                            <input type="radio" name="mechanical" value="Ready to sell"
                                <?php echo ($lastInspection['mechanical'] == 'Ready to sell') ? 'checked' : ''; ?> disabled>
                            Ready to sell
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['mechanical'] == 'Warning lights') ? 'text-warning fw-bold' : ''; ?>">
                            <input type="radio" name="mechanical" value="Warning lights"
                                <?php echo ($lastInspection['mechanical'] == 'Warning lights') ? 'checked' : ''; ?> disabled>
                            Warning lights
                        </label>&nbsp;&nbsp;

                        <label class="<?php echo ($lastInspection['mechanical'] == 'Workshop') ? 'text-danger fw-bold' : ''; ?>">
                            <input type="radio" name="mechanical" value="Workshop"
                                <?php echo ($lastInspection['mechanical'] == 'Workshop') ? 'checked' : ''; ?> disabled>
                            Workshop
                        </label>
                    </div>


                    <!-- Comments -->
                    <div class="form-group">
                        <label><strong>Comments:</strong></label>
                        <textarea name="comments" class="form-control" rows="3" readonly><?php echo htmlspecialchars($lastInspection['comments']); ?></textarea>
                    </div>

                    <!-- Test Driven -->
                    <div class="form-group">
                        <label><strong>Is Test Driven?</strong></label><br>
                        <label><input type="radio" name="test_driven" value="Yes" <?php echo ($lastInspection['test_driven'] == 'Yes') ? 'checked' : ''; ?> disabled> Yes</label>&nbsp;&nbsp;
                        <label><input type="radio" name="test_driven" value="No" <?php echo ($lastInspection['test_driven'] == 'No') ? 'checked' : ''; ?> disabled> No</label>
                    </div>

                    <!-- Test Drive Comments -->
                    <div class="form-group">
                        <label><strong>Test Drive Comments:</strong></label>
                        <textarea name="test_drive_comments" class="form-control" rows="2" readonly><?php echo htmlspecialchars($lastInspection['test_drive_comments']); ?></textarea>
                    </div>

                </form>
            <?php endif; ?>
        </div>
    </div>

</section>
<script>
    function showStaffEdit() {
        document.getElementById('staffEditBox').style.display = 'block';
    }

    function updateStaff(vehicleId) {
        const staffId = document.getElementById('staffSelect').value;

        if (!staffId) {
            alert("Please select staff.");
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onload = function() {
            if (this.status === 200) {
                document.getElementById('assignedStaffText').innerHTML = this.responseText;
                document.getElementById('staffEditBox').style.display = 'none';
                alert("Assigned Staff Updated Successfully!");
                // 🔄 Refresh page
                location.reload();
            }
        };
        xhr.send("staff_id=" + staffId);
    }
</script>