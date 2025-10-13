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

// Fetch inspection records for this vehicle

?>
<script>
    function printReport() {
        var printWindow = window.open('print_vahan_report.php?id=<?php echo $vehicle_id; ?>', '_blank');
        printWindow.onload = function() {
            printWindow.print();
        };
    }
</script>
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
        <div class="box-header with-border">
            <h3 class="box-title">Vehicle Details (ID: <?php echo htmlspecialchars($vehicle['id']); ?>)</h3>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-6">
                    <!-- <p><strong>Vehicle No:</strong> <?php echo htmlspecialchars($vehicle['vehicle_no']); ?></p> -->
                    <p><strong>Registration Number:</strong> <?php echo htmlspecialchars($vehicle['registrationNumber']); ?></p>
                    <p><strong>Make:</strong> <?php echo htmlspecialchars($vehicle['make']); ?></p>
                    <p><strong>Model:</strong> <?php echo htmlspecialchars($vehicle['model']); ?></p>
                    <p><strong>Colour:</strong> <?php echo htmlspecialchars($vehicle['colour']); ?></p>
                    <p><strong>Fuel Type:</strong> <?php echo htmlspecialchars($vehicle['fuelType']); ?></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Year of Manufacture:</strong> <?php echo htmlspecialchars($vehicle['yearOfManufacture']); ?></p>
                    <p><strong>Engine Capacity:</strong> <?php echo htmlspecialchars($vehicle['engineCapacity']); ?></p>
                    <p><strong>MOT Due Date:</strong> <?php echo htmlspecialchars($vehicle['motDueDate']); ?></p>
                    <p>
                        <strong>MOT Day:</strong>
                        <?php if ($vehicle['days'] < 0): ?>
                            <span style="color:orange; font-weight:bold;">
                                Expired
                            </span>
                        <?php elseif ($vehicle['days'] <= 90): ?>
                            <span style="color:red; font-weight:bold;">
                                <?php echo htmlspecialchars($vehicle['days']); ?> days
                            </span>
                        <?php else: ?>
                            <span style="color:green; font-weight:bold;">
                                <?php echo htmlspecialchars($vehicle['days']); ?> days
                            </span>
                        <?php endif; ?>
                    </p>
                    <p><strong>Tax Due Date:</strong> <?php echo htmlspecialchars($vehicle['taxDueDate']); ?></p>
                    <!-- <p><strong>Assigned Staff:</strong> <?php echo htmlspecialchars($vehicle['assigned_staff']); ?></p> -->
                    <p><strong>Assigned Staff:</strong> <?php echo htmlspecialchars($staff_Fname . ' ' . $staff_lname); ?></p>
                    <!-- <p><strong>Created:</strong> <?php echo htmlspecialchars($vehicle['created_at']); ?></p> -->
                </div>
            </div>
        </div>
    </div>

    <!-- Vehicle Images -->
    <div class="box box-success">
        <div class="box-header with-border d-flex justify-content-between align-items-center">
            <h3 class="box-title">Vehicle Images</h3>
            <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=edit_van_photos&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                class="btn btn-warning btn-sm float-right">
                <i class="fa fa-edit"></i> Edit Photos
            </a>
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
    <!-- <div class="box box-default">
        <div class="box-header with-border bg-gray">
            <h3 class="box-title">Inspection Test Results</h3>
        </div>
        <div class="box-body">
            <?php if (!empty($tests)): ?>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Test Name</th>
                            <th>Result</th>
                            <th>Remarks</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tests as $index => $test): ?>
                            <tr>
                                <td><?php echo $index + 1; ?></td>
                                <td><?php echo htmlspecialchars($test['test_name']); ?></td>
                                <td><?php echo htmlspecialchars($test['result']); ?></td>
                                <td><?php echo htmlspecialchars($test['remarks']); ?></td>
                                <td><?php echo htmlspecialchars($test['created_at']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p class="text-muted">No inspection tests available for this vehicle.</p>
            <?php endif; ?>
        </div>
    </div> -->

    <div class="box box-default">
        <div class="box-header with-border bg-gray">
            <h3 class="box-title">Vehicle Inspection</h3>
            <a href="<?php echo rtrim(WEB_ROOT, '/'); ?>/modules/Vehicle/index.php?view=edit_inspection_form&vehicle_no=<?= urlencode($vehicle['id']); ?>"
                class="btn btn-warning btn-sm float-right">
                <i class="fa fa-edit"></i> Update Inspection
            </a>
        </div>
        <div class="box-body">
            <form id="inspectionForm">
                <input type="hidden" name="vehicle_id" value="<?php echo $vehicle_id; ?>">

                <!-- Tyres -->
                <div class="form-group">
                    <label class="<?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Good') ? 'text-success fw-bold' : ''; ?>">
                        <input type="radio" name="tyres" value="Good" <?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Good') ? 'checked' : ''; ?> disabled> Good
                    </label>&nbsp;&nbsp;

                    <label class="<?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Close') ? 'text-warning fw-bold' : ''; ?>">
                        <input type="radio" name="tyres" value="Close" <?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Close') ? 'checked' : ''; ?> disabled> Close
                    </label>&nbsp;&nbsp;

                    <label class="<?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Illegal') ? 'text-danger fw-bold' : ''; ?>">
                        <input type="radio" name="tyres" value="Illegal" <?php echo (isset($lastInspection['tyres']) && $lastInspection['tyres'] == 'Illegal') ? 'checked' : ''; ?> disabled> Illegal
                    </label>
                </div>


                <!-- Driver's Cabin -->
                <div class="form-group">
                    <label><strong>Driver's Cabin:</strong></label><br>
                    <label><input type="radio" name="drivers_cabin" value="Very Clean" <?php echo (isset($lastInspection['drivers_cabin']) && $lastInspection['drivers_cabin'] == 'Very Clean') ? 'checked' : ''; ?> disabled> Very Clean</label>&nbsp;&nbsp;
                    <label><input type="radio" name="drivers_cabin" value="Clean" <?php echo (isset($lastInspection['drivers_cabin']) && $lastInspection['drivers_cabin'] == 'Clean') ? 'checked' : ''; ?> disabled> Clean</label>&nbsp;&nbsp;
                    <label><input type="radio" name="drivers_cabin" value="Soiled/Dirty" <?php echo (isset($lastInspection['drivers_cabin']) && $lastInspection['drivers_cabin'] == 'Soiled/Dirty') ? 'checked' : ''; ?> disabled> Soiled/Dirty</label>
                    <div class="mt-2">
                        <label class="text-muted">Upload Photo (Driver's Cabin):</label><br>
                         <?php if (!empty($lastInspection['photo_loading_area'])): ?>
                    <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_loading_area']); ?>" class="img-thumbnail mt-2" style="width:150px;">
                <?php endif; ?>
                    </div>
                </div>

                <!-- Loading Area -->
                <div class="form-group">
                    <label><strong>Loading Area:</strong></label><br>
                    <label><input type="radio" name="loading_area" value="Very Clean" <?php echo (isset($lastInspection['loading_area']) && $lastInspection['loading_area'] == 'Very Clean') ? 'checked' : ''; ?> disabled> Very Clean</label>&nbsp;&nbsp;
                    <label><input type="radio" name="loading_area" value="Clean" <?php echo (isset($lastInspection['loading_area']) && $lastInspection['loading_area'] == 'Clean') ? 'checked' : ''; ?> disabled> Clean</label>&nbsp;&nbsp;
                    <label><input type="radio" name="loading_area" value="Dirty" <?php echo (isset($lastInspection['loading_area']) && $lastInspection['loading_area'] == 'Dirty') ? 'checked' : ''; ?> disabled> Dirty</label>
                    <div class="mt-2">
                        <label class="text-muted">Upload Photo (Loading Area):</label><br>
                         <?php if (!empty($lastInspection['photo_exterior'])): ?>
                    <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_exterior']); ?>" class="img-thumbnail mt-2" style="width:150px;">
                <?php endif; ?>
                    </div>
                </div>

                <!-- Exterior -->
                <div class="form-group">
                    <label><strong>Exterior:</strong></label><br>
                    <label><input type="radio" name="exterior" value="Ready to sell" <?php echo (isset($lastInspection['exterior']) && $lastInspection['exterior'] == 'Ready to sell') ? 'checked' : ''; ?> disabled> Ready to sell</label>&nbsp;&nbsp;
                    <label><input type="radio" name="exterior" value="Polish" <?php echo (isset($lastInspection['exterior']) && $lastInspection['exterior'] == 'Polish') ? 'checked' : ''; ?> disabled> Polish</label>&nbsp;&nbsp;
                    <label><input type="radio" name="exterior" value="Body shop" <?php echo (isset($lastInspection['exterior']) && $lastInspection['exterior'] == 'Body shop') ? 'checked' : ''; ?> disabled> Body shop</label>&nbsp;&nbsp;
                    <label><input type="radio" name="exterior" value="Missing body parts" <?php echo (isset($lastInspection['exterior']) && $lastInspection['exterior'] == 'Missing body parts') ? 'checked' : ''; ?> disabled> Missing body parts</label>
                    <div class="mt-2">
                        <label class="text-muted">Upload Photo (Exterior):</label><br>
                        <?php if (!empty($lastInspection['photo_exterior'])): ?>
                    <img src="../../uploads/inspection_photos/<?= htmlspecialchars($lastInspection['photo_exterior']); ?>" class="img-thumbnail mt-2" style="width:150px;">
                <?php endif; ?>
                    </div>
                </div>

                <!-- Mechanical -->
                <div class="form-group">
                    <label><strong>Mechanical:</strong></label><br>
                    <label><input type="radio" name="mechanical" value="Ready to sell" <?php echo (isset($lastInspection['mechanical']) && $lastInspection['mechanical'] == 'Ready to sell') ? 'checked' : ''; ?> disabled> Ready to sell</label>&nbsp;&nbsp;
                    <label><input type="radio" name="mechanical" value="Warning lights" <?php echo (isset($lastInspection['mechanical']) && $lastInspection['mechanical'] == 'Warning lights') ? 'checked' : ''; ?> disabled> Warning lights</label>&nbsp;&nbsp;
                    <label><input type="radio" name="mechanical" value="Workshop" <?php echo (isset($lastInspection['mechanical']) && $lastInspection['mechanical'] == 'Workshop') ? 'checked' : ''; ?> disabled> Workshop</label>
                </div>

                <!-- Comments -->
                <div class="form-group">
                    <label><strong>Comments:</strong></label>
                    <textarea name="comments" class="form-control" rows="3" readonly><?php echo isset($lastInspection['comments']) ? htmlspecialchars($lastInspection['comments']) : ''; ?></textarea>
                </div>

                <!-- Test Driven Status -->
                <div class="form-group">
                    <label><strong>Is Test Driven?</strong></label><br>
                    <label><input type="radio" name="test_driven" value="Yes" <?php echo (isset($lastInspection['test_driven']) && $lastInspection['test_driven'] == 'Yes') ? 'checked' : ''; ?> disabled> Yes</label>&nbsp;&nbsp;
                    <label><input type="radio" name="test_driven" value="No" <?php echo (isset($lastInspection['test_driven']) && $lastInspection['test_driven'] == 'No') ? 'checked' : ''; ?> disabled> No</label>
                </div>

                <!-- Test Drive Comments -->
                <div class="form-group">
                    <label><strong>Test Drive Comments:</strong></label>
                    <textarea name="test_drive_comments" class="form-control" rows="2" readonly><?php echo isset($lastInspection['test_drive_comments']) ? htmlspecialchars($lastInspection['test_drive_comments']) : ''; ?></textarea>
                </div>

                <!-- Removed Save Button -->
                <!-- <button type="submit" class="btn btn-success">Save Inspection</button> -->
            </form>
        </div>
    </div>
</section>