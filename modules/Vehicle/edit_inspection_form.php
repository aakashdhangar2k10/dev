<?php
include('../../includes/db.php');

$vehicle_id = $_GET['vehicle_no'] ?? 0;
$inspection = null;

// Fetch vehicles + branch
$stmt = $conn->query("
    SELECT v.id, v.vehicle_no, v.branch_id, b.short_name
    FROM vehicle_details_tbl v
    LEFT JOIN branches_tbl b ON v.branch_id = b.id
");
$vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch existing inspection record
if ($vehicle_id) {
    $stmt = $conn->prepare("
        SELECT * FROM vehicle_inspection_tbl WHERE vehicle_id = :vehicle_id LIMIT 1
    ");
    $stmt->execute([':vehicle_id' => $vehicle_id]);
    $inspection = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!-- Content Header -->
<section class="content-header">
    <h1>Vehicle <small>Control Panel</small></h1>
    <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Update Inspection</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Update Inspection Form</h3>
                </div>

                <div class="box-body">
                    <form method="POST" action="controller.php">
                        <input type="hidden" name="action" value="updateInspection">
                        <input type="hidden" name="vehicle_id" value="<?= htmlspecialchars($vehicle_id) ?>">

                        <div class="row">
                            <!-- Vehicle No -->
                            <div class="form-group col-md-6">
                                <label>Vehicle No.</label>
                                <?php
                                $vehicle_selected = null;
                                foreach ($vehicles as $v) {
                                    if ($v['id'] == $vehicle_id) {
                                        $vehicle_selected = $v;
                                        break;
                                    }
                                }
                                ?>
                                <input type="text" class="form-control"
                                       value="<?= $vehicle_selected ? htmlspecialchars($vehicle_selected['vehicle_no']) : '' ?>"
                                       readonly>
                            </div>

                            <!-- Branch -->
                            <div class="form-group col-md-6">
                                <label>Branch</label>
                                <input type="text" id="branchField" class="form-control"
                                       value="<?= $vehicle_selected ? 'Branch: ' . htmlspecialchars($vehicle_selected['short_name']) : '' ?>"
                                       readonly>
                            </div>
                        </div>

                        <hr>

                        <!-- Tyres -->
                        <div class="form-group">
                            <label><strong>Tyres:</strong></label><br>
                            <?php $tyres = $inspection['tyres'] ?? ''; ?>
                            <label><input type="radio" name="tyres" value="Good" <?= ($tyres == 'Good') ? 'checked' : '' ?>> Good</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Close" <?= ($tyres == 'Close') ? 'checked' : '' ?>> Close</label>&nbsp;&nbsp;
                            <label><input type="radio" name="tyres" value="Illegal" <?= ($tyres == 'Illegal') ? 'checked' : '' ?>> Illegal</label>
                        </div>

                        <!-- Driver's Cabin -->
                        <div class="form-group">
                            <label><strong>Driver's Cabin:</strong></label><br>
                            <?php $drivers_cabin = $inspection['drivers_cabin'] ?? ''; ?>
                            <label><input type="radio" name="drivers_cabin" value="Very Clean" <?= ($drivers_cabin == 'Very Clean') ? 'checked' : '' ?>> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Clean" <?= ($drivers_cabin == 'Clean') ? 'checked' : '' ?>> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="drivers_cabin" value="Soiled/Dirty" <?= ($drivers_cabin == 'Soiled/Dirty') ? 'checked' : '' ?>> Soiled/Dirty</label>
                        </div>

                        <!-- Loading Area -->
                        <div class="form-group">
                            <label><strong>Loading Area:</strong></label><br>
                            <?php $loading_area = $inspection['loading_area'] ?? ''; ?>
                            <label><input type="radio" name="loading_area" value="Very Clean" <?= ($loading_area == 'Very Clean') ? 'checked' : '' ?>> Very Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Clean" <?= ($loading_area == 'Clean') ? 'checked' : '' ?>> Clean</label>&nbsp;&nbsp;
                            <label><input type="radio" name="loading_area" value="Dirty" <?= ($loading_area == 'Dirty') ? 'checked' : '' ?>> Dirty</label>
                        </div>

                        <!-- Exterior -->
                        <div class="form-group">
                            <label><strong>Exterior:</strong></label><br>
                            <?php $exterior = $inspection['exterior'] ?? ''; ?>
                            <label><input type="radio" name="exterior" value="Ready to sell" <?= ($exterior == 'Ready to sell') ? 'checked' : '' ?>> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Polish" <?= ($exterior == 'Polish') ? 'checked' : '' ?>> Polish</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Body shop" <?= ($exterior == 'Body shop') ? 'checked' : '' ?>> Body shop</label>&nbsp;&nbsp;
                            <label><input type="radio" name="exterior" value="Missing body parts" <?= ($exterior == 'Missing body parts') ? 'checked' : '' ?>> Missing body parts</label>
                        </div>

                        <!-- Mechanical -->
                        <div class="form-group">
                            <label><strong>Mechanical:</strong></label><br>
                            <?php $mechanical = $inspection['mechanical'] ?? ''; ?>
                            <label><input type="radio" name="mechanical" value="Ready to sell" <?= ($mechanical == 'Ready to sell') ? 'checked' : '' ?>> Ready to sell</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Warning lights" <?= ($mechanical == 'Warning lights') ? 'checked' : '' ?>> Warning lights</label>&nbsp;&nbsp;
                            <label><input type="radio" name="mechanical" value="Workshop" <?= ($mechanical == 'Workshop') ? 'checked' : '' ?>> Workshop</label>
                        </div>

                        <!-- Comments -->
                        <div class="form-group">
                            <label><strong>Comments:</strong></label>
                            <textarea name="comments" class="form-control" rows="3"><?= htmlspecialchars($inspection['comments'] ?? '') ?></textarea>
                        </div>

                        <!-- Test Driven -->
                        <div class="form-group">
                            <label><strong>Is Test Driven?</strong></label><br>
                            <?php $test_driven = $inspection['test_driven'] ?? ''; ?>
                            <label><input type="radio" name="test_driven" value="Yes" <?= ($test_driven == 'Yes') ? 'checked' : '' ?>> Yes</label>&nbsp;&nbsp;
                            <label><input type="radio" name="test_driven" value="No" <?= ($test_driven == 'No') ? 'checked' : '' ?>> No</label>
                        </div>

                        <!-- Test Drive Comments -->
                        <div class="form-group">
                            <label><strong>Test Drive Comments:</strong></label>
                            <textarea name="test_drive_comments" class="form-control" rows="2"><?= htmlspecialchars($inspection['test_drive_comments'] ?? '') ?></textarea>
                        </div>

                        <!-- Submit -->
                        <div class="form-group text-end">
                            <button type="submit" class="btn btn-primary">Update Inspection</button>
                            <a href="index.php" class="btn btn-danger">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
